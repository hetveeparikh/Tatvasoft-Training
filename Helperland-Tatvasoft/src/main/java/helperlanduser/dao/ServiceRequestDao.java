package helperlanduser.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.jdbc.core.JdbcTemplate;

import helperlanduser.model.ServiceRequest;
import helperlanduser.model.ServiceRequestExtra;

public class ServiceRequestDao {
	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public int addrequest(ServiceRequest serviceRequest, HttpServletRequest request) {
		Random random = new Random();
		SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		int serviceReqId = random.nextInt(10000);

		HttpSession session = request.getSession();
		Object userid = session.getAttribute("userid");
		float totalcost = serviceRequest.getTotalCost();
		float serviceHours = serviceRequest.getServiceHours();
		float subtotal = serviceRequest.getSubTotal();
		float extraHours = serviceRequest.getExtraHours();
		String starttime = serviceRequest.getServiceStartTime();
		String startdate = serviceRequest.getServiceStartDate();
		String comments = serviceRequest.getComments();
		String pets = serviceRequest.getHasPets();
		String pincode = serviceRequest.getZipCode();

		String sql = "insert into servicerequest(ServiceHourlyRate,PaymentTransactionRefNo,PaymentDone,HasPets,PaymentDue,RecordVersion,RefundedAmount,Distance, HasIssue,CreatedDate,ZipCode,"
				+ "ServiceProviderId,ServiceRequestId,UserId,TotalCost,ServiceHours,SubTotal,ExtraHours,ServiceStartTime,ServiceStartDate,Comments,Discount,ServiceId,Status) "
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		template.update(sql, new Object[] { 18,"NA", 0, pets, 0, "1.0", 0, 0, 0, dtf.format(date), pincode, 0, serviceReqId, userid, totalcost,
				serviceHours, subtotal, extraHours, starttime, startdate, comments, 0, serviceReqId, "New" });

		return serviceReqId;

	}

	public int saveExtraServices(List<ServiceRequestExtra> serviceRequestExtrasList,
			ServiceRequestExtra serviceRequestExtra) {

		String sql = "insert into servicerequestextra(ServiceRequestId,ServiceExtra) values(?,?)";
		template.update(sql, new Object[] { serviceRequestExtra.getServiceRequestId(), serviceRequestExtra.getServiceExtra() });
		return 1;
	}
}
