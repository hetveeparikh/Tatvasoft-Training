package com.ctrl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import helperlanduser.dao.SPSettingsDao;
import helperlanduser.dao.ServiceProviderDao;
import helperlanduser.model.Customer;
import helperlanduser.model.ServiceRequest;

@Controller
public class ServiceProviderController {

	@Autowired
	ServiceProviderDao serviceProviderDao;
	
	@Autowired
	SPSettingsDao spSettingsDao;

	@RequestMapping("/ServiceProviderDashboard")
	public String spdash(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("userid"));
		System.out.println(session.getAttribute("usertypeid"));
		model.addAttribute("settingsfirstname", session.getAttribute("firstname"));
		model.addAttribute("settingslastname", session.getAttribute("lastname"));
		model.addAttribute("settingsmobile", session.getAttribute("custmobile"));
		model.addAttribute("settingsemail", session.getAttribute("custemail"));

		Object temp = session.getAttribute("usertypeid");
		String str = temp.toString();

		if (session.getAttribute("userid") != null && str.equals("3")) {
			List<ServiceRequest> spServiceRequests = serviceProviderDao.servicedash();
			model.addAttribute("sprequests", spServiceRequests);
			System.out.println("in dashboard controller");
			return "SP - Dashboard";
		}

		else {
			request.setAttribute("notloggedin", "alertlogin");
			return "Homepage";
		}
	}
	
	@RequestMapping(value = "/spdetailsmodal/{serviceid}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> details(@PathVariable("serviceid") String serviceid,
			 HttpServletRequest request, ServiceRequest serviceRequest ,
			Model model) throws Exception{

		
		System.out.println(serviceid+"details con");
		
		HashMap<String, Object> hashModal =  serviceProviderDao.spdetailsmodal(serviceid);
		
		return hashModal;
	}

	@RequestMapping(value = "/acceptrequest/{serviceid}", method = RequestMethod.GET)
	public @ResponseBody int rescheduleRequest(@PathVariable("serviceid") String serviceid,
			 HttpServletRequest request, ServiceRequest serviceRequest ,
			Model model) {

		HttpSession session = request.getSession();
		String str = "" + session.getAttribute("userid");
		int temp = Integer.parseInt(str);
		serviceRequest.setUserId(temp);
		System.out.println("req con");
		int accept = serviceProviderDao.acceptrequest(str,serviceid);
		
		if(accept == 1) {
			String email = serviceProviderDao.spEmail(Integer.parseInt(serviceid));
			String message="Your service request with Service Id = 27"+serviceid+" has been accepted!\n\nYour Service Provider Details are as follows:\n"+
							"Name: "+ session.getAttribute("firstname") + " "+ session.getAttribute("lastname") +
							"\nMobile No.: "+ session.getAttribute("custmobile")+
							"\nEmail : "+ session.getAttribute("custemail") +"\n\nYou can get more details on your dahboard.";
			String subject="Service Request Accepted!";
			String from = "helperland.hetvee@gmail.com";
			sendServiceEmail(message, subject, email, from);
			
			List<Customer> splist = serviceProviderDao.getOtherSP(temp);
			Iterator<Customer> iterator = splist.iterator();
			while (iterator.hasNext()) {
				String to = iterator.next().getEmail();
				String message1="Service Request with Id 27"+ serviceid+" has been accepted.";
				String subject1="Service Request Has Been Accepted";
				sendServiceEmail(message1, subject1, to, from);
			}
		}
		
		return accept;
	}
	
	@RequestMapping(value = "/cancelsprequest/{serviceid}", method = RequestMethod.GET)
	public @ResponseBody int cancelspRequest(@PathVariable("serviceid") String serviceid,
			 HttpServletRequest request, ServiceRequest serviceRequest ,
			Model model) {

		HttpSession session= request.getSession();
		String str = "" + session.getAttribute("userid");
		int temp = Integer.parseInt(str);
		serviceRequest.setUserId(temp);
		int cancel = serviceProviderDao.cancelrequest(serviceid);
		
		if(cancel == 1) {
			String email = serviceProviderDao.spEmail(Integer.parseInt(serviceid));
			String message="Your service request with Service Id : 27"+serviceid+" has been cancelled by your Service Provider.\nYou will get notified as soon as another service provider accepts your request. Sorry for the inconvenience.";
			String subject="Service Request Cancelled";
			String from = "helperland.hetvee@gmail.com";
			sendServiceEmail(message, subject, email, from);
			
			List<Customer> splist = serviceProviderDao.getOtherSP(temp);
			Iterator<Customer> iterator = splist.iterator();
			while (iterator.hasNext()) {
				String to = iterator.next().getEmail();
				String message1="The Service Request with Id 27"+ serviceid+" is available again.";
				String subject1="Service Request Now Available Again!";
				sendServiceEmail(message1, subject1, to, from);
			}
		}
				
		return cancel;
	}
	
	@RequestMapping(value = "/completedsprequest/{serviceid}", method = RequestMethod.GET)
	public @ResponseBody int completedsprequest(@PathVariable("serviceid") String serviceid,
			 HttpServletRequest request, ServiceRequest serviceRequest ,
			Model model) {

		int done = serviceProviderDao.completedrequest(serviceid);
		
		if(done==1) {
			String email = serviceProviderDao.spEmail(Integer.parseInt(serviceid));
			String message="Your service request with Service Id : 27"+serviceid+" has been completed by your Service Provider.";
			String subject="Service Request Completed!";
			String from = "helperland.hetvee@gmail.com";
			sendServiceEmail(message, subject, email, from);
		}
				
		return done;
	}
	
	
	@RequestMapping("/upcomingservices")
	public @ResponseBody List<ServiceRequest> upcomingservice(HttpServletRequest request, Model model,
			ServiceRequest serviceRequest) {
		HttpSession session = request.getSession();
		String userid = "" + session.getAttribute("userid");
		int id = Integer.parseInt(userid);
		serviceRequest.setUserId(id);
		
		List<ServiceRequest> services =  serviceProviderDao.upcomingservices(id);
		
		System.out.println("in upcoming controller");
		return services;
	}
	
	@RequestMapping("/spservicehistory")
	public @ResponseBody List<ServiceRequest> spservicehistory(HttpServletRequest request, Model model,
			ServiceRequest serviceRequest) {
		HttpSession session = request.getSession();
		String userid = "" + session.getAttribute("userid");
		int id = Integer.parseInt(userid);
		serviceRequest.setUserId(id);
		
		List<ServiceRequest> history =  serviceProviderDao.servicehistory(id);
		
		System.out.println("in history controller");
		return history;
	}
	
	public void sendServiceEmail(String message, String subject, String to, String from) {

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

			m.setFrom(from);

			m.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			m.setSubject(subject);

			m.setText(message);

			Transport.send(m);

			System.out.println("Sent success...................");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/updateSPPassword/{OldPassword},{NewPassword}", method = RequestMethod.GET)
	public @ResponseBody int settingsCustAddress(@PathVariable("OldPassword") String OldPassword,
			@PathVariable("NewPassword") String NewPassword, HttpServletRequest request, Customer customer,
			Model model) {
		HttpSession session = request.getSession();
		String str = "" + session.getAttribute("userid");
		int temp = Integer.parseInt(str);
		customer.setUserId(temp);

		customer.setPassword(NewPassword);
		int checkpassword = spSettingsDao.updatePassword(customer, OldPassword);

		return checkpassword;
	}
	
}
