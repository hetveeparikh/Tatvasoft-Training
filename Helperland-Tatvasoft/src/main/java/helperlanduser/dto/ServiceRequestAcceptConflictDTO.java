package helperlanduser.dto;

public class ServiceRequestAcceptConflictDTO {
	private String acceptTime;

	public String getAcceptTime() {
		return acceptTime;
	}

	public void setAcceptTime(String acceptTime) {
		this.acceptTime = acceptTime;
	}

	@Override
	public String toString() {
		return "ServiceRequestAcceptConflictDTO [acceptTime=" + acceptTime + "]";
	}
	
	
}
