package edu.poly.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	@GetMapping("/admin/index")
	public String index() {
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
