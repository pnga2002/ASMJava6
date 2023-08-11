package edu.poly.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.poly.dao.AccountDAO;
import edu.poly.dao.CategoryDAO;
import edu.poly.dao.OrderDAO;
import edu.poly.dao.OrderDetailDAO;
import edu.poly.dao.ProductDAO;
import edu.poly.entity.Account;
import edu.poly.entity.Category;
import edu.poly.entity.Order;
import edu.poly.entity.OrderDetail;
import edu.poly.entity.Product;
import edu.poly.service.SessionService;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class HomeController {
	@Autowired
	SessionService session;
	@Autowired
	ProductDAO productdao;
	@Autowired
	OrderDetailDAO orderDetailDao;
	@Autowired
	HttpServletRequest request;
	@Autowired
	CategoryDAO categorydao;
	@Autowired
	OrderDAO orderDao;
	@Autowired
	AccountDAO accDao;
	
	@ModelAttribute("current")
	public String request(Model model, HttpServletRequest request) {
		int amount=orderDetailDao.getAmount(request.getRemoteUser());
		System.out.println(amount);
		model.addAttribute("amount",amount);
		return request.getRemoteUser();
	}
	@RequestMapping("/home")
	public String index(Model model, @RequestParam("page") Optional<Integer> page) {
//		Pageable pageable=PageRequest.of(page.orElse(0), 12);
		List<Product> products= productdao.findAll();
		model.addAttribute("products",products);
		List<Category> category = categorydao.findAll();
		model.addAttribute("category",category);
		
		return "index";
	}
	@RequestMapping("/product")
	public String product(Model model, @RequestParam("page") Optional<Integer> page) {
		Pageable pageable=PageRequest.of(page.orElse(0), 12);
		Page<Product> products= productdao.findAll(pageable);
		model.addAttribute("products",products);
		return "shop";
	}
	@GetMapping("/category/{id}")
	public String categoryId(Model model, 
			@PathVariable("id") String id,
			@RequestParam("page") Optional<Integer> page) {
		Pageable pageable=PageRequest.of(page.orElse(0), 6);
		Page<Product> products= productdao.findByCategoryId(id, pageable);
		model.addAttribute("products",products);
		return "shop";
	}
	@RequestMapping("/cart")
	public String cart(Model model) {
		String maND = request.getRemoteUser();
		if(maND==null) {
			return "redirect:/account/access/denied";
		}
		List<Object[]> listCart= orderDetailDao.getAllInforWithUserName(maND);
		model.addAttribute("carts",listCart);
		System.out.println(request.getRemoteUser());
		
		double total=orderDetailDao.getToTal(maND); 
		model.addAttribute("total", total);
		return "cart";
	}
	@RequestMapping("/cart/dangGiao")
	public String cartDangGiao(Model model) {
		String maND = request.getRemoteUser();
		if(maND==null) {
			return "redirect:/account/access/denied";
		}
		List<Object[]> listCart= orderDetailDao.getAllDangGiao(maND);
		model.addAttribute("carts",listCart);
		System.out.println(request.getRemoteUser());
		return "cart";
	}
	@RequestMapping("/cart/daGiao")
	public String cartDaGiao(Model model) {
		String maND = request.getRemoteUser();
		if(maND==null) {
			return "redirect:/account/access/denied";
		}
		List<Object[]> listCart= orderDetailDao.getAllDaGiao(maND);
		model.addAttribute("carts",listCart);
		System.out.println(listCart);
		return "cart";
	}
	@SuppressWarnings("null")
	@PostMapping("/addcart")
	public String addcast(Model model,
			@RequestParam("masp") Integer masp,
			@RequestParam("soluong") Integer soluong) {
		long millis=System.currentTimeMillis();
		Date date= new Date(millis); 
		String maND = request.getRemoteUser();
		Account acc = accDao.findByMaND(maND);
		Order cart = new Order();
//		Order cart = orderDao.findByMaND(maND);
		
//		if(cart==null) {
			System.out.println(cart.getTrangthai());
			cart.setAccount(acc);
			cart.setAccount(acc);
			cart.setNgaydathang(date);
			cart.setTrangthai("gioHang");
			orderDao.save(cart);
//		}
		OrderDetail cartItem = new OrderDetail();
		
			cartItem.setOrder(cart);
			cartItem.setSoluong(soluong);
			cartItem.setProduct(productdao.findOneById(masp));
			int amount=orderDetailDao.getAmount(request.getRemoteUser());
			session.setAttribute("amount", amount);
			orderDetailDao.save(cartItem);
			List<Object[]> listCart= orderDetailDao.getAllInforWithUserName(maND);
//			double total=orderDetailDao.getToTal(maND); 
			model.addAttribute("carts", listCart);
//			model.addAttribute("total", total);
		
		return "redirect:/cart";
	}
	@PostMapping("/updateCart")
	public String updateCart(Model model,
			@RequestParam("maorderdetail") Integer maorderdetail,
			@RequestParam("masp") Integer masp,
			@RequestParam("soluong") Integer soluong) {
		OrderDetail detail = orderDetailDao.getBymaoderdetail(maorderdetail);
		detail.setSoluong(soluong);
		orderDetailDao.save(detail);
		return "cart";
	}
	@PostMapping("/orderCart")
	public String orderCart(Model model,
			@RequestParam("maOrder") Integer maOrder,
			@RequestParam("diachi") String diachi,
			@RequestParam("ten") String tennhan
			) {
			Order order = orderDao.findByMaOrder(maOrder);
			System.out.println(order.getTrangthai());
			order.setTrangthai("dangGiao");
			order.setDiachi(diachi);
			order.setTennguoinhan(tennhan);
			orderDao.save(order);
		
		return "cart";
	}
	@RequestMapping("removeCartItem/{cartId}")
	public String removeCartItem(Model mode, @PathVariable("cartId") Integer id) {
		orderDetailDao.deleteById(id);
		int amount=orderDetailDao.getAmount(request.getRemoteUser());
		session.setAttribute("amount",amount);
		return "redirect:/cart";
	}
	@RequestMapping("/productdetail/{id}")
	public String productdetail(Model model, @PathVariable("id") Integer id) {
		Optional<Product> productOptional=productdao.findById(id);
		if(productOptional.isPresent()) {
			Product products=productOptional.get();
			model.addAttribute("product",products);
			session.setAttribute("id", id);
			System.out.println("id"+ session.getAttribute("id"));
		}
		return "shop-single";
	}
	@RequestMapping("/account")
	public String account(Model model) {
		
		return "account";
	}
}
