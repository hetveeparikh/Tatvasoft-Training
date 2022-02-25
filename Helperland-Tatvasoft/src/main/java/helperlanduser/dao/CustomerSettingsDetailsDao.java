package helperlanduser.dao;

import org.springframework.jdbc.core.JdbcTemplate;

import helperlanduser.model.Customer;

public class CustomerSettingsDetailsDao {
	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public int updateCustomer(Customer customer){
			   
	    String query="update user set FirstName='"+ customer.getFirstName() +"',LastName='"+ customer.getLastName() +"',Mobile='"+ customer.getMobile() +"',DateOfBirth='"+ customer.getDateOfBirth() +"',Language='"+ customer.getLanguage() +"' where UserId='"+ customer.getUserId() +"' ";  

		return template.update(query);  
	}  
	
	public int updatePassword(Customer customer, String oldPassword) {
		
	    String query="update user set Password='"+ customer.getPassword() +"' where UserId='"+ customer.getUserId() +"' and Password='" + oldPassword + "' ";  
			    
		return template.update(query);
	}
}
