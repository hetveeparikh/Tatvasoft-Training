package helperlanduser.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import helperlanduser.model.ServiceRequestAddress;
import helperlanduser.model.UserAddress;

public class ServiceRequestAddressDao {
	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public int saveserviceaddress(ServiceRequestAddress address) {
		
		String sql = "insert into servicerequestaddress(AddressLine1,AddressLine2,City,State,PostalCode,Mobile,Email,ServiceRequestId) values(?,?,?,?,?,?,?,?)";
		int add = template.update(sql, new Object[] {address.AddressLine1, address.AddressLine2, address.City, address.State,
				address.PostalCode, address.Mobile, address.Email, address.getServiceRequestId() });
		return add;
	}

	public UserAddress getserviceaddress(Integer addressId) {

		String sql = "select * from useraddress where AddressId=?";
		UserAddress userAddress = template.queryForObject(sql, new UserAddressMapper(), new Object[] { addressId });
		System.out.println(userAddress + " addresss");
		return userAddress;
	}
}

class UserAddressMapper implements RowMapper<UserAddress> {

	public UserAddress mapRow(ResultSet rs, int arg1) throws SQLException {

		UserAddress address = new UserAddress();

		address.setAddressLine1(rs.getString("AddressLine1"));
		address.setAddressLine2(rs.getString("AddressLine2"));
		address.setMobile(rs.getString("Mobile"));
		address.setEmail(rs.getString("Email"));
		address.setPostalCode(rs.getString("PostalCode"));
		address.setCity(rs.getString("City"));
		address.setState(rs.getString("State"));
		address.setUserId(rs.getInt("UserId"));
		address.setAddressId(rs.getInt("AddressId"));
		address.setIsDefault(rs.getBoolean("IsDefault"));
		address.setIsDeleted(rs.getBoolean("IsDeleted"));

		return address;
	}
}