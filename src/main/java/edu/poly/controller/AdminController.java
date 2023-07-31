package edu.poly.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AdminController {
	@GetMapping("/admin/index")
	public String index(Model model, HttpServletRequest request) {
		if(request.getRemoteUser()!="admin") {
			return "redirect:/account/access/denied";
		}
		System.out.println(request.getRemoteUser());
		model.addAttribute("message", "Hello Authenticated User");
		model.addAttribute("request", request);
		return "admin/index";
	}
	@GetMapping("/admin/product")
	public String product() {
		return "admin/tables";
	}
	@GetMapping("/admin/cart")
	public String cart() {
		return "admin/tables";
	}
	@GetMapping("/admin/category")
	public String category() {
		return "admin/tables";
	}

	@GetMapping("/admin/user")
	public String user() {
		return "admin/tables";
	}
}
