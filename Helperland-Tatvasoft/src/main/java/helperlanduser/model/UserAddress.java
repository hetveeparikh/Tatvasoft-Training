package helperlanduser.model;

public class UserAddress {

	private int AddressId;
	private String AddressLine1;
	private String AddressLine2;
	private String City;
	private String Email;
	private String Mobile;
	private String PostalCode;
	private String State;
	private int UserId;
	private boolean IsDefault;
	private boolean IsDeleted;
	
	public int getAddressId() {
		return AddressId;
	}
	public void setAddressId(int addressId) {
		AddressId = addressId;
	}
	public String getAddressLine1() {
		return AddressLine1;
	}
	public void setAddressLine1(String addressLine1) {
		AddressLine1 = addressLine1;
	}
	public String getAddressLine2() {
		return AddressLine2;
	}
	public void setAddressLine2(String addressLine2) {
		AddressLine2 = addressLine2;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getMobile() {
		return Mobile;
	}
	public void setMobile(String mobile) {
		Mobile = mobile;
	}
	public String getPostalCode() {
		return PostalCode;
	}
	public void setPostalCode(String postalCode) {
		PostalCode = postalCode;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public int getUserId() {
		return UserId;
	}
	public void setUserId(int userId) {
		UserId = userId;
	}
	public boolean isIsDefault() {
		return IsDefault;
	}
	public void setIsDefault(boolean isDefault) {
		IsDefault = isDefault;
	}
	public boolean isIsDeleted() {
		return IsDeleted;
	}
	public void setIsDeleted(boolean isDeleted) {
		IsDeleted = isDeleted;
	}
	@Override
	public String toString() {
		return "UserAddress [AddressId=" + AddressId + ", AddressLine1=" + AddressLine1 + ", AddressLine2="
				+ AddressLine2 + ", City=" + City + ", Email=" + Email + ", Mobile=" + Mobile + ", PostalCode="
				+ PostalCode + ", State=" + State + ", UserId=" + UserId + ", IsDefault=" + IsDefault + ", IsDeleted="
				+ IsDeleted + "]";
	}
	
	
}
