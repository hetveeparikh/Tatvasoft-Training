package helperlanduser.model;

import java.util.Date;

public class Customer {
	
	private int UserId;
	private String FirstName;
	private String LastName;
	private String Email;
	private String Password;
	private String Mobile;
	private int UserTypeId;
	private Date CreatedDate;
	private String DateOfBirth;
	private String Language;
	
	public String getFirstName() {
		return FirstName;
	}
	public void setFirstName(String firstName) {
		FirstName = firstName;
	}
	public String getLastName() {
		return LastName;
	}
	public void setLastName(String lastName) {
		LastName = lastName;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getMobile() {
		return Mobile;
	}
	public void setMobile(String mobile) {
		Mobile = mobile;
	}
	public int getUserTypeId() {
		return UserTypeId;
	}
	public void setUserTypeId(int userTypeId) {
		UserTypeId = userTypeId;
	}
	public Date getCreatedDate() {
		return CreatedDate;
	}
	public void setCreatedDate(Date createdDate) {
		CreatedDate = createdDate;
	}
	public int getUserId() {
		return UserId;
	}
	public void setUserId(int userId) {
		UserId = userId;
	}
	public String getDateOfBirth() {
		return DateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		DateOfBirth = dateOfBirth;
	}
	public String getLanguage() {
		return Language;
	}
	public void setLanguage(String language) {
		Language = language;
	}
	@Override
	public String toString() {
		return "Customer [UserId=" + UserId + ", FirstName=" + FirstName + ", LastName=" + LastName + ", Email=" + Email
				+ ", Password=" + Password + ", Mobile=" + Mobile + ", UserTypeId=" + UserTypeId + ", CreatedDate="
				+ CreatedDate + ", DateOfBirth=" + DateOfBirth + ", Language=" + Language + "]";
	}
	
	
	
	
}
