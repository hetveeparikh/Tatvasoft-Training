package helperlanduser.model;

public class Customer {
	
	private int userId;
	private String firstName;
	private String lastName;
	private String email;
	private String password;
	private String mobile;
	private int userTypeId;
	private String createdDate;
	private String dateOfBirth;
	private String language;
	private String nationality;
	private String gender;
	private String userProfilePicture;
	private int isActive;
	private int isApproved;
	private int isDeleted;
	private int isRegisteredUser;
	private UserAddress userAddress;
	
	public int getIsActive() {
		return isActive;
	}
	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}
	public int getIsApproved() {
		return isApproved;
	}
	public void setIsApproved(int isApproved) {
		this.isApproved = isApproved;
	}
	public int getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(int isDeleted) {
		this.isDeleted = isDeleted;
	}
	public int getIsRegisteredUser() {
		return isRegisteredUser;
	}
	public void setIsRegisteredUser(int isRegisteredUser) {
		this.isRegisteredUser = isRegisteredUser;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getUserProfilePicture() {
		return userProfilePicture;
	}
	public void setUserProfilePicture(String userProfilePicture) {
		this.userProfilePicture = userProfilePicture;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public int getUserTypeId() {
		return userTypeId;
	}
	public void setUserTypeId(int userTypeId) {
		this.userTypeId = userTypeId;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public UserAddress getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(UserAddress userAddress) {
		this.userAddress = userAddress;
	}
	@Override
	public String toString() {
		return "Customer [UserId=" + userId + ", FirstName=" + firstName + ", LastName=" + lastName + ", Email=" + email
				+ ", Password=" + password + ", Mobile=" + mobile + ", UserTypeId=" + userTypeId + ", CreatedDate="
				+ createdDate + ", DateOfBirth=" + dateOfBirth + ", Language=" + language + ", Nationality="
				+ nationality + ", Gender=" + gender + ", UserProfilePicture=" + userProfilePicture + ", IsActive="
				+ isActive + ", IsApproved=" + isApproved + ", IsDeleted=" + isDeleted + ", IsRegisteredUser="
				+ isRegisteredUser + ", userAddress=" + userAddress + "]";
	}
}
