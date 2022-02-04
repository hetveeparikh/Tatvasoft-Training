package helperlanduser.dao;

import java.util.Date;

import org.springframework.jdbc.core.JdbcTemplate;

import helperlanduser.model.Contact;

public class ContactDao {
	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public void save(Contact p) {
		Date date = new Date();
		String sql = "insert into contactus(FName,LName,Email,Subject,PhoneNumber,Message,UploadFileName,CreatedOn) values(?,?,?,?,?,?,?,?)";
		template.update(sql, new Object[] { p.getFName(), p.getLName(), p.getEmail(), p.getSubject(),
				p.getPhoneNumber(), p.getMessage(), p.getUploadFileName(), date });
	}
}
