package helperlanduser.dao;

import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.jdbc.core.JdbcTemplate;

import helperlanduser.model.ServiceRequest;

public class ServiceRequestDao {
	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public void addrequest(ServiceRequest serviceRequest, HttpServletRequest request) {
		Random random = new Random();
		Date date = new Date();

		HttpSession session = request.getSession();
		Object pincode = session.getAttribute("pincode");
		Object userid = session.getAttribute("userid");
		float totalcost = serviceRequest.getTotalCost();
		float serviceHours = serviceRequest.getServiceHours();
		float subtotal = serviceRequest.getSubTotal();
		float extraHours = serviceRequest.getExtraHours();
		String starttime = serviceRequest.getServiceStartTime();
		String startdate = serviceRequest.getServiceStartDate();
		String comments = serviceRequest.getComments();
		String pets=serviceRequest.getHasPets();

		String sql = "insert into servicerequest(HasPets,PaymentDue,RecordVersion,RefundedAmount,Distance, HasIssue,CreatedDate,ZipCode,ServiceProviderId,ServiceRequestId,"
				+ "UserId,TotalCost,ServiceHours,SubTotal,ExtraHours,ServiceStartTime,ServiceStartDate,Comments,Discount) "
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		template.update(sql, new Object[] {pets,0,"1.0", 0, 0, 0, date, pincode, 71, random.nextInt(10000), userid, totalcost,
				serviceHours, subtotal, extraHours, starttime, startdate, comments, 0 });

		System.out.println("in request dao ");
	}
}
