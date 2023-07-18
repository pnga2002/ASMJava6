package edu.poly.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("/home")
	public String index(Model model) {
		
		return "index";
	}
	@RequestMapping("/product")
	public String product(Model model) {
		
		return "shop";
	}
	@RequestMapping("/cart")
	public String cart(Model model) {
		
		return "cart";
	}
	@RequestMapping("/productdetail")
	public String productdetail(Model model) {
		
		return "shop-single";
	}
	@RequestMapping("/account")
	public String account(Model model) {
		
		return "account";
	}
}
