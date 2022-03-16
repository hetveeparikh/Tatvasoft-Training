package helperlanduser.model;

import java.util.Date;

public class Rating {

	private int ratingId;
	private int serviceRequestId;
	private int ratingFrom;
	private int ratingTo;
	private int ratings;
	private String comments;
	private String ratingDate;
	private int onTimeArrival;
	private int friendly;
	private int qualityOfService;
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
		return ratingId;
	}
	public void setRatingId(int ratingId) {
		this.ratingId = ratingId;
	}
	public int getServiceRequestId() {
		return serviceRequestId;
	}
	public void setServiceRequestId(int serviceRequestId) {
		this.serviceRequestId = serviceRequestId;
	}
	public int getRatingFrom() {
		return ratingFrom;
	}
	public void setRatingFrom(int ratingFrom) {
		this.ratingFrom = ratingFrom;
	}
	public int getRatingTo() {
		return ratingTo;
	}
	public void setRatingTo(int ratingTo) {
		this.ratingTo = ratingTo;
	}
	public int getRatings() {
		return ratings;
	}
	public void setRatings(int ratings) {
		this.ratings = ratings;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getRatingDate() {
		return ratingDate;
	}
	public void setRatingDate(String ratingDate) {
		this.ratingDate = ratingDate;
	}
	public int getOnTimeArrival() {
		return onTimeArrival;
	}
	public void setOnTimeArrival(int onTimeArrival) {
		this.onTimeArrival = onTimeArrival;
	}
	public int getFriendly() {
		return friendly;
	}
	public void setFriendly(int friendly) {
		this.friendly = friendly;
	}
	public int getQualityOfService() {
		return qualityOfService;
	}
	public void setQualityOfService(int qualityOfService) {
		this.qualityOfService = qualityOfService;
	}
	public float getAvgrating() {
		return avgrating;
	}
	public void setAvgrating(float avgrating) {
		this.avgrating = avgrating;
	}
	@Override
	public String toString() {
		return "Rating [RatingId=" + ratingId + ", ServiceRequestId=" + serviceRequestId + ", RatingFrom=" + ratingFrom
				+ ", RatingTo=" + ratingTo + ", Ratings=" + ratings + ", Comments=" + comments + ", RatingDate="
				+ ratingDate + ", OnTimeArrival=" + onTimeArrival + ", Friendly=" + friendly + ", QualityOfService="
				+ qualityOfService + ", avgrating=" + avgrating + ", serviceRequest=" + serviceRequest + ", customer="
				+ customer + "]";
	}
}
