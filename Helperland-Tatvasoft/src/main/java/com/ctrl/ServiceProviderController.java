package com.ctrl;

import java.util.HashMap;
import java.util.List;
import java.util.Properties;
import java.util.stream.Collectors;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
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
import helperlanduser.model.Rating;
import helperlanduser.model.ServiceRequest;
import helperlanduser.model.UserAddress;

@Controller
public class ServiceProviderController {

	@Autowired
	ServiceProviderDao serviceProviderDao;
	
	@Autowired
	SPSettingsDao spSettingsDao;

	@RequestMapping("/ServiceProviderDashboard")
	public String spdash(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();

		if (session.getAttribute("userid") != null && (session.getAttribute("usertypeid")+"").equals("3")) {
		
			model.addAttribute("settingsfirstname", session.getAttribute("firstname"));
			model.addAttribute("settingslastname", session.getAttribute("lastname"));
			model.addAttribute("settingsmobile", session.getAttribute("custmobile"));
			model.addAttribute("settingsemail", session.getAttribute("custemail"));

			
			UserAddress spaddress = spSettingsDao.readSpAddress(""+session.getAttribute("userid"));
			
			model.addAttribute("settingsaddline1", spaddress.getAddressLine1());
			model.addAttribute("settingsaddline2", spaddress.getAddressLine2());
			model.addAttribute("settingscity", spaddress.getCity());
			model.addAttribute("settingspostalcode", spaddress.getPostalCode());
			
			model.addAttribute("settingsavatar", session.getAttribute("spavatar"));
			return "SP - Dashboard";
		}

		else {
			model.addAttribute("plsbook", "Please Login First!");
			model.addAttribute("plsbookdiv", "style='display: block !important';");
			return "Homepage";
		}
	}
	
	@RequestMapping("/spDashboard")
	public @ResponseBody List<ServiceRequest> spdashboard(HttpServletRequest request, Model model,
			ServiceRequest serviceRequest) {
		HttpSession session = request.getSession();
		String userid = "" + session.getAttribute("userid");
		int id = Integer.parseInt(userid);
		serviceRequest.setUserId(id);
		List<ServiceRequest> dashlist = serviceProviderDao.servicedash();
		return dashlist;
	}
	
	@RequestMapping(value = "/spdetailsmodal/{serviceid}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> details(@PathVariable("serviceid") String serviceid,
			 HttpServletRequest request, ServiceRequest serviceRequest ,
			Model model) throws Exception{
		
		HashMap<String, Object> hashModal =  serviceProviderDao.spdetailsmodal(serviceid);
		
		return hashModal;
	}

	@RequestMapping(value = "/acceptsprequest/{serviceid}", method = RequestMethod.GET)
	public @ResponseBody int acceptrequest(@PathVariable("serviceid") String serviceid,
			 HttpServletRequest request, ServiceRequest serviceRequest ,
			Model model) {

		HttpSession session = request.getSession();
		String str = "" + session.getAttribute("userid");
		int temp = Integer.parseInt(str);
		serviceRequest.setUserId(temp);
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
			
			String toemail=splist.stream().map(Customer::getEmail).collect(Collectors.joining(","));
			String message1="Service Request with Id 27"+ serviceid+" has been accepted.";
			String subject1="Service Request Has Been Accepted";
			sendServiceEmail(message1, subject1, toemail, from);
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
			
			String toemail=splist.stream().map(Customer::getEmail).collect(Collectors.joining(","));
			String message1="The Service Request with Id 27"+ serviceid+" is available again.";
			String subject1="Service Request Now Available Again!";
			sendServiceEmail(message1, subject1, toemail, from);
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
		
		return history;
	}
	
	@RequestMapping("/spratings")
	public @ResponseBody List<Rating> sprating(HttpServletRequest request, Model model,
			ServiceRequest serviceRequest) {
		HttpSession session = request.getSession();
		String userid = "" + session.getAttribute("userid");
		int id = Integer.parseInt(userid);
		serviceRequest.setUserId(id);
		
		List<Rating> ratings =  serviceProviderDao.ratings(id);
		
		return ratings;
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
				return new PasswordAuthentication("helperland.hetvee@gmail.com", "");
			}

		});

		session.setDebug(true);

		MimeMessage m = new MimeMessage(session);

		try {

			m.setFrom(from);

			m.addRecipients(Message.RecipientType.TO, to);

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
	
	@RequestMapping(value = "/updateSPDetails/{FirstName},{LastName},{Email},{Mobile},{Day},{Month},{Year},{Nationality},{Gender},{AddressLine1},{AddressLine2},{PostalCode},{City},{Avatar}", method = RequestMethod.GET)
	public @ResponseBody void settingsCustDetails(@PathVariable("FirstName") String FirstName,
			@PathVariable("LastName") String LastName, @PathVariable("Email") String Email,
			@PathVariable("Mobile") String Mobile, @PathVariable("Day") String Day, @PathVariable("Month") String Month,
			@PathVariable("Year") String Year, @PathVariable("Nationality") String Nationality,
			@PathVariable("Gender") String Gender,@PathVariable("AddressLine1") String AddressLine1,
			@PathVariable("AddressLine2") String AddressLine2, @PathVariable("PostalCode") String postalcode,
			@PathVariable("City") String City, @PathVariable("Avatar") String Avatar, HttpServletRequest request,
			Customer customer, Model model, UserAddress userAddress) {

		HttpSession session = request.getSession();
		String str = "" + session.getAttribute("userid");
		int temp = Integer.parseInt(str);
		customer.setUserId(temp);
		userAddress.setUserId(temp);
		userAddress.setEmail("" + session.getAttribute("custemail"));

		String DateOfBirth = "" + Day + " " + Month + " " + Year;
		customer.setDateOfBirth(DateOfBirth);
		customer.setUserProfilePicture(Avatar);
		
		session.setAttribute("firstname", FirstName );
		session.setAttribute("lastname", LastName);
		session.setAttribute("custmobile", Mobile);
		session.setAttribute("custemail", Email);
		session.setAttribute("spavatar", Avatar);
		
		model.addAttribute("settingsfirstname", session.getAttribute("firstname"));
		model.addAttribute("settingslastname", session.getAttribute("lastname"));
		model.addAttribute("settingsmobile", session.getAttribute("custmobile"));
		model.addAttribute("settingsemail", session.getAttribute("custemail"));
		model.addAttribute("settingsaddline1", AddressLine1);
		model.addAttribute("settingsaddline2", AddressLine2);
		model.addAttribute("settingscity", City);
		model.addAttribute("settingspostalcode", postalcode);
		model.addAttribute("settingsavatar", Avatar);
		
		spSettingsDao.updateSp(customer);
		spSettingsDao.updateSpAddressSettings(userAddress);
		
	}
	
}
