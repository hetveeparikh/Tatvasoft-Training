package helperlanduser.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import helperlanduser.model.Customer;
import helperlanduser.model.Rating;
import helperlanduser.model.ServiceRequest;
import helperlanduser.model.ServiceRequestAddress;
import helperlanduser.model.ServiceRequestExtra;

public class CustomerRequestsDao {
	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public List<ServiceRequest> readRequests(int id) {

		String sql = "select *,avg(Ratings) as Avgrate from servicerequest sr left join user u on sr.ServiceProviderId=u.UserId and sr.Status='Accepted' left join rating r on sr.ServiceProviderId=r.RatingTo where sr.Status in ('New','Accepted') and sr.UserId= '"
				+ id + "' group by(sr.ServiceRequestId) ";

		return template.query(sql, new ResultSetExtractor<List<ServiceRequest>>() {
			public List<ServiceRequest> extractData(ResultSet rs) throws SQLException, DataAccessException {

				List<ServiceRequest> list = new ArrayList<ServiceRequest>();

				while (rs.next()) {

					ServiceRequest request = new ServiceRequest();

					request.setServiceId(rs.getInt("ServiceId"));
					request.setServiceStartDate(rs.getString("ServiceStartDate"));
					request.setServiceStartTime(rs.getString("ServiceStartTime"));
					request.setSubTotal(rs.getFloat("SubTotal"));
					request.setStatus(rs.getString("Status"));
					request.setExtraHours(rs.getFloat("ExtraHours"));
					request.setServiceProviderId(rs.getInt("ServiceProviderId"));

					Customer customer = new Customer();

					customer.setFirstName(rs.getString("FirstName"));
					customer.setPassword(rs.getString("Password"));
					customer.setLastName(rs.getString("Lastname"));
					customer.setEmail(rs.getString("Email"));
					customer.setMobile(rs.getString("Mobile"));
					customer.setUserTypeId(rs.getInt("UserTypeId"));
					customer.setUserId(rs.getInt("UserId"));
					customer.setCreatedDate(rs.getString("CreatedDate"));
					customer.setUserProfilePicture(rs.getString("UserProfilePicture"));

					Rating rating = new Rating();

					rating.setRatingTo(rs.getInt("RatingTo"));
					rating.setRatingFrom(rs.getInt("RatingFrom"));
					rating.setRatings(rs.getInt("Ratings"));
					rating.setAvgrating(rs.getFloat("Avgrate"));

					request.setCustomer(customer);
					request.setRating(rating);

					list.add(request);

				}
				return list;
			}
		});
	}

	public int rescheduleRequests(ServiceRequest serviceRequest, String serviceid) {
		String query = "update servicerequest set ModifiedBy='" + serviceRequest.getModifiedBy() + "', ModifiedDate='"
				+ serviceRequest.getModifiedDate() + "', ServiceStartTime='" + serviceRequest.getServiceStartTime()
				+ "', ServiceStartDate='" + serviceRequest.getServiceStartDate() + "' where UserId='"
				+ serviceRequest.getUserId() + "'and ServiceId='" + serviceid + "' ";
		return template.update(query);
	}

	public int fetchSpId(String serviceid) {
		String sql = "select ServiceProviderId from servicerequest where ServiceId=?";
		String id = template.queryForObject(sql, String.class, new Object[] { serviceid });
		return Integer.parseInt(id);
	}

	public List<ServiceRequest> getAllServiceStartDate(int spid) {
		String sql = "select * from servicerequest where ServiceProviderId='" + spid + "' and Status='Accepted'";
		List<ServiceRequest> splist = template.query(sql, new ServiceRequestDetailsMapper());
		return splist;
	}

	public int rescheduleNewRequest(ServiceRequest serviceRequest, String serviceid) {
		String query = "update servicerequest set ModifiedBy='" + serviceRequest.getModifiedBy() + "', ModifiedDate='"
				+ serviceRequest.getModifiedDate() + "' , ServiceStartTime='" + serviceRequest.getServiceStartTime()
				+ "', ServiceStartDate='" + serviceRequest.getServiceStartDate()
				+ "', ServiceProviderId=0, Status='New', SPAcceptedDate=null where UserId='"
				+ serviceRequest.getUserId() + "'and ServiceId='" + serviceid + "' ";
		return template.update(query);
	}

	public int cancelrequest(ServiceRequest serviceRequest, String serviceid) {
		String query = "update servicerequest set Status= 'Cancelled' where UserId='" + serviceRequest.getUserId()
				+ "'and ServiceId='" + serviceid + "' ";
		return template.update(query);
	}

	public String cancelEmail(int serviceid) {
		String sql = "select Email from servicerequest left join user on servicerequest.ServiceProviderId=user.UserId where servicerequest.ServiceId=?";
		String email = template.queryForObject(sql, String.class, new Object[] { serviceid });
		return email;
	}

