package com.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import helperlanduser.dao.CustomerDao;
import helperlanduser.model.Customer;

@Controller
public class PublicPagesController {
	
	private CustomerDao customerDao;

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
	
	@RequestMapping(value = "/addCustomer", method = RequestMethod.POST)
	public RedirectView addcust(@ModelAttribute Customer customer) {
		System.out.println(customer);
		this.customerDao.createCustomer(customer);
		RedirectView redirectView = new RedirectView();
//		redirectView.setUrl(null)
		return redirectView;
	}
	
//	@RequestMapping("/addCustomer")
//	public String addcust(@ModelAttribute Customer customer) {
//		System.out.println(customer);
//		this.customerDao.createCustomer(customer);
//		return "CS-Dashboard";
//	}
}
