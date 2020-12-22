package in.co.ecommerce.form;

import java.io.IOException;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.springframework.web.multipart.MultipartFile;

import in.co.ecommerce.entity.BaseEntity;
import in.co.ecommerce.entity.ProductEntity;

public class ProductForm extends BaseForm {

	@NotEmpty(message="Name is required")
	private String name;
	
	@NotEmpty(message="Code is required")
	@Pattern(regexp = "^((\\d{1,3}|\\s*){1})((\\,\\d{3}|\\d)*)(\\s*|\\.(\\d{2}))$", message = "Code is Invalid")
	private String code;
	
	@NotEmpty(message="Price is required")
	@Pattern(regexp = "^((\\d{1,3}|\\s*){1})((\\,\\d{3}|\\d)*)(\\s*|\\.(\\d{2}))$", message = "Price is Invalid")
	private String price;
	
	@NotEmpty(message="Description is required")
	private String description;
	
	@NotEmpty(message="Quantity is required")
	@Pattern(regexp = "^((\\d{1,3}|\\s*){1})((\\,\\d{3}|\\d)*)(\\s*|\\.(\\d{2}))$", message = "Quantity is Invalid")
	private String quantity;
	
	private MultipartFile image;
	
	
	
	

	

	

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	@Override
	public BaseEntity getBean() {
		ProductEntity bean=new ProductEntity();
		bean.setId(id);
		bean.setName(name);
		bean.setCode(code);
		bean.setPrice(price);
		bean.setDescription(description);
		bean.setQuantity(quantity);
		bean.setCreatedBy(createdBy);
		bean.setModifiedBy(modifiedBy);
		bean.setCreatedDateTime(createdDateTime);
		bean.setModifiedDateTime(modifiedDateTime);
		return bean;
	}

	@Override
	public void populate(BaseEntity baseBean) {
		ProductEntity bean=(ProductEntity)baseBean;
		id=bean.getId();
		name=bean.getName();
		code=bean.getCode();
		price=bean.getPrice();
		description=bean.getDescription();
		quantity=bean.getQuantity();
		createdBy=bean.getCreatedBy();
		modifiedBy=bean.getModifiedBy();
		createdDateTime=bean.getCreatedDateTime();
		modifiedDateTime=bean.getModifiedDateTime();
	}

}