	public HashMap<String, Object> detailsmodal(String serviceid) {

		// query for service request
		String reqsql = "select * from servicerequest where ServiceId='" + serviceid + "' ";
		ServiceRequest serviceRequest = template.queryForObject(reqsql, new ServiceRequestDetailsMapper());

		// query for service request address
		String reqaddresssql = "select * from servicerequestaddress where ServiceRequestId='" + serviceid + "' ";
		ServiceRequestAddress serviceRequestAddress = template.queryForObject(reqaddresssql,
				new ServiceRequestAddressMapper());

		// query for extra services
		String extrasql = "select * from servicerequestextra where ServiceRequestId='" + serviceid + "' ";
		List<ServiceRequestExtra> serviceRequestExtras = template.query(extrasql, new ServiceRequestExtraMapper());
		String extraservices = "";
		Iterator<ServiceRequestExtra> iterator = serviceRequestExtras.iterator();
		while (iterator.hasNext()) {
			extraservices += iterator.next().getServiceExtra() + "  ";
		}

		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("servicerequest", serviceRequest);
		hashMap.put("servicerequestaddress", serviceRequestAddress);
		hashMap.put("servicerequestextra", extraservices);
		return hashMap;
	}

	public List<ServiceRequest> readHistory(int id) {
		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT u1.FirstName, u1.LastName, u1.UserProfilePicture AS SPProfile,");
		sql.append(" sr.ServiceId, sr.ServiceStartDate, sr.ServiceStartTime, sr.SubTotal, sr.Status, sr.ExtraHours, sr.ServiceProviderId, avg(r.Ratings) AS Avgrate, ");
		sql.append(" r1.ServiceRequestId AS SRID");
		sql.append(" FROM servicerequest sr ");
		sql.append(" LEFT JOIN user u1 ON sr.ServiceProviderId = u1.UserId ");
		sql.append(" AND (sr.Status='Completed' or sr.status='Cancelled') ");
		sql.append(" LEFT JOIN rating r ON sr.ServiceProviderId=r.RatingTo ");
		sql.append(" LEFT JOIN rating r1 ON sr.ServiceId=r1.ServiceRequestId ");
		sql.append(" WHERE sr.Status in ('Cancelled','Completed') AND sr.UserId= "+ id + "");
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
					request.setStatus(rs.getString("Status"));
					request.setExtraHours(rs.getFloat("ExtraHours"));
					request.setServiceProviderId(rs.getInt("ServiceProviderId"));

					Customer customer = new Customer();

					customer.setFirstName(rs.getString("FirstName"));
					customer.setLastName(rs.getString("Lastname"));
					customer.setUserProfilePicture(rs.getString("SPProfile"));

					Rating rating = new Rating();

					rating.setAvgrating(rs.getFloat("Avgrate"));
					
					Rating rating1 = new Rating();

					rating1.setServiceRequestId(rs.getInt("SRID"));

					request.setCustomer(customer);
					request.setRating(rating);
					request.setRating1(rating1);

					list.add(request);

				}
				return list;
			}
		});

	}

	public int ratingsp(Rating rating) {
		String sql = "insert into rating(ServiceRequestId,RatingFrom,RatingTo,Ratings,Comments,RatingDate,QualityOfService,OnTimeArrival,Friendly) values(?,?,?,?,?,?,?,?,?)";
		int rows = template.update(sql,
				new Object[] { rating.getServiceRequestId(), rating.getRatingFrom(), rating.getRatingTo(),
						rating.getRatings(), rating.getComments(), rating.getRatingDate(), rating.getOnTimeArrival(),
						rating.getFriendly(), rating.getQualityOfService() });
		return rows;
	}

}

class ServiceRequestDetailsMapper implements RowMapper<ServiceRequest> {

	public ServiceRequest mapRow(ResultSet rs, int arg1) throws SQLException {

		ServiceRequest requests = new ServiceRequest();

		requests.setServiceId(rs.getInt("ServiceId"));
		requests.setServiceStartDate(rs.getString("ServiceStartDate"));
		requests.setServiceStartTime(rs.getString("ServiceStartTime"));
		requests.setSubTotal(rs.getFloat("SubTotal"));
		requests.setComments(rs.getString("Comments"));
		requests.setHasPets(rs.getString("HasPets"));

		return requests;
	}
}

class ServiceRequestAddressMapper implements RowMapper<ServiceRequestAddress> {

	public ServiceRequestAddress mapRow(ResultSet rs, int arg1) throws SQLException {

		ServiceRequestAddress address = new ServiceRequestAddress();

		address.setAddressLine1(rs.getString("AddressLine1"));
		address.setAddressLine2(rs.getString("AddressLine2"));
		address.setMobile(rs.getString("Mobile"));
		address.setEmail(rs.getString("Email"));
		address.setPostalCode(rs.getString("PostalCode"));
		address.setCity(rs.getString("City"));
		address.setState(rs.getString("State"));

		return address;
	}
}

class ServiceRequestExtraMapper implements RowMapper<ServiceRequestExtra> {

	public ServiceRequestExtra mapRow(ResultSet rs, int rowNum) throws SQLException {

		ServiceRequestExtra extras = new ServiceRequestExtra();

		extras.setServiceExtra(rs.getString("ServiceExtra"));

		return extras;
	}
}