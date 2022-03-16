package helperlanduser.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import helperlanduser.model.Customer;
import helperlanduser.model.Rating;
import helperlanduser.model.ServiceRequest;
import helperlanduser.model.ServiceRequestAddress;
import helperlanduser.model.UserAddress;

public class AdminDao {
	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public List<Customer> adminManagement() {

		String sql = "select * from user left join useraddress on user.UserId=useraddress.UserId and user.UserTypeId=3 where user.IsDeleted=0";

		return template.query(sql, new ResultSetExtractor<List<Customer>>() {
			public List<Customer> extractData(ResultSet rs) throws SQLException, DataAccessException {

				List<Customer> list = new ArrayList<Customer>();

				while (rs.next()) {

					Customer customer = new Customer();

					customer.setFirstName(rs.getString("FirstName"));
					customer.setPassword(rs.getString("Password"));
					customer.setLastName(rs.getString("Lastname"));
					customer.setEmail(rs.getString("Email"));
					customer.setMobile(rs.getString("Mobile"));
					customer.setUserTypeId(rs.getInt("UserTypeId"));
					customer.setUserId(rs.getInt("UserId"));
					customer.setCreatedDate(rs.getString("CreatedDate"));
					customer.setIsActive(rs.getInt("IsActive"));
					customer.setIsApproved(rs.getInt("IsApproved"));
					customer.setIsDeleted(rs.getInt("IsDeleted"));

					UserAddress address = new UserAddress();

					address.setAddressLine1(rs.getString("AddressLine1"));
					address.setAddressLine2(rs.getString("AddressLine2"));
					address.setMobile(rs.getString("Mobile"));
					address.setEmail(rs.getString("Email"));
					address.setPostalCode(rs.getString("PostalCode"));
					address.setCity(rs.getString("City"));
					address.setState(rs.getString("State"));

					customer.setUserAddress(address);

					list.add(customer);

				}
				return list;
			}
		});

	}

	public int activateuser(Customer customer) {
		String query = "update user set IsActive='" + customer.getIsActive() + "' where UserId='" + customer.getUserId()
				+ "' ";
		return template.update(query);
	}

	public int approveuser(Customer customer) {
		String query = "update user set IsApproved=1 where UserId='" + customer.getUserId() + "' ";
		return template.update(query);
	}

	public int deleteuser(Customer customer) {
		String query = "update user set IsDeleted=1, IsActive=0, IsApproved=0 where UserId='" + customer.getUserId()
				+ "' ";
		return template.update(query);
	}

	public List<ServiceRequest> adminRequests() {

		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT u1.FirstName AS CustomerFirstName, u1.LastName AS CustomerLastName,u2.FirstName AS SPFirstName, u2.LastName AS SPLastName, ");
		sql.append(" u1.CreatedDate AS CustCreatedDate, u2.UserProfilePicture AS SPProfile, ");
		sql.append(" ServiceId, ServiceStartDate, ServiceStartTime, SubTotal, PaymentDone, sr.Status, ExtraHours, ServiceProviderId, avg(Ratings) AS Avgrate, ");
		sql.append(" AddressLine1, AddressLine2, PostalCode, City, State, RatingTo, RatingFrom, Ratings ");
		sql.append(" FROM servicerequest sr ");
		sql.append(" LEFT JOIN user u1 ON sr.UserId = u1.UserId ");
		sql.append(" LEFT JOIN user u2 ON sr.ServiceProviderId = u2.UserId ");
		sql.append(" LEFT JOIN servicerequestaddress sra ON sr.ServiceRequestId = sra.ServiceRequestId ");
		sql.append(" LEFT JOIN rating r ON sr.ServiceProviderId=r.RatingTo ");
		sql.append(" GROUP BY (sr.ServiceRequestId) ");

		return template.query(sql.toString(), new ResultSetExtractor<List<ServiceRequest>>() {
			public List<ServiceRequest> extractData(ResultSet rs) throws SQLException, DataAccessException {

				List<ServiceRequest> list = new ArrayList<ServiceRequest>();

				while (rs.next()) {

					ServiceRequest request = new ServiceRequest();

					request.setServiceId(rs.getInt("ServiceId"));
					request.setServiceStartDate(rs.getString("ServiceStartDate"));
					request.setServiceStartTime(rs.getString("ServiceStartTime"));
					request.setSubTotal(rs.getFloat("SubTotal"));
					request.setPaymentDone(rs.getInt("PaymentDone"));
					request.setStatus(rs.getString("Status"));
					request.setExtraHours(rs.getFloat("ExtraHours"));
					request.setServiceProviderId(rs.getInt("ServiceProviderId"));

					Customer customer = new Customer();

					customer.setFirstName(rs.getString("CustomerFirstName"));
					customer.setLastName(rs.getString("CustomerLastname"));
					customer.setCreatedDate(rs.getString("CustCreatedDate"));

					Customer sp = new Customer();

					sp.setFirstName(rs.getString("SPFirstName"));
					sp.setLastName(rs.getString("SPLastname"));
					sp.setUserProfilePicture(rs.getString("SPProfile"));

					ServiceRequestAddress address = new ServiceRequestAddress();

					address.setAddressLine1(rs.getString("AddressLine1"));
					address.setAddressLine2(rs.getString("AddressLine2"));
					address.setPostalCode(rs.getString("PostalCode"));
					address.setCity(rs.getString("City"));
					address.setState(rs.getString("State"));

					Rating rating = new Rating();

					rating.setRatingTo(rs.getInt("RatingTo"));
					rating.setRatingFrom(rs.getInt("RatingFrom"));
					rating.setRatings(rs.getInt("Ratings"));
					rating.setAvgrating(rs.getFloat("Avgrate"));

					request.setCustomer(customer);
					request.setSp(sp);
					request.setRating(rating);
					request.setServiceRequestAddress(address);

					list.add(request);

				}
				return list;
			}
		});
	}

