package helperlanduser.model;

public class Customer {
	
	private int UserId;
	private String FirstName;
	private String LastName;
	private String Email;
	private String Password;
	private String Mobile;
	private int UserTypeId;
	private String CreatedDate;
	private String DateOfBirth;
	private String Language;
	private String Nationality;
	private String Gender;
	private String UserProfilePicture;
	private int IsActive;
	private int IsApproved;
	private int IsDeleted;
	private int IsRegisteredUser;
	
	public int getIsActive() {
		return IsActive;
	}
	public void setIsActive(int isActive) {
		IsActive = isActive;
	}
	public int getIsApproved() {
		return IsApproved;
	}
	public void setIsApproved(int isApproved) {
		IsApproved = isApproved;
	}
	public int getIsDeleted() {
		return IsDeleted;
	}
	public void setIsDeleted(int isDeleted) {
		IsDeleted = isDeleted;
	}
	public int getIsRegisteredUser() {
		return IsRegisteredUser;
	}
	public void setIsRegisteredUser(int isRegisteredUser) {
		IsRegisteredUser = isRegisteredUser;
	}
	private UserAddress userAddress;
	
	public String getNationality() {
		return Nationality;
	}
	public void setNationality(String nationality) {
		Nationality = nationality;
	}
	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
	}
	public String getUserProfilePicture() {
		return UserProfilePicture;
	}
	public void setUserProfilePicture(String userProfilePicture) {
		UserProfilePicture = userProfilePicture;
	}
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
	public String getCreatedDate() {
		return CreatedDate;
	}
	public void setCreatedDate(String createdDate) {
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
	public UserAddress getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(UserAddress userAddress) {
		this.userAddress = userAddress;
	}
	@Override
	public String toString() {
		return "Customer [UserId=" + UserId + ", FirstName=" + FirstName + ", LastName=" + LastName + ", Email=" + Email
				+ ", Password=" + Password + ", Mobile=" + Mobile + ", UserTypeId=" + UserTypeId + ", CreatedDate="
				+ CreatedDate + ", DateOfBirth=" + DateOfBirth + ", Language=" + Language + ", Nationality="
				+ Nationality + ", Gender=" + Gender + ", UserProfilePicture=" + UserProfilePicture + ", IsActive="
				+ IsActive + ", IsApproved=" + IsApproved + ", IsDeleted=" + IsDeleted + ", IsRegisteredUser="
				+ IsRegisteredUser + ", userAddress=" + userAddress + "]";
	}
}
