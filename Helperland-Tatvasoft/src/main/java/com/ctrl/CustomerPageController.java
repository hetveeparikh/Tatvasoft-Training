package com.ctrl;

import java.util.HashMap;
import java.util.List;
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
import helperlanduser.model.Customer;
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

	@RequestMapping("/customerDashboard")
	public String cdash(HttpServletRequest request, Model model,
			ServiceRequest serviceRequest) {

		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("userid"));
		System.out.println(session.getAttribute("usertypeid"));
		model.addAttribute("settingsfirstname", session.getAttribute("firstname"));
		model.addAttribute("settingslastname", session.getAttribute("lastname"));
		model.addAttribute("settingsmobile", session.getAttribute("custmobile"));
		model.addAttribute("settingsemail", session.getAttribute("custemail"));

		Object temp = session.getAttribute("usertypeid");
		String str = temp.toString();

		if (session.getAttribute("userid") != null && str.equals("2")) {
			System.out.println("dashboarddd");
			return "CS-Dashboard";
		}

		else {
			request.setAttribute("notloggedin", "alertlogin");
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
		System.out.println("in dashboard controller");
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

		String DateOfBirth = "" + Day + " " + Month + " " + Year;
		customer.setDateOfBirth(DateOfBirth);

		model.addAttribute("settingsfirstname", session.getAttribute("firstname"));
		model.addAttribute("settingslastname", session.getAttribute("lastname"));
		model.addAttribute("settingsmobile", session.getAttribute("custmobile"));
		model.addAttribute("settingsemail", session.getAttribute("custemail"));

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
		System.out.println("Address added");
		HttpSession session = req.getSession();
		String str = "" + session.getAttribute("userid");
		int temp = Integer.parseInt(str);
		System.out.println(temp + "tempppp");
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
		System.out.println("address controller");
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
	public @ResponseBody int rescheduleRequest(@PathVariable("ServiceStartDate") String ServiceStartDate, @PathVariable("ServiceStartTime") String ServiceStartTime,
			@PathVariable("serviceid") String serviceid,
			 HttpServletRequest request, ServiceRequest serviceRequest ,
			Model model) {

		HttpSession session = request.getSession();
		String str = "" + session.getAttribute("userid");
		int temp = Integer.parseInt(str);
		serviceRequest.setUserId(temp);
		System.out.println("req con");
		int reschedule = customerRequestsDao.rescheduleRequests(serviceRequest, serviceid);
		
		System.out.println(ServiceStartTime+"sst");
		
		return reschedule;
	}
	
	@RequestMapping(value = "/cancelrequest/{serviceid}", method = RequestMethod.GET)
	public @ResponseBody int cancelRequest(@PathVariable("serviceid") String serviceid,
			 HttpServletRequest request, ServiceRequest serviceRequest ,
			Model model) {

		HttpSession session = request.getSession();
		String str = "" + session.getAttribute("userid");
		int temp = Integer.parseInt(str);
		serviceRequest.setUserId(temp);
		System.out.println("cancel con");
		int cancel = customerRequestsDao.cancelrequest(serviceRequest, serviceid);
		return cancel;
	}

	@RequestMapping(value = "/detailsmodal/{serviceid}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> details(@PathVariable("serviceid") String serviceid,
			 HttpServletRequest request, ServiceRequest serviceRequest ,
			Model model) {

		HttpSession session = request.getSession();
		String str = "" + session.getAttribute("userid");
		int temp = Integer.parseInt(str);
		serviceRequest.setUserId(temp);
		System.out.println("details con");
		
		HashMap<String, Object> hashModal =  customerRequestsDao.detailsmodal(serviceid);
		
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
		System.out.println("in history controller");
		return custServiceRequests;
	}
	
	
}