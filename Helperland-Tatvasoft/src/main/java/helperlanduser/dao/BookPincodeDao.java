package helperlanduser.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import helperlanduser.model.BookPincode;
import helperlanduser.model.Customer;


public class BookPincodeDao {
	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public boolean validatepin(int bookPincode,HttpServletRequest request) {

		HttpSession session=request.getSession();
		session.setAttribute("pincode", bookPincode);
		//System.out.println(session.getAttribute("pincode")+"dao meinnnnnn"); 
		String sql = "select * from useraddress where PostalCode='" + bookPincode + "'  ";
		//String sql= " Select UserTypeId from user where UserId in (select UserId from useraddress where PostalCode = ' " + bookPincode + "')";
		//Select UserTypeId from user where UserId in (select UserId from useraddress where PostalCode = bookPincode )

		List<BookPincode> pincodes = template.query(sql, new BookPincodeUserAddressMapper());
		return pincodes.size() > 0;
	}
}

class BookPincodeUserAddressMapper implements RowMapper<BookPincode> {

	public BookPincode mapRow(ResultSet rs, int arg1) throws SQLException {

		BookPincode pincode=new BookPincode();

		pincode.setPostalCode(rs.getInt("PostalCode"));
		
		return pincode;
	}
}