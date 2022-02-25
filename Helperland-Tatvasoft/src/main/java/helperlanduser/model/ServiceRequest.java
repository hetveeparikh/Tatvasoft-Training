package helperlanduser.model;

import java.util.Date;

public class ServiceRequest {

	private String Comments;
	private int ServiceRequestId;
	private int UserId;
	private int ServiceId;
	private String ServiceStartDate;
	private String ZipCode;
	private float ServiceHourlyRate;
	private float ServiceHours;
	private float ExtraHours;
	private float SubTotal;
	private float Discount;
	private float TotalCost;
	private String PaymentTransactionRefNo;
	private boolean PaymentDue;
	private int ServiceProviderId;
	private Date SPAcceptedDate;
	private String HasPets;
	private int Status;
	private Date CreatedDate;
	private Date ModifiedDate;
	private int ModifiedBy;
	private float RefundedAmount;
	private float Distance;
	private boolean HasIssue;
	private boolean PaymentDone;
	private int RecordVersion;
	private String ServiceStartTime;
	public String getComments() {
		return Comments;
	}
	public void setComments(String comments) {
		Comments = comments;
	}
	public int getServiceRequestId() {
		return ServiceRequestId;
	}
	public void setServiceRequestId(int serviceRequestId) {
		ServiceRequestId = serviceRequestId;
	}
	public int getUserId() {
		return UserId;
	}
	public void setUserId(int userId) {
		UserId = userId;
	}
	public int getServiceId() {
		return ServiceId;
	}
	public void setServiceId(int serviceId) {
		ServiceId = serviceId;
	}
	public String getServiceStartDate() {
		return ServiceStartDate;
	}
	public void setServiceStartDate(String serviceStartDate2) {
		ServiceStartDate = serviceStartDate2;
	}
	public String getZipCode() {
		return ZipCode;
	}
	public void setZipCode(String zipCode) {
		ZipCode = zipCode;
	}
	public float getServiceHourlyRate() {
		return ServiceHourlyRate;
	}
	public void setServiceHourlyRate(float serviceHourlyRate) {
		ServiceHourlyRate = serviceHourlyRate;
	}
	public float getServiceHours() {
		return ServiceHours;
	}
	public void setServiceHours(float serviceHours) {
		ServiceHours = serviceHours;
	}
	public float getExtraHours() {
		return ExtraHours;
	}
	public void setExtraHours(float extraHours) {
		ExtraHours = extraHours;
	}
	public float getSubTotal() {
		return SubTotal;
	}
	public void setSubTotal(float subTotal) {
		SubTotal = subTotal;
	}
	public float getDiscount() {
		return Discount;
	}
	public void setDiscount(float discount) {
		Discount = discount;
	}
	public float getTotalCost() {
		return TotalCost;
	}
	public void setTotalCost(float totalCost) {
		TotalCost = totalCost;
	}
	public String getPaymentTransactionRefNo() {
		return PaymentTransactionRefNo;
	}
	public void setPaymentTransactionRefNo(String paymentTransactionRefNo) {
		PaymentTransactionRefNo = paymentTransactionRefNo;
	}
	public boolean isPaymentDue() {
		return PaymentDue;
	}
	public void setPaymentDue(boolean paymentDue) {
		PaymentDue = paymentDue;
	}
	public int getServiceProviderId() {
		return ServiceProviderId;
	}
	public void setServiceProviderId(int serviceProviderId) {
		ServiceProviderId = serviceProviderId;
	}
	public Date getSPAcceptedDate() {
		return SPAcceptedDate;
	}
	public void setSPAcceptedDate(Date sPAcceptedDate) {
		SPAcceptedDate = sPAcceptedDate;
	}
	public String getHasPets() {
		return HasPets;
	}
	public void setHasPets(String hasPets) {
		HasPets = hasPets;
	}
	public int getStatus() {
		return Status;
	}
	public void setStatus(int status) {
		Status = status;
	}
	public Date getCreatedDate() {
		return CreatedDate;
	}
	public void setCreatedDate(Date createdDate) {
		CreatedDate = createdDate;
	}
	public Date getModifiedDate() {
		return ModifiedDate;
	}
	public void setModifiedDate(Date modifiedDate) {
		ModifiedDate = modifiedDate;
	}
	public int getModifiedBy() {
		return ModifiedBy;
	}
	public void setModifiedBy(int modifiedBy) {
		ModifiedBy = modifiedBy;
	}
	public float getRefundedAmount() {
		return RefundedAmount;
	}
	public void setRefundedAmount(float refundedAmount) {
		RefundedAmount = refundedAmount;
	}
	public float getDistance() {
		return Distance;
	}
	public void setDistance(float distance) {
		Distance = distance;
	}
	public boolean isHasIssue() {
		return HasIssue;
	}
	public void setHasIssue(boolean hasIssue) {
		HasIssue = hasIssue;
	}
	public boolean isPaymentDone() {
		return PaymentDone;
	}
	public void setPaymentDone(boolean paymentDone) {
		PaymentDone = paymentDone;
	}
	public int getRecordVersion() {
		return RecordVersion;
	}
	public void setRecordVersion(int recordVersion) {
		RecordVersion = recordVersion;
	}
	public String getServiceStartTime() {
		return ServiceStartTime;
	}
	public void setServiceStartTime(String serviceStartTime) {
		ServiceStartTime = serviceStartTime;
	}
	
	@Override
	public String toString() {
		return "ServiceRequest [Comments=" + Comments + ", ServiceRequestId=" + ServiceRequestId + ", UserId=" + UserId
				+ ", ServiceId=" + ServiceId + ", ServiceStartDate=" + ServiceStartDate + ", ZipCode=" + ZipCode
				+ ", ServiceHourlyRate=" + ServiceHourlyRate + ", ServiceHours=" + ServiceHours + ", ExtraHours="
				+ ExtraHours + ", SubTotal=" + SubTotal + ", Discount=" + Discount + ", TotalCost=" + TotalCost
				+ ", PaymentTransactionRefNo=" + PaymentTransactionRefNo + ", PaymentDue=" + PaymentDue
				+ ", ServiceProviderId=" + ServiceProviderId + ", SPAcceptedDate=" + SPAcceptedDate + ", HasPets="
				+ HasPets + ", Status=" + Status + ", CreatedDate=" + CreatedDate + ", ModifiedDate=" + ModifiedDate
				+ ", ModifiedBy=" + ModifiedBy + ", RefundedAmount=" + RefundedAmount + ", Distance=" + Distance
				+ ", HasIssue=" + HasIssue + ", PaymentDone=" + PaymentDone + ", RecordVersion=" + RecordVersion
				+ ", ServiceStartTime=" + ServiceStartTime + "]";
	}
	
	
}