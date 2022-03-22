package helperlanduser.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import helperlanduser.dto.ServiceRequestBlockDTO;
import helperlanduser.dto.ServiceRequestScheduleDTO;
import helperlanduser.model.Customer;
import helperlanduser.model.FavouriteAndBlocked;
import helperlanduser.model.Rating;
import helperlanduser.model.ServiceRequest;
import helperlanduser.model.ServiceRequestAddress;
import helperlanduser.model.ServiceRequestExtra;
import helperlanduser.model.UserAddress;

public class ServiceProviderDao {

	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public int addspAddress(UserAddress address) {

		String sql = "insert into useraddress(AddressLine1,AddressLine2,PostalCode,City,Mobile,UserId,IsDefault,IsDeleted,Email) values(?,?,?,?,?,?,?,?,?)";
		int add = template.update(sql,
				new Object[] { address.getAddressLine1(), address.getAddressLine2(), address.getPostalCode(),
						address.getCity(), address.getMobile(), address.getUserId(), 1, 1, address.getEmail() });

		return add;

	}

	public List<ServiceRequest> servicedash() {

		String sql = "SELECT * FROM servicerequest sr\n"
				+ "LEFT JOIN servicerequestaddress sra ON sr.ServiceRequestId = sra.ServiceRequestId\n"
				+ "INNER JOIN user u ON u.UserId = sr.UserId\n" 
				+ "LEFT JOIN favoriteandblocked fab on sr.UserId=fab.TargetUserId and fab.TargetUserId IS NOT NULL\n"
				+ "WHERE sr.Status='New' AND sr.ServiceProviderId=0 AND (fab.IsBlocked=0 OR fab.IsBlocked IS NULL)";

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

					ServiceRequestAddress address = new ServiceRequestAddress();

					address.setAddressLine1(rs.getString("AddressLine1"));
					address.setAddressLine2(rs.getString("AddressLine2"));
					address.setMobile(rs.getString("Mobile"));
					address.setEmail(rs.getString("Email"));
					address.setPostalCode(rs.getString("PostalCode"));
					address.setCity(rs.getString("City"));
					address.setState(rs.getString("State"));

					Customer customer = new Customer();

					customer.setFirstName(rs.getString("FirstName"));
					customer.setPassword(rs.getString("Password"));
					customer.setLastName(rs.getString("Lastname"));
					customer.setEmail(rs.getString("Email"));
					customer.setMobile(rs.getString("Mobile"));
					customer.setUserTypeId(rs.getInt("UserTypeId"));
					customer.setUserId(rs.getInt("UserId"));
					customer.setCreatedDate(rs.getString("CreatedDate"));

					request.setServiceRequestAddress(address);
					request.setCustomer(customer);

					list.add(request);

				}
				return list;
			}
		});
	}

	public int cancelrequest(String srid) {
		String query = "update servicerequest set PaymentDone=0, status='New' , ServiceProviderId = 0 where ServiceRequestId='"
				+ srid + "' ";
		return template.update(query);
	}

	public int completedrequest(String srid) {
		String query = "update servicerequest set PaymentDone=1, status='Completed' where ServiceRequestId='" + srid
				+ "' ";
		return template.update(query);
	}

	public int acceptrequest(String userid, String srid) {
		SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String query = "update servicerequest set PaymentDone=0, status='Accepted' , ServiceProviderId ='" + userid
				+ "' , SPAcceptedDate = '" + dtf.format(date) + "' where ServiceRequestId='" + srid + "' ";
		return template.update(query);
	}

	public HashMap<String, Object> spdetailsmodal(String serviceid) {

		// query for service request
		String reqsql = "select * from servicerequest where ServiceId='" + serviceid + "' ";
		ServiceRequest serviceRequest = template.queryForObject(reqsql, new spServiceRequestDetailsMapper());

		// query for service request address
		String reqaddresssql = "select * from servicerequestaddress where ServiceRequestId='" + serviceid + "' ";
		ServiceRequestAddress serviceRequestAddress = template.queryForObject(reqaddresssql,
				new spServiceRequestAddressMapper());

		// query for extra services
		String extrasql = "select * from servicerequestextra where ServiceRequestId='" + serviceid + "' ";
		List<ServiceRequestExtra> serviceRequestExtras = template.query(extrasql, new spServiceRequestExtraMapper());
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

	public List<ServiceRequest> upcomingservices(int id) {
		String sql = "SELECT * FROM servicerequest sr\n"
				+ "LEFT JOIN servicerequestaddress sra ON sr.ServiceRequestId = sra.ServiceRequestId\n"
				+ "INNER JOIN user u ON u.UserId = sr.UserId\n"
				+ "WHERE sr.Status='Accepted' and sr.ServiceProviderId='" + id + "' ";

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

					ServiceRequestAddress address = new ServiceRequestAddress();

					address.setAddressLine1(rs.getString("AddressLine1"));
					address.setAddressLine2(rs.getString("AddressLine2"));
					address.setMobile(rs.getString("Mobile"));
					address.setEmail(rs.getString("Email"));
					address.setPostalCode(rs.getString("PostalCode"));
					address.setCity(rs.getString("City"));
					address.setState(rs.getString("State"));

					Customer customer = new Customer();

					customer.setFirstName(rs.getString("FirstName"));
					customer.setPassword(rs.getString("Password"));
					customer.setLastName(rs.getString("Lastname"));
					customer.setEmail(rs.getString("Email"));
					customer.setMobile(rs.getString("Mobile"));
					customer.setUserTypeId(rs.getInt("UserTypeId"));
					customer.setUserId(rs.getInt("UserId"));
					customer.setCreatedDate(rs.getString("CreatedDate"));

					request.setServiceRequestAddress(address);
					request.setCustomer(customer);

					list.add(request);

				}
				return list;
			}
		});
	}

	public List<ServiceRequest> servicehistory(int id) {
		String sql = "SELECT * FROM servicerequest sr\n"
				+ "LEFT JOIN servicerequestaddress sra ON sr.ServiceRequestId = sra.ServiceRequestId\n"
				+ "INNER JOIN user u ON u.UserId = sr.UserId\n"
				+ "WHERE sr.Status='Completed' and sr.ServiceProviderId='" + id + "' ";

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

					ServiceRequestAddress address = new ServiceRequestAddress();

					address.setAddressLine1(rs.getString("AddressLine1"));
					address.setAddressLine2(rs.getString("AddressLine2"));
					address.setMobile(rs.getString("Mobile"));
					address.setEmail(rs.getString("Email"));
					address.setPostalCode(rs.getString("PostalCode"));
					address.setCity(rs.getString("City"));
					address.setState(rs.getString("State"));

					Customer customer = new Customer();

					customer.setFirstName(rs.getString("FirstName"));
					customer.setPassword(rs.getString("Password"));
					customer.setLastName(rs.getString("Lastname"));
					customer.setEmail(rs.getString("Email"));
					customer.setMobile(rs.getString("Mobile"));
					customer.setUserTypeId(rs.getInt("UserTypeId"));
					customer.setUserId(rs.getInt("UserId"));
					customer.setCreatedDate(rs.getString("CreatedDate"));

					request.setServiceRequestAddress(address);
					request.setCustomer(customer);

					list.add(request);

				}
				return list;
			}
		});
	}

	public List<Customer> getOtherSP(int id) {
		String sql = "select Email from user where UserId not in ('" + id + "') and UserTypeId = 3";
		List<Customer> splist = template.query(sql, new CustomerSpMapper());
		return splist;
	}

	public String spEmail(int serviceid) {
		String sql = "select Email from servicerequest inner join user on servicerequest.UserId=user.UserId where ServiceRequestId=? ";
		String email = template.queryForObject(sql, String.class, new Object[] { serviceid });
		return email;
	}

	public List<Rating> ratings(int id) {
		String sql = "select * from rating inner join user on rating.RatingFrom=user.UserId inner join servicerequest sr on rating.ServiceRequestId=sr.ServiceRequestId where rating.RatingTo ='"
				+ id + "' ";

		return template.query(sql, new ResultSetExtractor<List<Rating>>() {
			public List<Rating> extractData(ResultSet rs) throws SQLException, DataAccessException {

				List<Rating> list = new ArrayList<Rating>();

				while (rs.next()) {

					Rating rating = new Rating();

					rating.setComments(rs.getString("Comments"));
					rating.setFriendly(rs.getInt("Friendly"));
					rating.setOnTimeArrival(rs.getInt("OnTimeArrival"));
					rating.setQualityOfService(rs.getInt("QualityOfService"));
					rating.setRatings(rs.getInt("Ratings"));
					rating.setRatingFrom(rs.getInt("RatingFrom"));
					rating.setRatingTo(rs.getInt("RatingTo"));
					rating.setServiceRequestId(rs.getInt("ServiceRequestId"));
					rating.setRatingDate(rs.getString("RatingDate"));

					ServiceRequest request = new ServiceRequest();

					request.setServiceId(rs.getInt("ServiceId"));
					request.setServiceStartDate(rs.getString("ServiceStartDate"));
					request.setServiceStartTime(rs.getString("ServiceStartTime"));
					request.setSubTotal(rs.getFloat("SubTotal"));
					request.setStatus(rs.getString("Status"));
					request.setExtraHours(rs.getFloat("ExtraHours"));

					Customer customer = new Customer();

					customer.setFirstName(rs.getString("FirstName"));
					customer.setLastName(rs.getString("LastName"));
					customer.setPassword(rs.getString("Password"));
					customer.setLastName(rs.getString("Lastname"));
					customer.setEmail(rs.getString("Email"));
					customer.setMobile(rs.getString("Mobile"));
					customer.setUserTypeId(rs.getInt("UserTypeId"));
					customer.setUserId(rs.getInt("UserId"));
					customer.setCreatedDate(rs.getString("CreatedDate"));

					rating.setCustomer(customer);
					rating.setServiceRequest(request);

					list.add(rating);

				}
				return list;
			}
		});
	}

	public List<ServiceRequestScheduleDTO> serviceschedule(String str) {

		String sql = "SELECT sr.ServiceRequestId AS id, CONCAT( 'Time: ', sr.ServiceStartTime, ' & Hours: ', sr.ExtraHours) AS title, "
				+ "sr.ServiceStartDate AS start, sr.ServiceStartDate AS end, IF(sr.status='Completed','#1d7a8c','gainsboro') AS color, "
				+ "IF(sr.status='Completed','white','#1d7a8c') AS textColor FROM servicerequest sr WHERE sr.ServiceProviderId = '"
				+ str + "' AND sr.Status IN ('Completed','Accepted') ";

		List<ServiceRequestScheduleDTO> requestlist = template.query(sql, new RowMapper<ServiceRequestScheduleDTO>() {

			public ServiceRequestScheduleDTO mapRow(ResultSet rs, int rowNum) throws SQLException {

				ServiceRequestScheduleDTO requests = new ServiceRequestScheduleDTO();

				requests.setId(rs.getInt("id"));
				requests.setStart(rs.getString("start"));
				requests.setEnd(rs.getString("end"));
				requests.setTitle(rs.getString("title"));
				requests.setColor(rs.getString("color"));
				requests.setTextColor(rs.getString("textColor"));

				return requests;
			}

		});
		return requestlist;
	}

	public List<ServiceRequestBlockDTO> blockcustomer(int id) {
		String sql = "SELECT DISTINCT u.UserId as CustomerId, CONCAT(u.FirstName, ' ', u.LastName) as CustomerName,"
				+ " fab.IsBlocked as CustomerBlocked from servicerequest sr LEFT JOIN user u ON sr.UserId=u.UserId "
				+ "LEFT JOIN favoriteandblocked fab ON sr.SerViceProviderId=fab.UserId "
				+ "where sr.status='Completed' AND sr.ServiceProviderId='" + id + "' ";

		List<ServiceRequestBlockDTO> custlist = template.query(sql, new RowMapper<ServiceRequestBlockDTO>() {

			public ServiceRequestBlockDTO mapRow(ResultSet rs, int rowNum) throws SQLException {

				ServiceRequestBlockDTO cust = new ServiceRequestBlockDTO();

				cust.setCustomerName(rs.getString("CustomerName"));
				cust.setCustomerId(rs.getInt("CustomerId"));
				cust.setCustomerBlocked(rs.getInt("CustomerBlocked"));

				return cust;
			}

		});
		return custlist;
	}

	public FavouriteAndBlocked getListCustomers(FavouriteAndBlocked favouriteAndBlocked) {
		String sql = "select * from favoriteandblocked where UserId='" + favouriteAndBlocked.getUserId()
				+ "' and TargetUserId='" + favouriteAndBlocked.getTargetUserId() + "'";
		List<FavouriteAndBlocked> blocked = template.query(sql, new spBlockedCustomersMapper());
		return blocked.size() > 0 ? blocked.get(0) : null;
	}

	public void addCustomerRecord(FavouriteAndBlocked fab) {
		String sql = "insert into favoriteandblocked (UserId,TargetUserId,IsFavorite,IsBlocked) values(?,?,?,?)";
		template.update(sql,
				new Object[] { fab.getUserId(), fab.getTargetUserId(), fab.getIsFavorite(), fab.getIsBlocked() });
	}

	public List<FavouriteAndBlocked> valueIsBlocked(FavouriteAndBlocked favouriteAndBlocked) {
		String sql = "select * from favoriteandblocked where UserId='" + favouriteAndBlocked.getUserId()
				+ "' and TargetUserId='" + favouriteAndBlocked.getTargetUserId() + "'";
		List<FavouriteAndBlocked> blocked = template.query(sql, new spBlockedCustomersMapper());
		return blocked;
	}

	public int changeBlockedValue(FavouriteAndBlocked favouriteAndBlocked) {
		String query = "update favoriteandblocked set IsBlocked='"+ favouriteAndBlocked.getIsBlocked() +"' where UserId='" + favouriteAndBlocked.getUserId()
				+ "' and TargetUserId='" + favouriteAndBlocked.getTargetUserId() + "'";
		return template.update(query);
	}

	public int addratings(Rating r) {
		
		SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		
		String sql = "insert into rating(RatingFrom, RatingTo, Ratings, ServiceRequestId, OnTimeArrival, Friendly, QualityOfService, RatingDate, Comments) values(?,?,?,?,?,?,?,?,?)";
		int rating = template.update(sql, new Object[] { r.getRatingFrom(), r.getRatingTo(), r.getRatings(), 0,0,0,0, dtf.format(date), "NA"});
		return rating;
	}

}

class spServiceRequestDetailsMapper implements RowMapper<ServiceRequest> {

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

class spServiceRequestAddressMapper implements RowMapper<ServiceRequestAddress> {

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

class spServiceRequestExtraMapper implements RowMapper<ServiceRequestExtra> {

	public ServiceRequestExtra mapRow(ResultSet rs, int rowNum) throws SQLException {

		ServiceRequestExtra extras = new ServiceRequestExtra();

		extras.setServiceExtra(rs.getString("ServiceExtra"));

		return extras;
	}
}

class spBlockedCustomersMapper implements RowMapper<FavouriteAndBlocked> {

	public FavouriteAndBlocked mapRow(ResultSet rs, int rowNum) throws SQLException {

		FavouriteAndBlocked blocked = new FavouriteAndBlocked();

		blocked.setIsBlocked(rs.getInt("IsBlocked"));
		blocked.setIsFavorite(rs.getInt("IsFavorite"));
		blocked.setTargetUserId(rs.getInt("TargetUserId"));
		blocked.setUserId(rs.getInt("UserId"));
		blocked.setId(rs.getInt("Id"));

		return blocked;
	}
}