	public int rescheduleAdminRequests(ServiceRequest serviceRequest, String serviceid) {
		String query = "update servicerequest set ModifiedBy=1, ModifiedDate='"+ serviceRequest.getModifiedDate() +"' ,ServiceStartTime='" + serviceRequest.getServiceStartTime()
				+ "', ServiceStartDate='" + serviceRequest.getServiceStartDate()
				+ "', ServiceProviderId=0, Status='New', SPAcceptedDate=null where ServiceId='" + serviceid + "' ";
		return template.update(query);
	}
	
	public int rescheduleRequests(ServiceRequest serviceRequest, String serviceid) {
		String query = "update servicerequest set ModifiedBy=1 , ModifiedDate='"+ serviceRequest.getModifiedDate() + "' ,ServiceStartTime='" + serviceRequest.getServiceStartTime()
				+ "', ServiceStartDate='" + serviceRequest.getServiceStartDate() + "' where ServiceId='" + serviceid + "' ";
		return template.update(query);
	}
	
	public List<Customer> getOtherSPadmin() {
		String sql = "select Email from user where UserTypeId = 3";
		List<Customer> splist = template.query(sql, new CustomerSpMapper());
		return splist;
	}
	
	public int editServiceRequestAddress(ServiceRequestAddress serviceRequestAddress) {
		String query = "update servicerequestaddress set AddressLine1='" + serviceRequestAddress.getAddressLine1()
				+ "',AddressLine2='" + serviceRequestAddress.getAddressLine2() + "',City='" + serviceRequestAddress.getCity()
				+ "',PostalCode='" + serviceRequestAddress.getPostalCode() + "' where ServiceRequestId='" + serviceRequestAddress.getServiceRequestId() + "' ";
		return template.update(query);
	}

	public ServiceRequestAddress readServiceRequestAddress(String serviceid) {
		String sql = "select * from servicerequestaddress where ServiceRequestId=?";
		ServiceRequestAddress address = template.queryForObject(sql, new ServiceRequestAddressAdminMapper(), new Object[] { serviceid });
		return address;
	}
}
class ServiceRequestAddressAdminMapper implements RowMapper<ServiceRequestAddress> {

	public ServiceRequestAddress mapRow(ResultSet rs, int arg1) throws SQLException {

		ServiceRequestAddress address = new ServiceRequestAddress();

		address.setAddressLine1(rs.getString("AddressLine1"));
		address.setAddressLine2(rs.getString("AddressLine2"));
		address.setPostalCode(rs.getString("PostalCode"));
		address.setCity(rs.getString("City"));

		return address;
	}

}