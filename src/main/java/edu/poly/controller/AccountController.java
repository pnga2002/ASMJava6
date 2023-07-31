package edu.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.poly.dao.AccountDAO;
import edu.poly.dao.OrderDAO;
import edu.poly.dao.OrderDetailDAO;
import edu.poly.entity.Account;
import edu.poly.service.SessionService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/account/")
public class AccountController {
	@Autowired
	AccountDAO accountDao;
	@Autowired
	OrderDetailDAO orderDetailDao;
//	@Autowired
//	SessionService session;
	
	
	@GetMapping("/login/form")
	public String formLogin() {
		return "account/login";
	}
	@GetMapping("/login/success")
	public String success(Model model, HttpServletRequest request,HttpSession session) {
		session.setAttribute("currentuser", request.getRemoteUser());
		
		return "account/login";
	}
	@GetMapping("/login/error")
	public String error(Model model) {
		model.addAttribute("error", "Username or Password incorrect!");
		return "account/login";
	}
	@RequestMapping("/access/denied")
	public String denied(Model model) {
		model.addAttribute("error", "You do not have permission!");
		return "account/login";
	}
//	@GetMapping("login/form")
//	public String index() {
//		return "account/login";
//	}
//	@PostMapping("login/form")
//	public String login(Model model,
//			@RequestParam("maND") String maND,
//			@RequestParam("matKhau") String matKhau) {
//		if(maND.isEmpty()|| matKhau.isEmpty()) {
//			return "/account/login";
//		}
//		else {
//			Account user= accountDao.findByMaND(maND);
//			if(user == null || !user.getMatKhau().equals(matKhau)) {
//				model.addAttribute("message", "Login invalid!");
//			}else {
//				session.setAttribute("user", user);
////				int amount=orderDetailDao.getAmount(user.getMaND());
////				session.setAttribute("amount",amount);
//				return "redirect:/home";
//			}
//		}
//		return "account/login";
//	}
//	@RequestMapping("logout")
//	public String logout() {
//		
//		session.removeAttribute("user");
//		session.removeAttribute("amount");
//		return "account/login";
//	}
	
}
