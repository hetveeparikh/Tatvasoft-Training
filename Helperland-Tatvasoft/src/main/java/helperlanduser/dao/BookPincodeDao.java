package helperlanduser.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import helperlanduser.model.BookPincode;
import helperlanduser.model.Customer;

public class BookPincodeDao {
	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public boolean validatepin(int bookPincode) {

		String sql = "select * from useraddress join user on useraddress.UserId = user.UserId where useraddress.PostalCode='"
				+ bookPincode + "' and user.UserTypeId = 3  ";

		List<BookPincode> pincodes = template.query(sql, new BookPincodeUserAddressMapper());
		return pincodes.size() > 0;
	}

	public List<Customer> getAllEmail() {

		String sql = "select * from user where user.UserTypeId = 3 ";
		List<Customer> splist = template.query(sql, new CustomerSpMapper());
		String[] allemailaddress = {};
		System.out.println(allemailaddress);
		return splist;
	}
}

class BookPincodeUserAddressMapper implements RowMapper<BookPincode> {

	public BookPincode mapRow(ResultSet rs, int arg1) throws SQLException {

		BookPincode pincode = new BookPincode();

		pincode.setPostalCode(rs.getInt("PostalCode"));

		return pincode;
	}
}

class CustomerSpMapper implements RowMapper<Customer> {

	public Customer mapRow(ResultSet rs, int arg1) throws SQLException {

		Customer customer = new Customer();
		customer.setEmail(rs.getString("Email"));

		return customer;
	}
}