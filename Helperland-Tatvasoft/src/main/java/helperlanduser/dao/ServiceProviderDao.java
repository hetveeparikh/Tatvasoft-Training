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

import helperlanduser.model.Customer;
import helperlanduser.model.ServiceRequest;
import helperlanduser.model.ServiceRequestAddress;
import helperlanduser.model.ServiceRequestExtra;

public class ServiceProviderDao {

	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public List<ServiceRequest> servicedash() {

		String sql = "SELECT * FROM servicerequest sr\n"
				+ "LEFT JOIN servicerequestaddress sra ON sr.ServiceRequestId = sra.ServiceRequestId\n"
				+ "INNER JOIN user u ON u.UserId = sr.UserId\n" + "WHERE sr.Status='New' and sr.ServiceProviderId=0";

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
					customer.setCreatedDate(rs.getDate("CreatedDate"));

					request.setServiceRequestAddress(address);
					request.setCustomer(customer);

					list.add(request);

				}
				return list;
			}
		});
	}

	public int cancelrequest(String srid) {
		String query = "update servicerequest set status='New' , ServiceProviderId = 0 where ServiceRequestId='" + srid
				+ "' ";
		return template.update(query);
	}

	public int completedrequest(String srid) {
		String query = "update servicerequest set status='Completed' where ServiceRequestId='" + srid + "' ";
		return template.update(query);
	}

	public int acceptrequest(String userid, String srid) {
		SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String query = "update servicerequest set status='Accepted' , ServiceProviderId ='" + userid
				+ "' , SPAcceptedDate = '" + dtf.format(date) + "' where ServiceRequestId='" + srid + "' ";
		return template.update(query);
	}

	public HashMap<String, Object> spdetailsmodal(String serviceid) {

		// query for service request
		String reqsql = "select * from servicerequest where ServiceId='" + serviceid + "' ";
		ServiceRequest serviceRequest = template.queryForObject(reqsql, new spServiceRequestDetailsMapper());
		System.out.println(serviceRequest + " service");

		// query for service request address
		String reqaddresssql = "select * from servicerequestaddress where ServiceRequestId='" + serviceid + "' ";
		ServiceRequestAddress serviceRequestAddress = template.queryForObject(reqaddresssql,
				new spServiceRequestAddressMapper());
		System.out.println(serviceRequestAddress + " addresss");

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
					customer.setCreatedDate(rs.getDate("CreatedDate"));

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
					customer.setCreatedDate(rs.getDate("CreatedDate"));

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
		String[] allemailaddress = {};
		System.out.println(allemailaddress + " other sp");
		return splist;
	}

	public String spEmail(int serviceid) {
		String sql = "select Email from servicerequest inner join user on servicerequest.UserId=user.UserId where ServiceRequestId=? ";
		String email = template.queryForObject(sql, String.class, new Object[] { serviceid });
		System.out.println(email);
		return email;
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