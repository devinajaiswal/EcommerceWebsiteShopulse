package in.co.ecommerce.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="E_USER")
public class UserEntity extends BaseEntity {

	@Column(name="FIRST_NAME" ,length = 225)
	private String firstName;
	
	@Column(name="LAST_NAME" ,length = 225)
	private String lastName;
	
	@Column(name="LOGIN" ,length = 225)
	private String loginId;
	
	@Column(name="PASSWORD" ,length = 225)
	private String password;
	
	@Column(name="MOBILE_NO" ,length = 225)
	private String mobileNo;
	
	@Column(name="EMAIL_ID" ,length = 225)
	private String emailId;
	
	@Column(name="ROLE_ID")
	private long roleId;
	
	public UserEntity() {
	
	}

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
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public long getRoleId() {
		return roleId;
	}
	public void setRoleId(long roleId) {
		this.roleId = roleId;
	}


	@Override
	public String toString() {
		return "UserEntity [firstName=" + firstName + ", lastName=" + lastName + ", loginId=" + loginId + ", password="
				+ password + ", mobileNo=" + mobileNo + ", emailId=" + emailId + ", roleId=" + roleId + ", id=" + id
				+ ", createdBy=" + createdBy + ", modifiedBy=" + modifiedBy + ", createdDateTime=" + createdDateTime
				+ ", modifiedDateTime=" + modifiedDateTime + "]";
	}

	@Override
	public String getKey() {
		// TODO Auto-generated method stub
		return String.valueOf(id);
	}

	@Override
	public String getValue() {
		// TODO Auto-generated method stub
		return firstName+" "+lastName;
	}

}
