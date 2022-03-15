package com.ctrl;

import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import helperlanduser.dao.CustomerDao;
import helperlanduser.model.Customer;
import helperlanduser.model.Login;

@Controller
public class LoginSignUpController {

	@Autowired
	private CustomerDao customerDao;

	@RequestMapping(value = "/addCustomer", method = RequestMethod.POST)
	public String addcustomer(@ModelAttribute("customer") Customer customer) {

		Random random = new Random();
		customer.setUserId(random.nextInt(10000));
		customer.setUserTypeId(2);
		customerDao.save(customer);
		System.out.println(customer);
		return "Homepage";
	}

	@RequestMapping(value = "/addServiceProvider", method = RequestMethod.POST)
	public String addServiceProvider(@ModelAttribute("customer") Customer customer) {
		System.out.println(customer);
		customer.setUserTypeId(3);
		customerDao.save(customer);
		return "ServiceProvider-BAP";
	}

	@RequestMapping(value = "/loginprocess", method = RequestMethod.POST)
	public ModelAndView loginProcess(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("login") Login login, Model model) {
		ModelAndView mav = null;

		Customer customer = customerDao.validateUser(login);

		HttpSession session = request.getSession();
		session.setAttribute("userid", customer.getUserId());
		session.setAttribute("usertypeid", customer.getUserTypeId());
		session.setAttribute("firstname", customer.getFirstName());
		session.setAttribute("lastname", customer.getLastName());
		session.setAttribute("custmobile", customer.getMobile());
		session.setAttribute("custemail", customer.getEmail());
		

		session.setMaxInactiveInterval(15 * 60);

		if (null != customer) {
			int type = customer.getUserTypeId();
			System.out.println(type);
			if (type == 2) {
				mav = new ModelAndView("redirect:customerDashboard");

			} else if (type == 3) {
				mav = new ModelAndView("redirect:ServiceProviderDashboard");
			} else {

			}
		}

		else {
			mav = new ModelAndView("Homepage");
//			mav.addObject("message", "Username or Password is wrong!!");
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
				return new PasswordAuthentication("helperland.hetvee@gmail.com", "helperland-22");
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
			System.out.println("Email sent");
			mav = new ModelAndView("Homepage");
		} else {
			mav = new ModelAndView("Homepage");
		}

		System.out.println("----------------");
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