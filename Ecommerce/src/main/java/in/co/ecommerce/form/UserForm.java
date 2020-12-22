package in.co.ecommerce.form;

import javax.validation.constraints.NotEmpty;

import in.co.ecommerce.entity.BaseEntity;
import in.co.ecommerce.entity.UserEntity;

public class UserForm extends BaseForm {

	@NotEmpty(message="First Name is required")
	private String firstName;
	
	@NotEmpty(message="Last Name is required")
	private String lastName;
	
	@NotEmpty(message="Login is required")
	private String login;
	
	@NotEmpty(message="Password is required")
	private String password;
	
	@NotEmpty(message="Email Id is required")
	private String emailId;
	
	@NotEmpty(message="Mobile is required")
	private String mobileNo;
	
	
	
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	@Override
	public BaseEntity getBean() {
		UserEntity bean=new UserEntity();
		bean.setId(id);
		bean.setFirstName(firstName);
		bean.setLastName(lastName);
		bean.setLoginId(login);
		bean.setPassword(password);
		bean.setEmailId(emailId);
		bean.setMobileNo(mobileNo);
		bean.setCreatedBy(createdBy);
		bean.setModifiedBy(modifiedBy);
		bean.setCreatedDateTime(createdDateTime);
		bean.setModifiedDateTime(modifiedDateTime);
		return bean;
	}

	@Override
	public void populate(BaseEntity baseBean) {
		UserEntity bean=(UserEntity)baseBean;
		id=bean.getId();
		firstName=bean.getFirstName();
		lastName=bean.getLastName();
		login=bean.getLoginId();
		password=bean.getPassword();
		emailId=bean.getEmailId();
		mobileNo=bean.getMobileNo();
		createdBy=bean.getCreatedBy();
		modifiedBy=bean.getModifiedBy();
		createdDateTime=bean.getCreatedDateTime();
		modifiedDateTime=bean.getModifiedDateTime();
	}

}
