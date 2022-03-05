package helperlanduser.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import helperlanduser.model.UserAddress;

public class BookingAddressDao {
	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public int addAddress(UserAddress address) {
		
		String sql = "insert into useraddress(AddressLine1,AddressLine2,PostalCode,City,Mobile,UserId,IsDefault,IsDeleted,Email) values(?,?,?,?,?,?,?,?,?)";
		int add = template.update(sql, new Object[] { address.getAddressLine1(), address.getAddressLine2(),
				address.getPostalCode(), address.getCity(), address.getMobile(),address.getUserId(),1,1,address.getEmail() });
	
		return add;

	}

	public List<UserAddress> readAddress(Object id) {

		String sql = "select * from useraddress where UserId='" + id  + "'";
		List<UserAddress> addressList = template.query(sql, new RowMapper<UserAddress>() {

			public UserAddress mapRow(ResultSet rs, int rowNum) throws SQLException {

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

		});
		
		System.out.println(addressList.toString() + "  ->  dao");
		return addressList;
	}
	
	public int updateAddressSettings(UserAddress userAddress, String addressid){
	    String query="update useraddress set AddressLine1='"+ userAddress.getAddressLine1() +"',AddressLine2='"+ userAddress.getAddressLine2() +"',City='"+ userAddress.getCity() +"',PostalCode='"+ userAddress.getPostalCode() +"',Mobile='"+ userAddress.getMobile() +"' where UserId='"+ userAddress.getUserId() +"'and AddressId='" + addressid + "' ";  
		return template.update(query);  
	}  
	
	public int deleteAddress(UserAddress userAddress, String addressid){  
	    String query="delete from useraddress where UserId='"+ userAddress.getUserId() +"'and AddressId='" + addressid + "' ";  
	    return template.update(query);  
	}  
}
