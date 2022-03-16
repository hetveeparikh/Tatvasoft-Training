package helperlanduser.model;

public class ServiceRequestAddress {
	private int id;
	private int serviceRequestId;
	public String addressLine1;
	public String addressLine2;
	public String city;
	public String state;
	public String mobile;
	public String email;
	public String postalCode;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getServiceRequestId() {
		return serviceRequestId;
	}
	public void setServiceRequestId(int serviceRequestId) {
		this.serviceRequestId = serviceRequestId;
	}
	public String getAddressLine1() {
		return addressLine1;
	}
	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}
	public String getAddressLine2() {
		return addressLine2;
	}
	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	@Override
	public String toString() {
		return "ServiceRequestAddress [Id=" + id + ", ServiceRequestId=" + serviceRequestId + ", AddressLine1="
				+ addressLine1 + ", AddressLine2=" + addressLine2 + ", City=" + city + ", State=" + state + ", Mobile="
				+ mobile + ", Email=" + email + ", PostalCode=" + postalCode + "]";
	}
	
	
}
