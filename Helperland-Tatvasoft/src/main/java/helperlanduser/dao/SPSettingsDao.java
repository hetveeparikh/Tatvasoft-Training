package helperlanduser.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import helperlanduser.model.Customer;
import helperlanduser.model.UserAddress;

public class SPSettingsDao {
	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public int updatePassword(Customer customer, String oldPassword) {

		String query = "update user set Password='" + customer.getPassword() + "' where UserId='" + customer.getUserId()
				+ "' and Password='" + oldPassword + "' ";

		return template.update(query);
	}

	public int updateSp(Customer customer) {

		String query = "update user set FirstName='" + customer.getFirstName() + "',LastName='" + customer.getLastName()
				+ "',Mobile='" + customer.getMobile() + "',DateOfBirth='" + customer.getDateOfBirth()
				+ "',Nationality='" + customer.getNationality() + "', Gender= '" + customer.getGender()
				+ "', UserProfilePicture= '" + customer.getUserProfilePicture() + "'where UserId='"
				+ customer.getUserId() + "' ";

		return template.update(query);
	}

	public int updateSpAddressSettings(UserAddress userAddress) {
		String query = "update useraddress set IsDefault=1, IsDeleted=0, AddressLine1='" + userAddress.getAddressLine1()
				+ "',AddressLine2='" + userAddress.getAddressLine2() + "',City='" + userAddress.getCity()
				+ "',PostalCode='" + userAddress.getPostalCode() + "',Mobile='" + userAddress.getMobile() + "',Email='"
				+ userAddress.getEmail() + "' where UserId='" + userAddress.getUserId() + "' ";
		return template.update(query);
	}

	public UserAddress readSpAddress(String id) {
		String sql = "select * from useraddress where UserId=?";
		UserAddress address = template.queryForObject(sql, new UserAddressDaoMapper(), new Object[] { id });
		return address;
	}

}

class UserAddressDaoMapper implements RowMapper<UserAddress> {

	public UserAddress mapRow(ResultSet rs, int arg1) throws SQLException {

		UserAddress address = new UserAddress();

		address.setAddressLine1(rs.getString("AddressLine1"));
		address.setAddressLine2(rs.getString("AddressLine2"));
		address.setPostalCode(rs.getString("PostalCode"));
		address.setCity(rs.getString("City"));

		return address;
	}

}