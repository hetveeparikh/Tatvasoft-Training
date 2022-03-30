package com.ctrl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
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
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import helperlanduser.dao.BookingAddressDao;
import helperlanduser.dao.CustomerRequestsDao;
import helperlanduser.dao.CustomerSettingsDetailsDao;
import helperlanduser.dao.ServiceProviderDao;
import helperlanduser.model.Customer;
import helperlanduser.model.Rating;
import helperlanduser.model.ServiceRequest;
import helperlanduser.model.UserAddress;

@Controller
public class CustomerPageController {

	@Autowired
	CustomerSettingsDetailsDao customerSettingsDetailsDao;

	@Autowired
	BookingAddressDao addressDao;

	@Autowired
	CustomerRequestsDao customerRequestsDao;

	@Autowired
	ServiceProviderDao serviceProviderDao;

	@RequestMapping("/customerDashboard")
	public String cdash(HttpServletRequest request, Model model, ServiceRequest serviceRequest) {

		HttpSession session = request.getSession();

		if (session.getAttribute("userid") != null && (session.getAttribute("usertypeid") + "").equals("2")) {
			model.addAttribute("settingsfirstname", session.getAttribute("firstname"));
			model.addAttribute("settingslastname", session.getAttribute("lastname"));
			model.addAttribute("settingsmobile", session.getAttribute("custmobile"));
			model.addAttribute("settingsemail", session.getAttribute("custemail"));
			
			String DateOfBirth = "" + session.getAttribute("custdob");
			String[] DOB = DateOfBirth.split("\\s+");
			
			model.addAttribute("settingscustbdate", DOB[0]);
			model.addAttribute("settingscustbmonth", DOB[1]);
			model.addAttribute("settingscustbyear", DOB[2]);

			return "CS-Dashboard";
		}

		else {
			model.addAttribute("plslogin", "Please Login First!");
			model.addAttribute("plslogindiv", "style='display: block !important';");
			return "Homepage";
		}

	}

	@RequestMapping("/custDashboard")
	public @ResponseBody List<ServiceRequest> cdashboard(HttpServletRequest request, Model model,
			ServiceRequest serviceRequest) {
		HttpSession session = request.getSession();
		String userid = "" + session.getAttribute("userid");
		int id = Integer.parseInt(userid);
		serviceRequest.setUserId(id);
		List<ServiceRequest> custServiceRequests = customerRequestsDao.readRequests(id);
		return custServiceRequests;
	}

	@RequestMapping(value = "/updateCustomerDetails/{FirstName},{LastName},{Email},{Mobile},{Day},{Month},{Year},{Language}", method = RequestMethod.GET)
	public @ResponseBody void settingsCustDetails(@PathVariable("FirstName") String FirstName,
			@PathVariable("LastName") String LastName, @PathVariable("Email") String Email,
			@PathVariable("Mobile") String Mobile, @PathVariable("Day") String Day, @PathVariable("Month") String Month,
			@PathVariable("Year") String Year, @PathVariable("Language") String Language, HttpServletRequest request,
			Customer customer, Model model) {

		HttpSession session = request.getSession();
		String str = "" + session.getAttribute("userid");
		int temp = Integer.parseInt(str);
		customer.setUserId(temp);

		session.setAttribute("firstname", FirstName);
		session.setAttribute("lastname", LastName);
		session.setAttribute("custmobile", Mobile);
		session.setAttribute("custemail", Email);
		model.addAttribute("settingsfirstname", session.getAttribute("firstname"));
		model.addAttribute("settingslastname", session.getAttribute("lastname"));
		model.addAttribute("settingsmobile", session.getAttribute("custmobile"));
		model.addAttribute("settingsemail", session.getAttribute("custemail"));
		
		String DateOfBirth = "" + Day + " " + Month + " " + Year;
		customer.setDateOfBirth(DateOfBirth);
		
		session.setAttribute("custdob", DateOfBirth);
				
		model.addAttribute("settingscustbdate", Day);
		model.addAttribute("settingscustbmonth", Month);
		model.addAttribute("settingscustbyear", Year);

		customerSettingsDetailsDao.updateCustomer(customer);
	}

	@RequestMapping(value = "/updateCustomerPassword/{OldPassword},{NewPassword}", method = RequestMethod.GET)
	public @ResponseBody int settingsCustAddress(@PathVariable("OldPassword") String OldPassword,
			@PathVariable("NewPassword") String NewPassword, HttpServletRequest request, Customer customer,
			Model model) {
		HttpSession session = request.getSession();
		String str = "" + session.getAttribute("userid");
		int temp = Integer.parseInt(str);
		customer.setUserId(temp);

		customer.setPassword(NewPassword);
		int checkpassword = customerSettingsDetailsDao.updatePassword(customer, OldPassword);

		return checkpassword;
	}

