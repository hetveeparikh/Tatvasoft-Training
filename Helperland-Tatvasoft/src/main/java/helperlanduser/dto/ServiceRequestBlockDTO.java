package helperlanduser.dto;

public class ServiceRequestBlockDTO {
	private String CustomerName;
	private int CustomerId;
	private int CustomerBlocked;

	public String getCustomerName() {
		return CustomerName;
	}

	public void setCustomerName(String customerName) {
		CustomerName = customerName;
	}

	public int getCustomerId() {
		return CustomerId;
	}

	public void setCustomerId(int customerId) {
		CustomerId = customerId;
	}

	public int getCustomerBlocked() {
		return CustomerBlocked;
	}

	public void setCustomerBlocked(int customerBlocked) {
		CustomerBlocked = customerBlocked;
	}

	@Override
	public String toString() {
		return "ServiceRequestBlockDTO [CustomerName=" + CustomerName + ", CustomerId=" + CustomerId
				+ ", CustomerBlocked=" + CustomerBlocked + "]";
	}
	
	
}
