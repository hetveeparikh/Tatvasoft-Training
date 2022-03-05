package helperlanduser.dao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import helperlanduser.model.Customer;
import helperlanduser.model.Login;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

public class CustomerDao {
	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public void save(Customer c) {

		Date date=new Date();
		String sql = "insert into user(UserId,FirstName,LastName,Email,Password,Mobile,CreatedDate,UserTypeId) values(?,?,?,?,?,?,?,?)";
		template.update(sql, new Object[] { c.getUserId(), c.getFirstName(), c.getLastName(), c.getEmail(),
				c.getPassword(), c.getMobile(), date, c.getUserTypeId()});
	}
	
	public Customer validEmail(Customer c) {
		
		String sql = "select * from user where Email='" + c.getEmail() + "'";

		List<Customer> customers = template.query(sql, new CustomerUserMapper());

		return customers.size() > 0 ? customers.get(0) : null;		
		
	}
	
	public Customer updatePassword(Customer c){  
		System.out.println(c.getPassword()+c.getEmail());
		
	    String query="update user set Password='"+c.getPassword()+"' where Email='"+c.getEmail()+"' ";  
	    template.update(query);
		return c;  
	}  

	
	public Customer validateUser(Login login) {
		
		String sql = "select * from user where Email='" + login.getEmail() + "' and Password='" + login.getPassword()
				+ "'";

		List<Customer> customers = template.query(sql, new CustomerUserMapper());

		return customers.size() > 0 ? customers.get(0) : null;
	}
}

class CustomerUserMapper implements RowMapper<Customer> {

	public Customer mapRow(ResultSet rs, int arg1) throws SQLException {
	    Customer customer=new Customer();

	    customer.setFirstName(rs.getString("FirstName"));
	    customer.setPassword(rs.getString("Password"));
	    customer.setLastName(rs.getString("Lastname"));
	    customer.setEmail(rs.getString("Email"));
	    customer.setMobile(rs.getString("Mobile"));
	    customer.setUserTypeId(rs.getInt("UserTypeId"));
	    customer.setUserId(rs.getInt("UserId"));
	    customer.setCreatedDate(rs.getDate("CreatedDate"));

	    return customer;
	  }
}