	@RequestMapping(value = "/addAddressSettings/{AddressLine1},{AddressLine2},{PostalCode},{City},{Mobile}", method = RequestMethod.GET)
	public @ResponseBody void ajaxAddAddressSettings(@PathVariable("AddressLine1") String AddressLine1,
			@PathVariable("AddressLine2") String AddressLine2, @PathVariable("PostalCode") String postalcode,
			@PathVariable("City") String City, @PathVariable("Mobile") String Mobile,
			@ModelAttribute UserAddress userAddress, Model model, HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		HttpSession session = req.getSession();
		String str = "" + session.getAttribute("userid");
		int temp = Integer.parseInt(str);
		userAddress.setUserId(temp);
		String email = "" + session.getAttribute("custemail");
		userAddress.setEmail(email);
		this.addressDao.addAddress(userAddress);
	}

	@RequestMapping(value = "/readaddresssettings")
	public @ResponseBody List<UserAddress> readaddress(HttpServletRequest req, HttpServletResponse res,
			@ModelAttribute("useraddress") UserAddress useraddress, Model model) throws Exception {

		HttpSession session = req.getSession();
		Object id = session.getAttribute("userid");
		List<UserAddress> userAddress = addressDao.readAddress(id);
		return userAddress;
	}

	@RequestMapping(value = "/editAddressSettings/{AddressLine1},{AddressLine2},{PostalCode},{City},{Mobile},{addressid}", method = RequestMethod.GET)
	public @ResponseBody void settingsEditAddress(@PathVariable("AddressLine1") String AddressLine1,
			@PathVariable("AddressLine2") String AddressLine2, @PathVariable("PostalCode") String postalcode,
			@PathVariable("City") String City, @PathVariable("Mobile") String Mobile,
			@PathVariable("addressid") String addressid, HttpServletRequest request, UserAddress userAddress,
			Model model) {

		HttpSession session = request.getSession();
		String str = "" + session.getAttribute("userid");
		int temp = Integer.parseInt(str);
		userAddress.setUserId(temp);

		addressDao.updateAddressSettings(userAddress, addressid);
	}

	@RequestMapping(value = "/deleteAddressSettings/{addressid}", method = RequestMethod.GET)
	public @ResponseBody void settingsDeleteAddress(@PathVariable("addressid") String addressid,
			HttpServletRequest request, UserAddress userAddress, Model model) {

		HttpSession session = request.getSession();
		String str = "" + session.getAttribute("userid");
		int temp = Integer.parseInt(str);
		userAddress.setUserId(temp);

		addressDao.deleteAddress(userAddress, addressid);
	}

	@RequestMapping(value = "/rescheduleRequests/{ServiceStartDate},{ServiceStartTime},{serviceid}", method = RequestMethod.GET)
	public @ResponseBody void rescheduleRequest(@PathVariable("ServiceStartDate") String ServiceStartDate,
			@PathVariable("ServiceStartTime") String ServiceStartTime, @PathVariable("serviceid") String serviceid,
			HttpServletRequest request, ServiceRequest serviceRequest, Model model) {

		HttpSession session = request.getSession();
		String str = "" + session.getAttribute("userid");
		int temp = Integer.parseInt(str);
		serviceRequest.setUserId(temp);

		SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		
		int spid = customerRequestsDao.fetchSpId(serviceid);
		serviceRequest.setModifiedBy(temp);
		serviceRequest.setModifiedDate(dtf.format(date));

		if (spid == 0) {
			int reschedule = customerRequestsDao.rescheduleRequests(serviceRequest, serviceid);
			// return reschedule;
			List<Customer> splist = serviceProviderDao.getOtherSP(temp);

			String toemail = splist.stream().map(Customer::getEmail).collect(Collectors.joining(","));
			String message1 = "The Service Request with Id 27" + serviceid
					+ " is now available at new timings.\nService Date : " + ServiceStartDate
					+ "\nService Time : " + ServiceStartTime + "\n\nFor more details, visit dashboard.";
			String subject1 = "New Timings of Service Request!";
			String from = "helperland.hetvee@gmail.com";
			sendServiceEmail(message1, subject1, toemail, from);

		} else {
			List<ServiceRequest> splist = customerRequestsDao.getAllServiceStartDate(spid);
			Iterator<ServiceRequest> iterator = splist.iterator();
			while (iterator.hasNext()) {
				if (ServiceStartDate.equals(iterator.next().getServiceStartDate())) {
					int reschedule = customerRequestsDao.rescheduleNewRequest(serviceRequest, serviceid);

					List<Customer> splist1 = serviceProviderDao.getOtherSP(temp);

					String toemail = splist1.stream().map(Customer::getEmail).collect(Collectors.joining(","));
					String message1 = "The Service Request with Id 27" + serviceid
							+ " is available now available at new timings.\nService Date : " + ServiceStartDate
							+ "\nService Time : " + ServiceStartTime + "\n\nFor more details, visit dashboard.";
					String subject1 = "New Service Request!";
					String from = "helperland.hetvee@gmail.com";
					sendServiceEmail(message1, subject1, toemail, from);

					String email = customerRequestsDao.cancelEmail(Integer.parseInt(serviceid));
					String message = "The service request with Service Id : 27" + serviceid
							+ " has been cancelled due to the conflict, as it has been rescheduled by the customer. Sorry for the inconvenience.";
					String subject = "Service Request Cancelled";
					sendServiceEmail(message, subject, email, from);

					// return reschedule;

					break;
				} else {
					int reschedule = customerRequestsDao.rescheduleRequests(serviceRequest, serviceid);
					
					String email = customerRequestsDao.cancelEmail(Integer.parseInt(serviceid));
					String message = "The service request with Service Id : 27" + serviceid
							+ " has been  rescheduled by the customer. The New timings are:\nService Date : " + ServiceStartDate
							+ "\nService Time : " + ServiceStartTime + "\n\nFor more details, visit dashboard.";
					String subject = "Service Request Rescheduled";
					String from = "helperland.hetvee@gmail.com";
					sendServiceEmail(message, subject, email, from);
					
					// return reschedule;
				}
			}
		}
	}

