package helperlanduser.model;

import java.util.Date;

public class Contact {
	private int ContactUsId;
	private String FName;
	private String LName;
	private String Email;
	private String Subject;
	private String PhoneNumber;
	private String Message;
	private String UploadFileName;
	private Date CreatedOn;
	private int CreatedBy;
	public int getContactUsId() {
		return ContactUsId;
	}
	public void setContactUsId(int contactUsId) {
		ContactUsId = contactUsId;
	}
	public String getFName() {
		return FName;
	}
	public void setFName(String fName) {
		FName = fName;
	}
	public String getLName() {
		return LName;
	}
	public void setLName(String lName) {
		LName = lName;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getSubject() {
		return Subject;
	}
	public void setSubject(String subject) {
		Subject = subject;
	}
	public String getPhoneNumber() {
		return PhoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		PhoneNumber = phoneNumber;
	}
	public String getMessage() {
		return Message;
	}
	public void setMessage(String message) {
		Message = message;
	}
	public String getUploadFileName() {
		return UploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		UploadFileName = uploadFileName;
	}
	public Date getCreatedOn() {
		return CreatedOn;
	}
	public void setCreatedOn(Date createdOn) {
		CreatedOn = createdOn;
	}
	public int getCreatedBy() {
		return CreatedBy;
	}
	public void setCreatedBy(int createdBy) {
		CreatedBy = createdBy;
	}
	@Override
	public String toString() {
		return "Contact [ContactUsId=" + ContactUsId + ", FName=" + FName + ", LName=" + LName + ", Email=" + Email
				+ ", Subject=" + Subject + ", PhoneNumber=" + PhoneNumber + ", Message=" + Message + ", UploadFileName="
				+ UploadFileName + ", CreatedOn=" + CreatedOn + ", CreatedBy=" + CreatedBy + "]";
	}
	
	
	
	
}
