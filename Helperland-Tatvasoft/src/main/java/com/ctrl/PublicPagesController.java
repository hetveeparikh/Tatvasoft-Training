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
	public String home(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		model.addAttribute("user_type", session.getAttribute("usertypeid"));
		request.setAttribute("booknowbtn", session.getAttribute("usertypeid"));
		request.setAttribute("hideshow", session.getAttribute("userid"));
		return "Homepage";
	}

	@RequestMapping("/faq")
	public String faq(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		model.addAttribute("user_type", session.getAttribute("usertypeid"));
		request.setAttribute("hideshow", session.getAttribute("userid"));
		request.setAttribute("booknowbtn", session.getAttribute("usertypeid"));
		return "FAQ";
	}

	@RequestMapping("/contact")
	public String contact(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		model.addAttribute("user_type", session.getAttribute("usertypeid"));
		request.setAttribute("hideshow", session.getAttribute("userid"));
		request.setAttribute("booknowbtn", session.getAttribute("usertypeid"));
		return "Contact";
	}

	@RequestMapping("/about")
	public String about(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		model.addAttribute("user_type", session.getAttribute("usertypeid"));
		request.setAttribute("hideshow", session.getAttribute("userid"));
		request.setAttribute("booknowbtn", session.getAttribute("usertypeid"));
		return "About";
	}

	@RequestMapping("/warranty")
	public String warranty(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		model.addAttribute("user_type", session.getAttribute("usertypeid"));
		request.setAttribute("hideshow", session.getAttribute("userid"));
		request.setAttribute("booknowbtn", session.getAttribute("usertypeid"));
		return "Warranty";
	}

	@RequestMapping("/prices")
	public String prices(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		model.addAttribute("user_type", session.getAttribute("usertypeid"));
		request.setAttribute("hideshow", session.getAttribute("userid"));
		request.setAttribute("booknowbtn", session.getAttribute("usertypeid"));
		return "Prices";
	}

	@RequestMapping("/bap")
	public String bap(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		model.addAttribute("user_type", session.getAttribute("usertypeid"));
		request.setAttribute("hideshow", session.getAttribute("userid"));
		request.setAttribute("booknowbtn", session.getAttribute("usertypeid"));
		return "ServiceProvider-BAP";
	}

	@RequestMapping(value = "/savecontact", method = RequestMethod.POST)
	public String saveContact(@ModelAttribute("con") Contact con) throws Exception {
		contactdao.save(con);
		return "Contact";
	}

}