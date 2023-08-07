package edu.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.poly.dao.AccountDAO;
import edu.poly.entity.Account;

@Controller
public class AdminController {
	@Autowired
	AccountDAO dao;
	
	@GetMapping("/admin/user")
	public String user(Model model) {
		List<Account> account = dao.findAll();
		Account ac=new Account();
		model.addAttribute("items", account);
		model.addAttribute("form", ac);
//		System.err.println(account);
		return "admin/tables";
	}

	@RequestMapping("/admin/reset")
	public String reset(Model model) {
		Account acc = new Account();
		model.addAttribute("form", acc);
		List<Account> account = dao.findAll();
		model.addAttribute("items", account);
		return "admin/tables";
	}
	
	@PostMapping("/admin/create")
	public String create(Model model, @ModelAttribute Account form) {
		dao.save(form);
		return "redirect:/admin/user";
	}
	@PostMapping("/admin/update")
	public String update(Model model, @ModelAttribute Account form) {
		dao.save(form);
		return "redirect:/admin/user";
	}

	@RequestMapping("/admin/edit/{mand}")
	public String edit(Model model, @PathVariable("mand") String mand) {
		Account acc = dao.findById(mand).get();
		model.addAttribute("form", acc);
		List<Account> account = dao.findAll();
		model.addAttribute("items", account);
		return "admin/tables";
	}

	@RequestMapping("admin/delete/{id}")
	public String delete(@PathVariable String id) {
		dao.deleteById(id);
		return "redirect:/admin/user";
	}

	///////////////////////////
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

}
