package edu.poly.controller;

import edu.poly.dao.CategoryDAO;
import edu.poly.dao.ProductDAO;
import edu.poly.dto.ProductDTO;
import edu.poly.entity.Category;
import edu.poly.entity.Product;
import edu.poly.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Optional;
import java.util.Random;

@Controller
public class AdminController {
	@Autowired
	SessionService sessionService;
	@Autowired
	ProductDAO productDAO;
	@Autowired
	ResourceLoader resourceLoader;
	@Autowired
	CategoryDAO categoryDAO;

	@GetMapping("/admin/index")
	public String index() {
		return "admin/index";
	}
	@GetMapping("/admin/product")
	public String product(Model model, @RequestParam("page") Optional<Integer> page) {
		Pageable pageable= PageRequest.of(page.orElse(0), 7);
		Page<ProductDTO> products= productDAO.fillAllProducts(pageable);
		model.addAttribute("products", products);
		return "admin/tables";
	}

	@GetMapping("/admin/product/insert")
	public String getFormCreate(Model model){
		model.addAttribute("product",new Product());
		model.addAttribute("categories",categoryDAO.findAll());
		return "admin/insertproduct";
	}
	@GetMapping("/admin/product/detailts")
	public String getProductDetailt(@RequestParam("id")Integer idproduct,Model model){
		Optional<Product> productOptional=productDAO.findById(idproduct);
		if(productOptional.isPresent()) {
			Product products=productOptional.get();
			model.addAttribute("product",products);
			model.addAttribute("category", categoryDAO.findAll());
			sessionService.setAttribute("id", idproduct);

		}
		return "admin/processdata";
	}

//

	@PostMapping("/admin/post/addproduct")
	public String update(@ModelAttribute Product product, @RequestParam("image") MultipartFile imageFile) throws Exception {
		if (product.getMaSP() != null) { // Kiểm tra sản phẩm đã tồn tại (ID đã được set) hay chưa
			// Nếu sản phẩm đã tồn tại, cập nhật thông tin của sản phẩm
			Product existingProduct = productDAO.findById(product.getMaSP()).orElse(null);
			if (existingProduct != null) {
				existingProduct.setTenSP(product.getTenSP());
				existingProduct.setMota(product.getMota());
				existingProduct.setDongia(product.getDongia());
				existingProduct.setSoluong(product.getSoluong());

				if (!imageFile.isEmpty()) {
					String fileName = imageFile.getOriginalFilename();
					String imagesDir = resourceLoader.getResource("classpath:/static/images/").getFile().getAbsolutePath();
					File file = new File(imagesDir + File.separator + fileName);
					imageFile.transferTo(file);
					existingProduct.setHinhanh(fileName);
				}
				if (product.getCategory() != null) {
					// Lấy thông tin category được chọn
					Category selectedCategory = product.getCategory();
					// Cập nhật thông tin category trong đối tượng Product
					existingProduct.setCategory(selectedCategory);
				}
				// Lưu sản phẩm đã cập nhật vào CSDL
				productDAO.save(existingProduct);
			}
		} else {
			// Nếu sản phẩm chưa tồn tại (ID chưa được set), thêm mới sản phẩm vào CSDL
			if (!imageFile.isEmpty()) {
				//String imagesDir = resourceLoader.getResource("classpath:/static/images/").getFile().getAbsolutePath();
				String fileName = imageFile.getName();
				File image = new File("images/"+ fileName);
				imageFile.transferTo(image);
				product.setHinhanh(imageFile.getName());
			} else {
				product.setHinhanh("lap1.jpg");
			}
			if (product.getCategory() != null) {
				// Lấy thông tin category được chọn
				Category selectedCategory = product.getCategory();
				// Cập nhật thông tin category trong đối tượng Product
				product.setCategory(selectedCategory);
			}

			// Lưu sản phẩm mới vào CSDL
			productDAO.save(product);
		}

		return "redirect:/admin/product";
	}
	@PostMapping("/admin/create/addproduct")
	public String addProduct(@ModelAttribute Product product,@RequestParam("category.tenloai")String tenloai, @RequestParam("image") MultipartFile imageFile) throws Exception {
		Product pd = new Product();
		pd.setTenSP(product.getTenSP());
		pd.setMota(product.getMota());
		pd.setSoluong(product.getSoluong());
		pd.setDongia(product.getDongia());
		pd.setCategory(product.getCategory());
		if (!imageFile.isEmpty() || imageFile==null) {
			String fileName = imageFile.getOriginalFilename();
			String imagesDir = resourceLoader.getResource("classpath:/static/images/").getFile().getAbsolutePath();
			File file = new File(imagesDir + File.separator + fileName);
			imageFile.transferTo(file);
			product.setHinhanh(fileName);
		}else {product.setHinhanh("lap1.jpg");}
		Category categoryitm = categoryDAO.itemCateogry(tenloai);
		pd.setCategory(categoryitm);
		productDAO.save(pd);
		return "redirect:/admin/index";
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
