package com.ctrl;

import java.util.Date;
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

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import helperlanduser.dao.ContactDao;
import helperlanduser.dao.CustomerDao;
import helperlanduser.model.Contact;
import helperlanduser.model.Customer;
import helperlanduser.model.Login;

@Controller
public class PublicPagesController {

	@Autowired
	private CustomerDao customerDao;

	@Autowired
	ContactDao contactdao;

	@RequestMapping("/homepage")
	public String home() {
		return "Homepage";
	}

	@RequestMapping("/faq")
	public String faq() {
		return "FAQ";
	}

	@RequestMapping("/contact")
	public String contact() {
		return "Contact";
	}

	@RequestMapping("/about")
	public String about() {
		return "About";
	}

	@RequestMapping("/warranty")
	public String warranty() {
		return "Warranty";
	}

	@RequestMapping("/prices")
	public String prices() {
		return "Prices";
	}

	@RequestMapping("/bap")
	public String bap() {
		return "ServiceProvider-BAP";
	}

	@RequestMapping("/customerDashboard")
	public String cdash() {
		return "CS-Dashboard";
	}

	@RequestMapping("/ServiceHistory-customer")
	public String chist() {
		return "Customer - Service History";
	}

	@RequestMapping("/Settings-customer")
	public String csettings() {
		return "SettingsCust";
	}

	@RequestMapping("/Settings-ServiceProvider")
	public String spsettings() {
		return "SettingsSP";
	}

	@RequestMapping("/upcomingservice")
	public String spupcoming() {
		return "Service Provider - Upcoming Service";
	}

	@RequestMapping("/blockcustomer")
	public String spblock() {
		return "SP-Block";
	}

	@RequestMapping("/serviceproviderDashboard")
	public String spdash() {
		return "SP - Dashboard";
	}

	@RequestMapping("/servicehistory")
	public String sphist() {
		return "SP-History";
	}
	
	@RequestMapping("/AdminUserManagement")
	public String AUM() {
		return "Admin - User Management";
	}

	@RequestMapping("/AdminServiceRequests")
	public String ASR() {
		return "Admin - Service Requests";
	}
	
	@RequestMapping("/BookNow")
	public String booknow() {
		return "BookNow";
	}

//	@RequestMapping(value = "/addCustomer", method = RequestMethod.POST)
//	public RedirectView addcust(@ModelAttribute Customer customer) {
//		System.out.println(customer);
//		this.customerDao.createCustomer(customer);
//		RedirectView redirectView = new RedirectView();
////		redirectView.setUrl(null)
//		return redirectView;
//	}

	@RequestMapping(value = "/addCustomer", method = RequestMethod.POST)
	public String addcustomer(@ModelAttribute("customer") Customer customer) {
		System.out.println(customer);
		customer.setUserTypeId(2);
		customerDao.save(customer);
		return "Homepage";
	}

	@RequestMapping(value = "/addServiceProvider", method = RequestMethod.POST)
	public String addServiceProvider(@ModelAttribute("customer") Customer customer) {
		System.out.println(customer);
		customer.setUserTypeId(3);
		customerDao.save(customer);
		return "ServiceProvider-BAP";
	}

	@RequestMapping(value = "/savecontact", method = RequestMethod.POST)
	public String saveContact(@ModelAttribute("con") Contact con) {
		contactdao.save(con);
		return "Contact";
	}

	@RequestMapping(value = "/loginprocess", method = RequestMethod.POST)
	public ModelAndView loginProcess(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("login") Login login) {
		ModelAndView mav = null;

		Customer customer = customerDao.validateUser(login);


		if (null != customer) {
			int type = customer.getUserTypeId();
			System.out.println(type);
			if (type == 2) {
				mav = new ModelAndView("CS-Dashboard");
			} else if (type == 3) {
				mav = new ModelAndView("SP - Dashboard");
			}
			else {
				
			}
//			mav.addObject("firstname", customer.getFirstName());
		} 
		
		else {
			mav = new ModelAndView("Homepage");
//			mav.addObject("message", "Username or Password is wrong!!");
		}

		return mav;
	}

	public void sendEmail() {
		Properties prop = new Properties();
		prop.put("mail.smtp.auth", true);
//		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.mailtrap.io");
		prop.put("mail.smtp.port", "25");
		prop.put("mail.smtp.ssl.trust", "smtp.mailtrap.io");

		Session session = Session.getInstance(prop, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("c998dea467fa17", "fbba8002651019");
			}
		});

		try {
			
			Message message = new MimeMessage(session);

			message.setFrom(new InternetAddress("helperland@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("h@gmail.com"));
			message.setSubject("Forgot Password");

			String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
			String pwd = RandomStringUtils.random(7, characters);
			System.out.println(pwd);

			String msg = "Your new password is " + pwd;

			Customer customer = new Customer();

			customer.setPassword(pwd);
			customer.setEmail("h@gmail.com");
			String pass = customer.getPassword();

			System.out.println(pass);
			System.out.println(customer.getEmail());

			customerDao.updatePassword(customer);

			MimeBodyPart mimeBodyPart = new MimeBodyPart();
			mimeBodyPart.setContent(msg, "text/html; charset=utf-8");

			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(mimeBodyPart);

			message.setContent(multipart);

			Transport.send(message);
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/forgotpassword", method = RequestMethod.POST)
	public ModelAndView forgotpassword(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("customer") Customer customer) {
		ModelAndView mav = null;

		Customer cust = customerDao.validEmail(customer);
//		String custString=cust.toString();
		
		if (null != cust) {
			sendEmail();
			System.out.println("Email sent");
			int type = cust.getUserTypeId();
			System.out.println(type);
			if (type == 2) {
				mav = new ModelAndView("CS-Dashboard");
			} else if (type == 3) {
				mav = new ModelAndView("SP - Dashboard");
			}
		}
		else{
			mav = new ModelAndView("Homepage");
		}

		System.out.println("----------------");
		return mav;
		
	}

}
