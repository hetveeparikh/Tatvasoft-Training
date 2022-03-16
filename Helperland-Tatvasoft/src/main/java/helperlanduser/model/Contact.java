package helperlanduser.model;

import java.util.Date;

public class Contact {
	private int contactUsId;
	private String fName;
	private String lName;
	private String email;
	private String subject;
	private String phoneNumber;
	private String message;
	private String uploadFileName;
	private Date createdOn;
	private int createdBy;
	public int getContactUsId() {
		return contactUsId;
	}
	public void setContactUsId(int contactUsId) {
		this.contactUsId = contactUsId;
	}
	public String getFName() {
		return fName;
	}
	public void setFName(String fName) {
		this.fName = fName;
	}
	public String getLName() {
		return lName;
	}
	public void setLName(String lName) {
		this.lName = lName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public Date getCreatedOn() {
		return createdOn;
	}
	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}
	public int getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}
	@Override
	public String toString() {
		return "Contact [contactUsId=" + contactUsId + ", fName=" + fName + ", lName=" + lName + ", email=" + email
				+ ", subject=" + subject + ", phoneNumber=" + phoneNumber + ", message=" + message + ", uploadFileName="
				+ uploadFileName + ", createdOn=" + createdOn + ", createdBy=" + createdBy + "]";
	}
	
	
}
