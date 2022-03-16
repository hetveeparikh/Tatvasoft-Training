package helperlanduser.model;

public class ServiceRequestExtra {
	private int serviceRequestExtraId;
	private int serviceRequestId;
	private String serviceExtra;
	
	public int getServiceRequestExtraId() {
		return serviceRequestExtraId;
	}
	public void setServiceRequestExtraId(int serviceRequestExtraId) {
		this.serviceRequestExtraId = serviceRequestExtraId;
	}
	public int getServiceRequestId() {
		return serviceRequestId;
	}
	public void setServiceRequestId(int serviceRequestId) {
		this.serviceRequestId = serviceRequestId;
	}
	public String getServiceExtra() {
		return serviceExtra;
	}
	public void setServiceExtra(String serviceExtra) {
		this.serviceExtra = serviceExtra;
	}
	@Override
	public String toString() {
		return "ServiceRequestExtra [ServiceRequestExtraId=" + serviceRequestExtraId + ", ServiceRequestId="
				+ serviceRequestId + ", ServiceExtra=" + serviceExtra + "]";
	}
	
	
}
