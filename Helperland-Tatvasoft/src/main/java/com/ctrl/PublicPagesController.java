package com.ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import helperlanduser.dao.ContactDao;
import helperlanduser.model.Contact;

@Controller
public class PublicPagesController {

	@Autowired
	ContactDao contactdao;

	@RequestMapping("/homepage")
	public String home(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		model.addAttribute("user_type",session.getAttribute("usertypeid"));
		request.setAttribute("hideshow", session.getAttribute("userid"));
		return "Homepage";
	}

	@RequestMapping("/faq")
	public String faq(HttpServletRequest request) {
		HttpSession session = request.getSession();
		request.setAttribute("hideshow", session.getAttribute("userid"));
		return "FAQ";
	}

	@RequestMapping("/contact")
	public String contact(HttpServletRequest request) {
		HttpSession session = request.getSession();
		request.setAttribute("hideshow", session.getAttribute("userid"));
		return "Contact";
	}

	@RequestMapping("/about")
	public String about(HttpServletRequest request) {
		HttpSession session = request.getSession();
		request.setAttribute("hideshow", session.getAttribute("userid"));
		return "About";
	}

	@RequestMapping("/warranty")
	public String warranty(HttpServletRequest request) {
		HttpSession session = request.getSession();
		request.setAttribute("hideshow", session.getAttribute("userid"));
		return "Warranty";
	}

	@RequestMapping("/prices")
	public String prices(HttpServletRequest request) {
		HttpSession session = request.getSession();
		request.setAttribute("hideshow", session.getAttribute("userid"));
		return "Prices";
	}

	@RequestMapping("/bap")
	public String bap(HttpServletRequest request) {
		HttpSession session = request.getSession();
		request.setAttribute("hideshow", session.getAttribute("userid"));
		return "ServiceProvider-BAP";
	}

	/*
	 * @RequestMapping("/Settings-ServiceProvider") public String spsettings() {
	 * return "SettingsSP"; }
	 * 
	 * @RequestMapping("/upcomingservice") public String spupcoming() { return
	 * "Service Provider - Upcoming Service"; }
	 * 
	 * @RequestMapping("/blockcustomer") public String spblock() { return
	 * "SP-Block"; }
	 * 
	 * @RequestMapping("/serviceproviderDashboard") public String spdash() { return
	 * "SP - Dashboard"; }
	 * 
	 * @RequestMapping("/servicehistory") public String sphist() { return
	 * "SP-History"; }
	 * 
	 * 
	 * @RequestMapping("/AdminUserManagement") public String AUM() { return
	 * "Admin - User Management"; }
	 * 
	 * @RequestMapping("/AdminServiceRequests") public String ASR() { return
	 * "Admin - Service Requests"; }
	 * 
	 */
	
	@RequestMapping(value = "/savecontact", method = RequestMethod.POST)
	public String saveContact(@ModelAttribute("con") Contact con) throws Exception{
		
		contactdao.save(con);
		return "Contact";
	}

}
