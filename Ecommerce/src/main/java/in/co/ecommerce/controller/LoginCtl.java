package in.co.ecommerce.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import in.co.ecommerce.entity.UserEntity;
import in.co.ecommerce.exception.DuplicateRecordException;
import in.co.ecommerce.form.LoginForm;
import in.co.ecommerce.form.UserRegistrationForm;
import in.co.ecommerce.service.UserServiceInt;
import in.co.ecommerce.util.DataUtility;

@Controller
public class LoginCtl extends BaseCtl {

	protected static final String OP_SIGNIN = "SignIn";
	protected static final String OP_SIGNUP = "SignUp";
	protected static final String OP_LOGOUT = "Logout";
	protected static final String OP_rese = "Logout";

	@Autowired
	private UserServiceInt service;

	@GetMapping("/login")
	public String display(@RequestParam(required = false) Long pid,@ModelAttribute("form") LoginForm form, HttpSession session, Model model) {

		System.out.println("In doget LoginCtl");

		if(DataUtility.getLong(String.valueOf(pid))>0) {
			session.setAttribute("pid", pid);
		}
		
		if (session.getAttribute("userLogin") != null) {
			session.invalidate();
			model.addAttribute("success", "You have logout Successfully!!!");
		}
		return "login";
	}

	@PostMapping("/login")
	public String display(@RequestParam String operation, HttpSession session,
			@Valid  @ModelAttribute("form")  LoginForm form, BindingResult result, Model model) {

		System.out.println("In dopost  LoginCtl");

		

		if (OP_SIGNUP.equalsIgnoreCase(form.getOperation())) {
			return "redirect:signUp";
		}
		
		if (result.hasErrors()) {
			return "login";
		}
		
		UserEntity bean = service.authenticate((UserEntity) form.getBean());
		
		if (bean != null) {
			session.setAttribute("userLogin", bean);
			long pid=DataUtility.getLong(String.valueOf(session.getAttribute("pid")));
			if(pid>0) {
				return "redirect:/bookProd?pid="+pid;
			}else {
			return "redirect:/welcome";
			}
		}
		model.addAttribute("error", "Login Id Password Invalid");
		return "login";
	}

	@GetMapping("/signUp")
	public String display(@ModelAttribute("form") UserRegistrationForm form, Model model) {
		return "user-registration";
	}

	@PostMapping("/signUp")
	public String submit(@Valid @ModelAttribute("form")  UserRegistrationForm form, BindingResult bindingResult,
			Model model) {

		if (OP_RESET.equalsIgnoreCase(form.getOperation())) {
			return "redirect:signUp";
		}

		try {
			if (OP_SAVE.equalsIgnoreCase(form.getOperation())) {
			
				if (bindingResult.hasErrors()) {
					return "user-registration";
				}
				
				UserEntity bean = (UserEntity) form.getBean();
				bean.setRoleId(3L);
				bean.setCreatedBy("root");
				bean.setModifiedBy("root");
				bean.setCreatedDateTime(DataUtility.getCurrentTimestamp());
				bean.setModifiedDateTime(DataUtility.getCurrentTimestamp());
				service.registerUser(bean);
				model.addAttribute("success", "User Registerd Successfully!!!!");
				return "user-registration";
			}
		} catch (DuplicateRecordException e) {
			model.addAttribute("error", e.getMessage());
			return "user-registration";
		}
		return "";
	}

}