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
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import helperlanduser.dao.AdminDao;
import helperlanduser.dao.CustomerRequestsDao;
import helperlanduser.dao.ServiceProviderDao;
import helperlanduser.model.Customer;
import helperlanduser.model.ServiceRequest;

@Controller
public class AdminController {
	
	@Autowired
	AdminDao adminDao;
	
	@Autowired
	CustomerRequestsDao customerRequestsDao;
	
	@Autowired
	ServiceProviderDao serviceProviderDao;

	@RequestMapping("/admin")
	public String adminSR (Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute("userid") != null && (session.getAttribute("usertypeid")+"").equals("1")) {
			model.addAttribute("adminfirstname", session.getAttribute("firstname"));
			model.addAttribute("adminlastname", session.getAttribute("lastname"));
			return "Admin";
		}
		else {
			model.addAttribute("plsbook", "Please Login First!");
			model.addAttribute("plsbookdiv", "style='display: block !important';");
			return "Homepage";
		}
	}
	
	@RequestMapping("/adminUM")
	public @ResponseBody List<Customer> adminmanage(HttpServletRequest request, Model model,Customer customer) {
		List<Customer> users = adminDao.adminManagement();
		return users;
	}
	
	@RequestMapping("/adminSR")
	public @ResponseBody List<ServiceRequest> adminrequest(HttpServletRequest request, Model model,Customer customer,ServiceRequest serviceRequest) {
		List<ServiceRequest> requests = adminDao.adminRequests();
		return requests;
	}
	
	@RequestMapping(value = "/adminactive/{UserId},{IsActive}", method = RequestMethod.GET)
	public @ResponseBody int activestatus(@PathVariable("UserId") int UserId, @PathVariable("IsActive") int IsActive,Customer customer, HttpServletRequest request, Model model) {
		int toggleactive;
		if(IsActive==0) {
			toggleactive=1;
		}
		else {
			toggleactive=0;
		}
		customer.setIsActive(toggleactive);
		customer.setUserId(UserId);
		int active = adminDao.activateuser(customer);
		return active;
	}
	
	@RequestMapping(value = "/adminapprove/{UserId}", method = RequestMethod.GET)
	public @ResponseBody int approvestatus(@PathVariable("UserId") int UserId, Customer customer, HttpServletRequest request, Model model) {
		customer.setUserId(UserId);
		int approve = adminDao.approveuser(customer);
		return approve;
	}
	
	@RequestMapping(value = "/admindelete/{UserId}", method = RequestMethod.GET)
	public @ResponseBody int deletestatus(@PathVariable("UserId") int UserId, Customer customer, HttpServletRequest request, Model model) {
		customer.setUserId(UserId);
		int delete = adminDao.deleteuser(customer);
		return delete;
	}
	
	@RequestMapping(value = "/detailsmodaladmin/{serviceid}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> detailsadmin(@PathVariable("serviceid") String serviceid,
			HttpServletRequest request, ServiceRequest serviceRequest, Model model) {

		HttpSession session = request.getSession();
		String str = "" + session.getAttribute("userid");
		int temp = Integer.parseInt(str);
		serviceRequest.setUserId(temp);

		HashMap<String, Object> hashModal = customerRequestsDao.detailsmodal(serviceid);

		return hashModal;
	}
	
	@RequestMapping(value = "/rescheduleRequestsAdmin/{ServiceStartDate},{ServiceStartTime},{serviceid}", method = RequestMethod.GET)
	public @ResponseBody void rescheduleRequestAdmin(@PathVariable("ServiceStartDate") String ServiceStartDate,
			@PathVariable("ServiceStartTime") String ServiceStartTime, @PathVariable("serviceid") String serviceid,
			HttpServletRequest request, ServiceRequest serviceRequest, Model model) {
		
		SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		
		int spid = customerRequestsDao.fetchSpId(serviceid);
		serviceRequest.setModifiedDate(dtf.format(date));

		if (spid == 0) {
			int reschedule = adminDao.rescheduleRequests(serviceRequest, serviceid);
			// return reschedule;
			List<Customer> splist = adminDao.getOtherSPadmin();

			String toemail = splist.stream().map(Customer::getEmail).collect(Collectors.joining(","));
			String message1 = "The Service Request with Id 27" + serviceid
					+ " is rescheduled by the admin and now available at new timings.\nService Date : " + ServiceStartDate
					+ "\nService Time : " + ServiceStartTime + "\n\nFor more details, visit dashboard.";
			String subject1 = "New Timings of Service Request!";
			String from = "helperland.hetvee@gmail.com";
			sendServiceEmail(message1, subject1, toemail, from);

		} else {
			List<ServiceRequest> splist = customerRequestsDao.getAllServiceStartDate(spid);
			Iterator<ServiceRequest> iterator = splist.iterator();
			while (iterator.hasNext()) {
				if (ServiceStartDate.equals(iterator.next().getServiceStartDate())) {
					int reschedule = adminDao.rescheduleAdminRequests(serviceRequest, serviceid);

					List<Customer> splist1 = adminDao.getOtherSPadmin();

					String toemail = splist1.stream().map(Customer::getEmail).collect(Collectors.joining(","));
					String message1 = "The Service Request with Id 27" + serviceid
							+ " is rescheduled by the admin and now available at new timings.\nService Date : " + ServiceStartDate
							+ "\nService Time : " + ServiceStartTime + "\n\nFor more details, visit dashboard.";
					String subject1 = "New Service Request!";
					String from = "helperland.hetvee@gmail.com";
					sendServiceEmail(message1, subject1, toemail, from);

					String email = customerRequestsDao.cancelEmail(Integer.parseInt(serviceid));
					String message = "The service request with Service Id : 27" + serviceid
							+ " has been cancelled due to the conflict, as it has been rescheduled by the admin. Sorry for the inconvenience.";
					String subject = "Service Request Cancelled";
					sendServiceEmail(message, subject, email, from);

					// return reschedule;

					break;
				} else {
					int reschedule = adminDao.rescheduleRequests(serviceRequest, serviceid);
					
					String email = customerRequestsDao.cancelEmail(Integer.parseInt(serviceid));
					String message = "The service request with Service Id : 27" + serviceid
							+ " has been  rescheduled by the admin. The New timings are:\nService Date : " + ServiceStartDate
							+ "\nService Time : " + ServiceStartTime + "\n\nFor more details, visit dashboard.";
					String subject = "Service Request Rescheduled";
					String from = "helperland.hetvee@gmail.com";
					sendServiceEmail(message, subject, email, from);
					
					// return reschedule;
				}
			}
		}
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

			m.addRecipients(Message.RecipientType.TO, to);

			m.setSubject(subject);

			m.setText(message);

			Transport.send(m);

			System.out.println("Sent success...................");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
