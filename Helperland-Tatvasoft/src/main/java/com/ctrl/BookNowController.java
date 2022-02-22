package com.ctrl;

import java.util.List;

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
import helperlanduser.model.ServiceRequest;
import helperlanduser.model.ServiceRequestAddress;
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

	@RequestMapping(value = "/bookpincode")
	public @ResponseBody String ajaxSearch(HttpServletRequest req, HttpServletResponse res,
			@RequestBody String pincode) {
		System.out.println("Pincode ajax");
		Boolean pin = bookPincodeDao.validatepin(new Integer(pincode), req);
		return pin.toString();
	}

	@RequestMapping(value = "/addAddress/{AddressLine1},{AddressLine2},{PostalCode},{City},{Mobile}", method = RequestMethod.GET)
	public @ResponseBody void ajaxAddAddress(@PathVariable("AddressLine1") String AddressLine1,
											 @PathVariable("AddressLine2") String AddressLine2, 
											 @PathVariable("PostalCode") String postalcode,
											 @PathVariable("City") String City, 
											 @PathVariable("Mobile") String Mobile,
			@ModelAttribute UserAddress userAddress, Model model, HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		System.out.println("Address added");
		HttpSession session = req.getSession();
		String str = "" + session.getAttribute("userid");
		int temp = Integer.parseInt(str);
		userAddress.setUserId(temp);
		int add = this.addressDao.addAddress(userAddress);
	}

	@RequestMapping(value = "/readaddress")
	public @ResponseBody List<UserAddress> readaddress(HttpServletRequest req, HttpServletResponse res,
			@ModelAttribute("useraddress") UserAddress useraddress, Model model) throws Exception {

		HttpSession session = req.getSession();
		Object id = session.getAttribute("userid");
		List<UserAddress> userAddress = addressDao.readAddress(id);
		System.out.println("address controller");
		return userAddress;
	}

	@RequestMapping(value = "/bookrequest", method = RequestMethod.POST)
	public String addrequest(@ModelAttribute("serviceRequest") ServiceRequest serviceRequest,
			HttpServletRequest request) {
		serviceRequestDao.addrequest(serviceRequest, request);
		System.out.println("in req controllerr");
		return "CS-Dashboard";
	}

	@RequestMapping(value = "/servicerequestaddress/{AddressId},{TotalCost},{ServiceHours},{ServiceStartDate},{ExtraHours},{SubTotal},{Comments},{ServiceStartTime},{HasPets}", method = RequestMethod.GET)
	public @ResponseBody String addrequestaddress(@PathVariable("AddressId") int AddressId,
												  @PathVariable("TotalCost") float TotalCost, 
												  @PathVariable("ServiceHours") float ServiceHours,
												  @PathVariable("ServiceStartDate") String ServiceStartDate,
												  @PathVariable("ExtraHours") float ExtraHours,
												  @PathVariable("SubTotal") float SubTotal,
												  @PathVariable("Comments") String Comments,
												  @PathVariable("ServiceStartTime") String ServiceStartTime,
												  @PathVariable("HasPets") String HasPets,
			HttpServletRequest req) {

		
		UserAddress getaddress = serviceRequestAddressDao.getserviceaddress(AddressId);

		ServiceRequestAddress serviceRequestAddress = new ServiceRequestAddress();

		serviceRequestAddress.setAddressLine1(getaddress.getAddressLine1());
		serviceRequestAddress.setAddressLine2(getaddress.getAddressLine2());
		serviceRequestAddress.setCity(getaddress.getCity());
		serviceRequestAddress.setEmail(getaddress.getEmail());
		serviceRequestAddress.setMobile(getaddress.getMobile());
		serviceRequestAddress.setPostalCode(getaddress.getPostalCode());
		serviceRequestAddress.setState(getaddress.getState());

		System.out.println("addresss controller" + getaddress);

		serviceRequestAddressDao.saveserviceaddress(serviceRequestAddress);

		ServiceRequest serviceRequest = new ServiceRequest();
		serviceRequest.setTotalCost(TotalCost);
		serviceRequest.setServiceHours(ServiceHours);
		serviceRequest.setComments(Comments);
		serviceRequest.setServiceStartTime(ServiceStartTime);
		serviceRequest.setServiceStartDate(ServiceStartDate);
		serviceRequest.setSubTotal(SubTotal);
		serviceRequest.setExtraHours(ExtraHours);
		serviceRequest.setHasPets(HasPets);
		
		serviceRequestDao.addrequest(serviceRequest, req);

		return null;

	}

}
