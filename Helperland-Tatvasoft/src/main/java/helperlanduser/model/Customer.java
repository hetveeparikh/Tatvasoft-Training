package helperlanduser.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Customer {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String fname;
	private String lname;
	private String bdate;
	private String email;
	private int pincode;
	private int mno;
	private String lang;
	private String pass;
	private String cpass;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPincode() {
		return pincode;
	}
	public void setPincode(int pincode) {
		this.pincode = pincode;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getLang() {
		return lang;
	}
	public void setLang(String lang) {
		this.lang = lang;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getCpass() {
		return cpass;
	}
	public void setCpass(String cpass) {
		this.cpass = cpass;
	}
	public Customer(int id, String fname, String lname, String bdate, String email, int pincode, int mno, String lang,
			String pass, String cpass) {
		super();
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.bdate = bdate;
		this.email = email;
		this.pincode = pincode;
		this.mno = mno;
		this.lang = lang;
		this.pass = pass;
		this.cpass = cpass;
	}
	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Customer [id=" + id + ", fname=" + fname + ", lname=" + lname + ", bdate=" + bdate + ", email=" + email
				+ ", pincode=" + pincode + ", mno=" + mno + ", lang=" + lang + ", pass=" + pass + ", cpass=" + cpass
				+ "]";
	}
	
	
}
