package com.ctrl;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import helperlanduser.dao.BookPincodeDao;
import helperlanduser.dao.BookingAddressDao;
import helperlanduser.dao.ServiceRequestAddressDao;
import helperlanduser.dao.ServiceRequestDao;
import helperlanduser.model.BookPincode;
import helperlanduser.model.Customer;
import helperlanduser.model.ServiceRequest;
import helperlanduser.model.ServiceRequestAddress;
import helperlanduser.model.ServiceRequestExtra;
import helperlanduser.model.UserAddress;

@Controller
public class BookNowController {

	@Autowired
	BookingAddressDao addressDao;

	@Autowired
	BookPincodeDao bookPincodeDao;

	@Autowired
	ServiceRequestDao serviceRequestDao;

	@Autowired
	ServiceRequestAddressDao serviceRequestAddressDao;

	@RequestMapping("/BookNow")
	public String booknow(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		
		if (session.getAttribute("userid") != null && (session.getAttribute("usertypeid")+"").equals("2")) {
			return "BookNow";
		}

		else {
			model.addAttribute("plsbook", "Please Login First!");
			model.addAttribute("plsbookdiv", "style='display: block !important';");
			return "Homepage";
		}

	}

	@RequestMapping(value = "/bookpincode")
	public @ResponseBody String ajaxSearch(HttpServletRequest req, HttpServletResponse res,
			@RequestBody String pincode) {
		BookPincode bookPincode = new BookPincode();
		bookPincode.setPostalCode(Integer.parseInt(pincode));
		Boolean pin = bookPincodeDao.validatepin(new Integer(pincode));
		return pin.toString();
	}

	@RequestMapping(value = "/addAddress/{AddressLine1},{AddressLine2},{PostalCode},{City},{Mobile}", method = RequestMethod.GET)
	public @ResponseBody void ajaxAddAddress(@PathVariable("AddressLine1") String AddressLine1,
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

	@RequestMapping(value = "/readaddress")
	public @ResponseBody List<UserAddress> readaddress(HttpServletRequest req, HttpServletResponse res,
			@ModelAttribute("useraddress") UserAddress useraddress, Model model) throws Exception {

		HttpSession session = req.getSession();
		Object id = session.getAttribute("userid");
		List<UserAddress> userAddress = addressDao.readAddress(id);
		return userAddress;
	}

	@RequestMapping(value = "/bookrequest", method = RequestMethod.POST)
	public String addrequest(@ModelAttribute("serviceRequest") ServiceRequest serviceRequest,
			HttpServletRequest request) {
		serviceRequestDao.addrequest(serviceRequest, request);
		return "CS-Dashboard";
	}

	@RequestMapping(value = "/servicerequest/{ZipCode},{AddressId},{TotalCost},{ServiceHours},{ServiceStartDate},{ExtraHours},{SubTotal},{Comments},{ServiceStartTime},{HasPets},{Extras}", method = RequestMethod.GET)
	public @ResponseBody int addrequestaddress(@PathVariable("ZipCode") String ZipCode,
			@PathVariable("AddressId") int AddressId, @PathVariable("TotalCost") float TotalCost,
			@PathVariable("ServiceHours") float ServiceHours, @PathVariable("ServiceStartDate") String ServiceStartDate,
			@PathVariable("ExtraHours") float ExtraHours, @PathVariable("SubTotal") float SubTotal,
			@PathVariable("Comments") String Comments, @PathVariable("ServiceStartTime") String ServiceStartTime,
			@PathVariable("HasPets") String HasPets, @PathVariable("Extras") String Extras, HttpServletRequest req, Model model) {

		HttpSession session = req.getSession();

		ServiceRequest serviceRequest = new ServiceRequest();
		serviceRequest.setZipCode(ZipCode);
		serviceRequest.setTotalCost(TotalCost);
		serviceRequest.setServiceHours(ServiceHours);
		serviceRequest.setComments(Comments);
		serviceRequest.setServiceStartTime(ServiceStartTime);
		serviceRequest.setServiceStartDate(ServiceStartDate);
		serviceRequest.setSubTotal(SubTotal);
		serviceRequest.setExtraHours(ExtraHours);
		serviceRequest.setHasPets(HasPets);

		int servicereq = serviceRequestDao.addrequest(serviceRequest, req);

		UserAddress getaddress = serviceRequestAddressDao.getserviceaddress(AddressId);

		ServiceRequestAddress serviceRequestAddress = new ServiceRequestAddress();

		serviceRequestAddress.setAddressLine1(getaddress.getAddressLine1());
		serviceRequestAddress.setAddressLine2(getaddress.getAddressLine2());
		serviceRequestAddress.setCity(getaddress.getCity());
		serviceRequestAddress.setEmail(session.getAttribute("custemail") + "");
		serviceRequestAddress.setMobile(getaddress.getMobile());
		serviceRequestAddress.setPostalCode(getaddress.getPostalCode());
		serviceRequestAddress.setState(getaddress.getState());
		serviceRequestAddress.setServiceRequestId(servicereq);

		int address = serviceRequestAddressDao.saveserviceaddress(serviceRequestAddress);

		String[] extras = Extras.split(" ", 0);

		List<ServiceRequestExtra> serviceRequestExtrasList = new ArrayList<ServiceRequestExtra>();

		for (int i = 0; i < extras.length; i++) {
			ServiceRequestExtra serviceRequestExtra = new ServiceRequestExtra();
			serviceRequestExtra.setServiceRequestId(servicereq);
			serviceRequestExtra.setServiceExtra(extras[i]);
			serviceRequestExtrasList.add(serviceRequestExtra);
			this.serviceRequestDao.saveExtraServices(serviceRequestExtrasList, serviceRequestExtra);
		}

		if (servicereq != 0 && address != 0) {
			List<Customer> emaillist = this.bookPincodeDao.getAllEmail();
			String subject = "New Service Request!";
			String from = "helperland.hetvee@gmail.com";
			String message = "Service Request Details: " + "\n\n" + "Service Request Id: 27" + servicereq + "\n"
					+ "Service Request Date: " + ServiceStartDate + "\n" + "Service Request Time: " + ServiceStartTime + "\n"
					+ "Total Hours: " + ExtraHours + "\n" + "Comments: " + Comments + "\n"
					+ "Address: " + getaddress.getAddressLine1() + ", " + getaddress.getAddressLine2() + ", " + getaddress.getCity()
					+ "\n" + "Postalcode: " + ZipCode + "\n" + "Mobile Number: " + getaddress.getMobile() + "\n"
					+ "\nExtra Services: " + Extras + "\n" + "Pet Status: " + HasPets + "\n" + "Total Payment: "
					+ TotalCost;
			String to = emaillist.stream().map(Customer::getEmail).collect(Collectors.joining(","));
			sendServiceRequestEmail(message, subject, to, from);
		}

		return servicereq;

	}

	public void sendServiceRequestEmail(String message, String subject, String to, String from) {

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

}
