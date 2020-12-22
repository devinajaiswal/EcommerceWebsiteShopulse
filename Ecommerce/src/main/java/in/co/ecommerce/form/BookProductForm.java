package in.co.ecommerce.form;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import in.co.ecommerce.entity.BaseEntity;
import in.co.ecommerce.entity.BookProductEntity;

public class BookProductForm extends BaseForm {

	@NotEmpty(message="Name is required")
	private String name;
	@NotEmpty(message="Email is required")
	private String emailId;
	@NotEmpty(message="Mobile No is required")
	@Pattern(regexp="(^[0-9][0-9]{9})*$",message = "MobileNo is Invalid")
	private String mobileNo;
	@NotEmpty(message="Country is required")
	private String country;
	@NotEmpty(message="State is required")
	private String state;
	@NotEmpty(message="District is required")
	private String district;
	@NotEmpty(message="Pincode is required")
	@Pattern(regexp = "^((\\d{1,3}|\\s*){1})((\\,\\d{3}|\\d)*)(\\s*|\\.(\\d{2}))$", message = "Pincode is Invalid")
	private String pinCode;
	@NotEmpty(message="Address is required")
	private String address;
	@NotEmpty(message="Quantity is required")
	@Pattern(regexp = "^((\\d{1,3}|\\s*){1})((\\,\\d{3}|\\d)*)(\\s*|\\.(\\d{2}))$", message = "Quantity is Invalid")
	private String quantity;
	
	private String amount;
	private long userId;
	private long productId;
	private String productName;
	
	
	
	
	
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Override
	public String toString() {
		return "BookProductForm [name=" + name + ", emailId=" + emailId + ", mobileNo=" + mobileNo + ", country="
				+ country + ", state=" + state + ", district=" + district + ", pinCode=" + pinCode + ", address="
				+ address + ", quantity=" + quantity + ", amount=" + amount + ", userId=" + userId + ", productId="
				+ productId + "]";
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public long getProductId() {
		return productId;
	}

	public void setProductId(long productId) {
		this.productId = productId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getPinCode() {
		return pinCode;
	}

	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	@Override
	public BaseEntity getBean() {
		BookProductEntity bean=new BookProductEntity();
		bean.setId(id);
		bean.setName(name);
		bean.setEmailId(emailId);
		bean.setMobileNo(mobileNo);
		bean.setCountry(country);
		bean.setState(state);
		bean.setDistrict(district);
		bean.setPincode(pinCode);
		bean.setAddress(address);
		bean.setQuantity(quantity);
		bean.setUserId(userId);
		bean.setProductId(productId);
		bean.setProductName(productName);
		bean.setAnmount(amount);
		bean.setCreatedBy(createdBy);
		bean.setModifiedBy(modifiedBy);
		bean.setCreatedDateTime(createdDateTime);
		bean.setModifiedDateTime(modifiedDateTime);
		return bean;
	}

	@Override
	public void populate(BaseEntity baseBean) {
		BookProductEntity bean=(BookProductEntity) baseBean;
		id=bean.getId();
		name=bean.getName();
		emailId=bean.getEmailId();
		mobileNo=bean.getMobileNo();
		country=bean.getCountry();
		state=bean.getState();
		district=bean.getDistrict();
		pinCode=bean.getPincode();
		address=bean.getAddress();
		quantity=bean.getQuantity();
		userId=bean.getUserId();
		productId=bean.getProductId();
		productName=bean.getProductName();
		amount=bean.getAnmount();
		createdBy=bean.getCreatedBy();
		modifiedBy=bean.getModifiedBy();
		createdDateTime=bean.getCreatedDateTime();
		modifiedDateTime=bean.getModifiedDateTime();
	}

}
