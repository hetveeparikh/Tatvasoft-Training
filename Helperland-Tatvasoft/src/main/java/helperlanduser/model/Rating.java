package helperlanduser.model;

import java.util.Date;

public class Rating {

	private int RatingId;
	private int ServiceRequestId;
	private int RatingFrom;
	private int RatingTo;
	private int Ratings;
	private String Comments;
	private Date RatingDate;
	private int OnTimeArrival;
	private int Friendly;
	private int QualityOfService;
	private float avgrating;
	
	public ServiceRequest getServiceRequest() {
		return serviceRequest;
	}
	public void setServiceRequest(ServiceRequest serviceRequest) {
		this.serviceRequest = serviceRequest;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	private ServiceRequest serviceRequest;
	private Customer customer;
	
	public int getRatingId() {
		return RatingId;
	}
	public void setRatingId(int ratingId) {
		RatingId = ratingId;
	}
	public int getServiceRequestId() {
		return ServiceRequestId;
	}
	public void setServiceRequestId(int serviceRequestId) {
		ServiceRequestId = serviceRequestId;
	}
	public int getRatingFrom() {
		return RatingFrom;
	}
	public void setRatingFrom(int ratingFrom) {
		RatingFrom = ratingFrom;
	}
	public int getRatingTo() {
		return RatingTo;
	}
	public void setRatingTo(int ratingTo) {
		RatingTo = ratingTo;
	}
	public int getRatings() {
		return Ratings;
	}
	public void setRatings(int ratings) {
		Ratings = ratings;
	}
	public String getComments() {
		return Comments;
	}
	public void setComments(String comments) {
		Comments = comments;
	}
	public Date getRatingDate() {
		return RatingDate;
	}
	public void setRatingDate(Date ratingDate) {
		RatingDate = ratingDate;
	}
	public int getOnTimeArrival() {
		return OnTimeArrival;
	}
	public void setOnTimeArrival(int onTimeArrival) {
		OnTimeArrival = onTimeArrival;
	}
	public int getFriendly() {
		return Friendly;
	}
	public void setFriendly(int friendly) {
		Friendly = friendly;
	}
	public int getQualityOfService() {
		return QualityOfService;
	}
	public void setQualityOfService(int qualityOfService) {
		QualityOfService = qualityOfService;
	}
	public float getAvgrating() {
		return avgrating;
	}
	public void setAvgrating(float avgrating) {
		this.avgrating = avgrating;
	}
	@Override
	public String toString() {
		return "Rating [RatingId=" + RatingId + ", ServiceRequestId=" + ServiceRequestId + ", RatingFrom=" + RatingFrom
				+ ", RatingTo=" + RatingTo + ", Ratings=" + Ratings + ", Comments=" + Comments + ", RatingDate="
				+ RatingDate + ", OnTimeArrival=" + OnTimeArrival + ", Friendly=" + Friendly + ", QualityOfService="
				+ QualityOfService + ", avgrating=" + avgrating + ", serviceRequest=" + serviceRequest + ", customer="
				+ customer + "]";
	}
	
	
}
