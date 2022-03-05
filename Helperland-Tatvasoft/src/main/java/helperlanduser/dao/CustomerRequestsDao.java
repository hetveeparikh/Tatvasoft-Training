package helperlanduser.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import helperlanduser.model.ServiceRequest;
import helperlanduser.model.ServiceRequestAddress;
import helperlanduser.model.ServiceRequestExtra;

public class CustomerRequestsDao {
	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public List<ServiceRequest> readRequests(int id) {

		String sql = "select * from servicerequest where UserId='" + id  + "' and Status='New' ";
		List<ServiceRequest> requestsList = template.query(sql, new RowMapper<ServiceRequest>() {

			public ServiceRequest mapRow(ResultSet rs, int rowNum) throws SQLException {

				ServiceRequest requests = new ServiceRequest();

				requests.setServiceId(rs.getInt("ServiceId"));
				requests.setServiceStartDate(rs.getString("ServiceStartDate"));
				requests.setServiceStartTime(rs.getString("ServiceStartTime"));
				requests.setSubTotal(rs.getFloat("SubTotal"));
				requests.setExtraHours(rs.getFloat("ExtraHours"));

				return requests;
			}

		});
		
		System.out.println(requestsList.toString() + "  -> requests dao");
		return requestsList;
	}
	
	public int rescheduleRequests(ServiceRequest serviceRequest, String serviceid){
	    String query="update servicerequest set ServiceStartTime='"+ serviceRequest.getServiceStartTime()+"', ServiceStartDate='"+ serviceRequest.getServiceStartDate() +"' where UserId='"+ serviceRequest.getUserId() +"'and ServiceId='" + serviceid + "' ";  
		return template.update(query);  
	}  
	
	public int cancelrequest(ServiceRequest serviceRequest, String serviceid){
	    String query="update servicerequest set Status= 'Cancelled' where UserId='"+ serviceRequest.getUserId() +"'and ServiceId='" + serviceid + "' ";  
		return template.update(query);  
	}

	public HashMap<String, Object> detailsmodal(String serviceid) {
		
		// query for service request
		String reqsql = "select * from servicerequest where ServiceId='" + serviceid + "' ";
		ServiceRequest serviceRequest = template.queryForObject(reqsql, new ServiceRequestDetailsMapper());
		System.out.println(serviceRequest + " service");
		
		// query for service request address
		String reqaddresssql = "select * from servicerequestaddress where ServiceRequestId='" + serviceid + "' ";
		ServiceRequestAddress serviceRequestAddress = template.queryForObject(reqaddresssql, new ServiceRequestAddressMapper());
		System.out.println(serviceRequestAddress + " addresss");
		
		// query for extra services
		String extrasql = "select * from servicerequestextra where ServiceRequestId='" + serviceid + "' ";
		List<ServiceRequestExtra> serviceRequestExtras = template.query(extrasql, new ServiceRequestExtraMapper());
		String extraservices = "";
		Iterator<ServiceRequestExtra> iterator = serviceRequestExtras.iterator();
		while(iterator.hasNext()) {
			extraservices += iterator.next().getServiceExtra() + "  "; 
		}
		
		HashMap<String, Object> hashMap=new HashMap<String, Object>();
		hashMap.put("servicerequest", serviceRequest);
		hashMap.put("servicerequestaddress", serviceRequestAddress);
		hashMap.put("servicerequestextra", extraservices);
		return hashMap;
	}

	public List<ServiceRequest> readHistory(int id) {
		
		String sql = "select * from servicerequest where UserId='" + id  + "' and (Status='Cancelled' or Status='Completed') ";
		List<ServiceRequest> requestsList = template.query(sql, new RowMapper<ServiceRequest>() {

			public ServiceRequest mapRow(ResultSet rs, int rowNum) throws SQLException {

				ServiceRequest requests = new ServiceRequest();

				requests.setServiceId(rs.getInt("ServiceId"));
				requests.setServiceStartDate(rs.getString("ServiceStartDate"));
				requests.setServiceStartTime(rs.getString("ServiceStartTime"));
				requests.setSubTotal(rs.getFloat("SubTotal"));
				requests.setStatus(rs.getString("Status"));
				requests.setExtraHours(rs.getFloat("ExtraHours"));

				return requests;
			}

		});
		
		System.out.println(requestsList.toString() + "  -> history dao");
		return requestsList;
		
	
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