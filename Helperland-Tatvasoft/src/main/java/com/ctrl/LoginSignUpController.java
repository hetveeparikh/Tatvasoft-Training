package com.ctrl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import helperlanduser.dao.CustomerDao;
import helperlanduser.dao.ServiceProviderDao;
import helperlanduser.model.Customer;
import helperlanduser.model.Login;
import helperlanduser.model.UserAddress;

@Controller
public class LoginSignUpController {

	@Autowired
	private CustomerDao customerDao;
	
	@Autowired
	private ServiceProviderDao serviceProviderDao;

	@RequestMapping(value = "/addCustomer", method = RequestMethod.POST)
	public String addcustomer(@ModelAttribute("customer") Customer customer) {

		Random random = new Random();
		customer.setUserId(random.nextInt(10000));
		SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		customer.setCreatedDate(dtf.format(date));
		customer.setUserProfilePicture("NA");
		customer.setUserTypeId(2);
		customer.setIsActive(1);
		customer.setIsDeleted(0);
		customer.setIsApproved(1);
		customerDao.save(customer);
		return "Homepage";
	}

	@RequestMapping(value = "/addServiceProvider", method = RequestMethod.POST)
	public String addServiceProvider(@ModelAttribute("customer") Customer customer,@ModelAttribute("useraddress") UserAddress useraddress) {
		Random random = new Random();
		int randomno = random.nextInt(10000);
		customer.setUserId(randomno);
		SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		customer.setCreatedDate(dtf.format(date));
		customer.setUserTypeId(3);
		customer.setUserProfilePicture("car");
		customer.setIsActive(1);
		customer.setIsDeleted(0);
		customer.setIsApproved(0);
		customerDao.save(customer);
		
		useraddress.setUserId(randomno);
		useraddress.setAddressLine1("AddressLine-1");
		useraddress.setAddressLine2("AddressLine-2");
		useraddress.setCity("City");
		useraddress.setPostalCode("PostalCode");
		serviceProviderDao.addspAddress(useraddress);
		
		return "ServiceProvider-BAP";
	}

	@RequestMapping(value = "/loginprocess", method = RequestMethod.POST)
	public ModelAndView loginProcess(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("login") Login login) {
		ModelAndView mav = null;

		Customer customer = customerDao.validateUser(login);

		if (customer != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userid", customer.getUserId());
			session.setAttribute("usertypeid", customer.getUserTypeId());
			session.setAttribute("firstname", customer.getFirstName());
			session.setAttribute("lastname", customer.getLastName());
			session.setAttribute("custmobile", customer.getMobile());
			session.setAttribute("custemail", customer.getEmail());
			session.setAttribute("spgender", customer.getGender());
			session.setAttribute("spavatar", customer.getUserProfilePicture());

			session.setMaxInactiveInterval(15 * 60);

			int type = customer.getUserTypeId();
			if (type == 2) {
				mav = new ModelAndView("redirect:customerDashboard");
			} 
			else if (type == 3) {
				mav = new ModelAndView("redirect:ServiceProviderDashboard");
			}
			else {
				mav = new ModelAndView("redirect:admin");
			}
		} else {
			mav = new ModelAndView("Homepage");
			mav.addObject("error", "Incorrect email or password!");
			mav.addObject("errordiv", "style='display: block !important';");
		}

		return mav;
	}

	public void sendEmail(String subject, String email, String from) {

		String host = "smtp.gmail.com";

		Properties properties = System.getProperties();
		System.out.println("PROPERTIES " + properties);

		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.auth", "true");

		Session session = Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("helperland.hetvee@gmail.com", "");
			}

		});

		session.setDebug(true);

		MimeMessage m = new MimeMessage(session);

		try {

			String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"; 
			String pwd = RandomStringUtils.random(7, characters); 
			System.out.println(pwd);
			String message = "Your new password is " + pwd;
			
			m.setFrom(from);

			m.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

			m.setSubject(subject);

			m.setText(message);
			
			Customer customer = new Customer();
			customer.setPassword(pwd); 
			customer.setEmail(email); 
			String pass = customer.getPassword();
			System.out.println(pass); 
			System.out.println(customer.getEmail());
			customerDao.updatePassword(customer);

			Transport.send(m);

			System.out.println("Sent success...................");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/forgotpassword", method = RequestMethod.POST)
	public ModelAndView forgotpassword(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("customer") Customer customer) {
		ModelAndView mav = null;

		System.out.println("preparing to send message ...");
		String subject = "Change Password Request";
		String from = "helperland.hetvee@gmail.com";
		Customer cust = customerDao.validEmail(customer);

		String email = cust.getEmail();
		if (customer.getEmail().trim().equals(email.trim())) {
			sendEmail( subject, email, from);
			mav = new ModelAndView("Homepage");
		} else {
			mav = new ModelAndView("Homepage");
		}
		return mav;
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return "Homepage";
	}

}
