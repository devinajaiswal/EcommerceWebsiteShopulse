package in.co.ecommerce.controller;


import java.util.List;

import javax.persistence.criteria.From;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import in.co.ecommerce.entity.BookProductEntity;
import in.co.ecommerce.entity.ProductEntity;
import in.co.ecommerce.entity.UserEntity;
import in.co.ecommerce.form.BookProductForm;
import in.co.ecommerce.form.ProductForm;
import in.co.ecommerce.service.BookProductServiceInt;
import in.co.ecommerce.service.ProductServiceInt;
import in.co.ecommerce.util.DataUtility;

@Controller
@RequestMapping("/bookProd")
public class BookProductCtl extends BaseCtl {

	@Autowired
	private ProductServiceInt productService;
	
	@Autowired
	private BookProductServiceInt service;
	
	@GetMapping
	public String display(@RequestParam("pid") Long pId,HttpSession session,@ModelAttribute("form") BookProductForm form, Model model) {
		
		if(pId>0) {
			ProductEntity bean=productService.findByPk(pId);
			session.setAttribute("prod",bean);
			model.addAttribute("prod", bean);
			UserEntity uBean=(UserEntity) session.getAttribute("userLogin");
			BookProductEntity bPro=new BookProductEntity();
			bPro.setName(uBean.getFirstName()+" "+uBean.getLastName());
			bPro.setEmailId(uBean.getEmailId());
			bPro.setMobileNo(uBean.getMobileNo());
			form.populate(bPro);
		}
		return "book-product-form";
	}
	
	@PostMapping
	public String submit(@Valid @ModelAttribute("form") BookProductForm form, BindingResult bindingResult,
			Model model,HttpSession session) {
		if (OP_RESET.equalsIgnoreCase(form.getOperation())) {
			return "redirect:/prod/search";
		}
		
		ProductEntity pBean=(ProductEntity)session.getAttribute("prod");
		model.addAttribute("prod", pBean);
		System.out.println(form.getOperation());
		UserEntity uBean=(UserEntity)session.getAttribute("userLogin");
		BookProductEntity bean=(BookProductEntity)form.getBean();
		try {
			if (OP_PAYMENT.equalsIgnoreCase(form.getOperation())) {
				System.out.println("Before"+form.getOperation());
				if (bindingResult.hasErrors()) {
					System.out.println(bindingResult);
					return "book-product-form";
				}
				System.out.println(bean);
				if(uBean!=null) {
				bean.setUserId(uBean.getId());
				}
				bean.setProductId(pBean.getId());
				bean.setProductName(pBean.getName());
				bean.setDate(DataUtility.getCurrentTimestamp());
				long amount=DataUtility.getLong(pBean.getPrice())*DataUtility.getLong(bean.getQuantity());
				bean.setAnmount(String.valueOf(amount));
				session.setAttribute("pBDetail",bean);
				return "payment";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return "book-product-form";
		} 
		return "payment";
	}
	
	
	@PostMapping("/payment")
	public String submit(@RequestParam("operation") String operation,
			Model model,HttpSession session) {
		
		try {
			if (OP_CONFIRM_PAYMENT.equalsIgnoreCase(operation)) {
				
				BookProductEntity bean=(BookProductEntity)session.getAttribute("pBDetail");
				bean.setCreatedBy("root");
				bean.setModifiedBy("root");
				bean.setCreatedDateTime(DataUtility.getCurrentTimestamp());
				bean.setModifiedDateTime(DataUtility.getCurrentTimestamp());
				service.add(bean);
				model.addAttribute("success","Product Booked Successfully!!");
				ProductEntity pBean=(ProductEntity)session.getAttribute("prod");
				pBean.setPrice(bean.getAnmount());
				model.addAttribute("prod", pBean);
				return "success";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return "payment";
		} 
		return "success";
	}
	
	@RequestMapping(value = "/search", method = { RequestMethod.GET, RequestMethod.POST })
	public String searchList(@ModelAttribute("form") BookProductForm form,
			@RequestParam(required = false) String operation,HttpSession session, Model model) {

		if (OP_RESET.equalsIgnoreCase(operation)) {
			return "redirect:/bookProd/search";
		}

		int pageNo = form.getPageNo();
		int pageSize = form.getPageSize();

		if (OP_NEXT.equals(operation)) {
			pageNo++;
		} else if (OP_PREVIOUS.equals(operation)) {
			pageNo--;
		}

		pageNo = (pageNo < 1) ? 1 : pageNo;
		pageSize = (pageSize < 1) ? 10 : pageSize;

		if (OP_DELETE.equals(operation)) {
			pageNo = 1;
			if (form.getIds() != null) {
				for (long id : form.getIds()) {
					BookProductEntity bean = new BookProductEntity();
					bean.setId(id);
					service.delete(bean);
				}
				model.addAttribute("success","Deleted Successfully!!!");
			} else {
				model.addAttribute("error","Select at least one record");
			}
		}
		
		BookProductEntity bean=(BookProductEntity)form.getBean();
		UserEntity uBean=(UserEntity)session.getAttribute("userLogin");
		if(uBean.getRoleId()==3) {
			bean.setUserId(uBean.getId());
		}
		List<BookProductEntity> list =service.search(bean, pageNo, pageSize);
		List<BookProductEntity> totallist =service.search(bean);
		model.addAttribute("list", list);
		
		

		if (list.size() == 0 && !OP_DELETE.equalsIgnoreCase(operation)) {
			model.addAttribute("error","Record not found");
		}

		int listsize = list.size();
		int total = totallist.size();
		int pageNoPageSize = pageNo * pageSize;

		form.setPageNo(pageNo);
		form.setPageSize(pageSize);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("listsize", listsize);
		model.addAttribute("total", total);
		model.addAttribute("pagenosize", pageNoPageSize);
		model.addAttribute("form", form);
		return "book-product-list";
	}
	
}