	@RequestMapping(value = "/cancelrequest/{serviceid}", method = RequestMethod.GET)
	public @ResponseBody int cancelRequest(@PathVariable("serviceid") String serviceid, HttpServletRequest request,
			ServiceRequest serviceRequest, Model model) {

		HttpSession session = request.getSession();
		String str = "" + session.getAttribute("userid");
		int temp = Integer.parseInt(str);
		serviceRequest.setUserId(temp);
		int cancel = customerRequestsDao.cancelrequest(serviceRequest, serviceid);

		if (cancel == 1) {
			String email = customerRequestsDao.cancelEmail(Integer.parseInt(serviceid));
			if (email != null) {
				String message = "The service request with Service Id : 27" + serviceid
						+ " has been cancelled by the customer. Sorry for the inconvenience.";
				String subject = "Service Request Cancelled";
				String from = "helperland.hetvee@gmail.com";
				sendServiceEmail(message, subject, email, from);
			}
		}

		return cancel;
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

	@RequestMapping(value = "/detailsmodal/{serviceid}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> details(@PathVariable("serviceid") String serviceid,
			HttpServletRequest request, ServiceRequest serviceRequest, Model model) {

		HttpSession session = request.getSession();
		String str = "" + session.getAttribute("userid");
		int temp = Integer.parseInt(str);
		serviceRequest.setUserId(temp);

		HashMap<String, Object> hashModal = customerRequestsDao.detailsmodal(serviceid);

		return hashModal;
	}

	@RequestMapping("/customerServiceHistory")
	public @ResponseBody List<ServiceRequest> chistory(HttpServletRequest request, Model model,
			ServiceRequest serviceRequest) {
		HttpSession session = request.getSession();
		String userid = "" + session.getAttribute("userid");
		int id = Integer.parseInt(userid);
		serviceRequest.setUserId(id);
		List<ServiceRequest> custServiceRequests = customerRequestsDao.readHistory(id);
		return custServiceRequests;
	}

	@RequestMapping(value = "/ratingsp/{OnTimeArrival},{Friendly},{QualityOfService},{ServiceRequestId},{RatingTo},{Comments}", method = RequestMethod.GET)
	public @ResponseBody int ratingssp(@PathVariable("OnTimeArrival") int OnTimeArrival,
			@PathVariable("Friendly") int Friendly, @PathVariable("QualityOfService") int QualityOfService,
			@PathVariable("ServiceRequestId") int ServiceRequestId, @PathVariable("RatingTo") int RatingTo,
			@PathVariable("Comments") String Comments, HttpServletRequest request, ServiceRequest serviceRequest,
			Model model, Rating rating) {

		HttpSession session = request.getSession();
		String str = "" + session.getAttribute("userid");
		int temp = Integer.parseInt(str);

		SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();

		int ratings = Math.round((OnTimeArrival + Friendly + QualityOfService) / 3);

		rating.setComments(Comments);
		rating.setFriendly(Friendly);
		rating.setOnTimeArrival(OnTimeArrival);
		rating.setQualityOfService(QualityOfService);
		rating.setRatingFrom(temp);
		rating.setRatingTo(RatingTo);
		rating.setRatings(ratings);
		rating.setServiceRequestId(ServiceRequestId);
		rating.setRatingDate(dtf.format(date));

		int ratingss = customerRequestsDao.ratingsp(rating);
		return ratingss;

	}

}