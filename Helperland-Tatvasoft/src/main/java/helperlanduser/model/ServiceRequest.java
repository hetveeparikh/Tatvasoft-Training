package helperlanduser.model;

import java.util.Date;

public class ServiceRequest {

	private String comments;
	private int serviceRequestId;
	private int userId;
	private int serviceId;
	private String serviceStartDate;
	private String zipCode;
	private float serviceHourlyRate;
	private float serviceHours;
	private float extraHours;
	private float subTotal;
	private float discount;
	private float totalCost;
	private String paymentTransactionRefNo;
	private int serviceProviderId;
	private String sPAcceptedDate;
	private String hasPets;
	private String status;
	private String createdDate;
	private String modifiedDate;
	private int modifiedBy;
	private float refundedAmount;
	private float distance;
	private boolean hasIssue;
	private int recordVersion;
	private String serviceStartTime;
	private int paymentDone;
	private int paymentDue;
	private ServiceRequestAddress serviceRequestAddress;
	private Customer customer;
	private Customer sp;
	private Rating rating;
			
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public int getServiceRequestId() {
		return serviceRequestId;
	}
	public void setServiceRequestId(int serviceRequestId) {
		this.serviceRequestId = serviceRequestId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getServiceId() {
		return serviceId;
	}
	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}
	public String getServiceStartDate() {
		return serviceStartDate;
	}
	public void setServiceStartDate(String serviceStartDate) {
		this.serviceStartDate = serviceStartDate;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public float getServiceHourlyRate() {
		return serviceHourlyRate;
	}
	public void setServiceHourlyRate(float serviceHourlyRate) {
		this.serviceHourlyRate = serviceHourlyRate;
	}
	public float getServiceHours() {
		return serviceHours;
	}
	public void setServiceHours(float serviceHours) {
		this.serviceHours = serviceHours;
	}
	public float getExtraHours() {
		return extraHours;
	}
	public void setExtraHours(float extraHours) {
		this.extraHours = extraHours;
	}
	public float getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(float subTotal) {
		this.subTotal = subTotal;
	}
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	public float getTotalCost() {
		return totalCost;
	}
	public void setTotalCost(float totalCost) {
		this.totalCost = totalCost;
	}
	public String getPaymentTransactionRefNo() {
		return paymentTransactionRefNo;
	}
	public void setPaymentTransactionRefNo(String paymentTransactionRefNo) {
		this.paymentTransactionRefNo = paymentTransactionRefNo;
	}
	public int getServiceProviderId() {
		return serviceProviderId;
	}
	public void setServiceProviderId(int serviceProviderId) {
		this.serviceProviderId = serviceProviderId;
	}
	public String getSPAcceptedDate() {
		return sPAcceptedDate;
	}
	public void setSPAcceptedDate(String sPAcceptedDate) {
		this.sPAcceptedDate = sPAcceptedDate;
	}
	public String getHasPets() {
		return hasPets;
	}
	public void setHasPets(String hasPets) {
		this.hasPets = hasPets;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getModifiedDate() {
		return modifiedDate;
	}
	public void setModifiedDate(String modifiedDate) {
		this.modifiedDate = modifiedDate;
	}
	public int getModifiedBy() {
		return modifiedBy;
	}
	public void setModifiedBy(int modifiedBy) {
		this.modifiedBy = modifiedBy;
	}
	public float getRefundedAmount() {
		return refundedAmount;
	}
	public void setRefundedAmount(float refundedAmount) {
		this.refundedAmount = refundedAmount;
	}
	public float getDistance() {
		return distance;
	}
	public void setDistance(float distance) {
		this.distance = distance;
	}
	public boolean isHasIssue() {
		return hasIssue;
	}
	public void setHasIssue(boolean hasIssue) {
		this.hasIssue = hasIssue;
	}
	public int getRecordVersion() {
		return recordVersion;
	}
	public void setRecordVersion(int recordVersion) {
		this.recordVersion = recordVersion;
	}
	public String getServiceStartTime() {
		return serviceStartTime;
	}
	public void setServiceStartTime(String serviceStartTime) {
		this.serviceStartTime = serviceStartTime;
	}
	public ServiceRequestAddress getServiceRequestAddress() {
		return serviceRequestAddress;
	}
	public void setServiceRequestAddress(ServiceRequestAddress serviceRequestAddress) {
		this.serviceRequestAddress = serviceRequestAddress;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	
	public Rating getRating() {
		return rating;
	}
	public void setRating(Rating rating) {
		this.rating = rating;
	}
	public int getPaymentDone() {
		return paymentDone;
	}
	public void setPaymentDone(int paymentDone) {
		this.paymentDone = paymentDone;
	}
	public int getPaymentDue() {
		return paymentDue;
	}
	public void setPaymentDue(int paymentDue) {
		this.paymentDue = paymentDue;
	}
	@Override
	public String toString() {
		return "ServiceRequest [Comments=" + comments + ", ServiceRequestId=" + serviceRequestId + ", UserId=" + userId
				+ ", ServiceId=" + serviceId + ", ServiceStartDate=" + serviceStartDate + ", ZipCode=" + zipCode
				+ ", ServiceHourlyRate=" + serviceHourlyRate + ", ServiceHours=" + serviceHours + ", ExtraHours="
				+ extraHours + ", SubTotal=" + subTotal + ", Discount=" + discount + ", TotalCost=" + totalCost
				+ ", PaymentTransactionRefNo=" + paymentTransactionRefNo + ", ServiceProviderId=" + serviceProviderId
				+ ", SPAcceptedDate=" + sPAcceptedDate + ", HasPets=" + hasPets + ", Status=" + status
				+ ", CreatedDate=" + createdDate + ", ModifiedDate=" + modifiedDate + ", ModifiedBy=" + modifiedBy
				+ ", RefundedAmount=" + refundedAmount + ", Distance=" + distance + ", HasIssue=" + hasIssue
				+ ", RecordVersion=" + recordVersion + ", ServiceStartTime=" + serviceStartTime + ", PaymentDone="
				+ paymentDone + ", PaymentDue=" + paymentDue + ", serviceRequestAddress=" + serviceRequestAddress
				+ ", customer=" + customer + ", rating=" + rating + "]";
	}
	public Customer getSp() {
		return sp;
	}
	public void setSp(Customer sp) {
		this.sp = sp;
	}
	
	
}
