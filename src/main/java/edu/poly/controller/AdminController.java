package edu.poly.controller;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
import edu.poly.entity.Product;
import edu.poly.service.ProductService;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AdminController {
	@Autowired
	HttpServletRequest request;
	@Autowired
	OrderDetailDAO orderDetailDao;
	@Autowired
	ProductDAO productdao;
	@Autowired
	AccountDAO accDao;

	@Autowired
	OrderDAO orderDao;
	@Autowired
	CategoryDAO categorydao;
	
private final ProductService productService;
	
	public AdminController(ProductService productService) {
        this.productService = productService;
    }
	
	
	@GetMapping("/admin/index")
	public String index(Model model, HttpServletRequest request) {
		if(!request.isUserInRole("ADMIN")) {
			return "redirect:/account/access/denied";
		}
		Calendar cal = Calendar.getInstance();
		cal.roll(Calendar.MONTH, -1);
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		System.out.println(request.getRemoteUser());
		long millis=System.currentTimeMillis();
		Double tong = orderDetailDao.getToTal();
		Date date = new Date();
//		Double tongMonth = orderDetailDao.getToTalMonth(date.getTime(),date.getTime());
		model.addAttribute("total",tong);
//		model.addAttribute("totalMonth",tongMonth);
		model.addAttribute("message", "Hello Authenticated User");
		model.addAttribute("request", request);
		return "admin/index";
	}
	@GetMapping("/admin/product")
	public String product(Model model, @RequestParam("p") Optional<Integer> p) {
		Pageable pageable=PageRequest.of(p.orElse(0), 50);
		Page<Product> products= productdao.findAll(pageable);
		model.addAttribute("products",products);
		Product prod = new Product();
		model.addAttribute("product",prod);
		List<Category> cate = categorydao.findAll();
		model.addAttribute("category",cate);
		
		return "admin/product";
	}
	@GetMapping("/admin/products/del/{id}")
	public String delProduct(Model model,@PathVariable("id") Integer id) {
		productdao.deleteById(id);

		return "redirect:/admin/product";
	}
	
	@PostMapping("/admin/products/add")
	public String save(Model model,@ModelAttribute("product") Product produodate,
			@RequestParam("maSP") Integer maSP,
			@RequestParam("tenSP") String tenSP,
			@RequestParam("dongia") Double dongia,
			@RequestParam("mota") String mota,
			@RequestParam("hinhanh") String hinhanh,
			@RequestParam("category") Category category,
			@RequestParam("soluong") Integer soluong) {
		if(maSP==0) {
			Product product = new Product();
		model.addAttribute("product", product);
		productService.createProduct(tenSP, dongia,mota,hinhanh,category.getMaloai(), soluong);
		List<Product> prod = productdao.findAll();
		model.addAttribute("products",prod);
		System.out.println(category.getMaloai());
		} else {
			productdao.save(produodate);
		}
		
		return "redirect:/admin/product";
	}
	@RequestMapping("/admin/chuaHoanThanh")
	public String chuaHoanThanh(Model model) {
		
		List<Object[]> listCart= orderDetailDao.getOderDangGiao("dangGiao");
		model.addAttribute("carts",listCart);
		return "admin/order";
	}
	@RequestMapping("/admin/DaHoanThanh")
	public String DaHoanThanh(Model model) {
		List<Object[]> listCart= orderDetailDao.getOderDangGiao("dagiao");
		model.addAttribute("carts",listCart);
		return "admin/order";
	}
	@PostMapping("/admin/editOder")
	public String editOrder(@RequestParam("maod") Integer maod, Model model) {
		System.out.println(maod);
		Order od = orderDao.findByMaOrder(maod);
		od.setTrangthai("dagiao");
		orderDao.save(od);
		return "admin/order";
	}
	@GetMapping("/admin/category")
	public String category(Model model, @RequestParam("p") Optional<Integer> p) {
		Pageable pageable=PageRequest.of(p.orElse(0), 50);
		Page<Category> products= categorydao.findAll(pageable);
		model.addAttribute("categories",products);
		Category cate= new Category();
		model.addAttribute("category",cate);
		return "admin/category";
	}
	@PostMapping("/admin/category/add")
	public String addCategory(Model model,
			@RequestParam("maloai") String maloai,
			@RequestParam("tenloai") String tenloai) {
		Category cate = new Category();
		cate.setMaloai(maloai);
		cate.setTenloai(tenloai);
		categorydao.save(cate);
		return "redirect:/admin/category";
	}
	@PostMapping("/admin/category/editCate")
	public String editCategory(Model model,
			@RequestParam("maloai") String maloai) {
		System.out.println(maloai);
		Category cate= categorydao.findByMaloai(maloai);
		model.addAttribute("category",cate);
		return "admin/category";
	}
	@GetMapping("/admin/category/del/{id}")
	public String delCategory(Model model,@PathVariable("id") String id) {
		categorydao.deleteById(id);
		List<Category> products= categorydao.findAll();
		model.addAttribute("categories",products);

		return "redirect:/admin/category";
	}
	@GetMapping("/admin/user")
	public String user(Model model, @RequestParam("p") Optional<Integer> p) {
		Pageable pageable=PageRequest.of(p.orElse(0), 50);
		Page<Account> products= accDao.findAll(pageable);
		model.addAttribute("accounts",products);
		return "admin/user";
	}
	@PostMapping("/admin/user/add")
	public String addUser(@ModelAttribute("user") Account user,Model model) {
		System.out.println(user.getEmail());
		accDao.save(user);
		return "redirect:/admin/user";
	}
	@GetMapping("/admin/user/del/{id}")
	public String delUser(Model model,@PathVariable("id") String id) {
		accDao.deleteById(id);
		List<Account> products= accDao.findAll();
		model.addAttribute("accounts",products);

		return "redirect:/admin/user";
	}
}
