package helperlanduser.dao;

import org.springframework.jdbc.core.JdbcTemplate;

import helperlanduser.model.Customer;

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
}
