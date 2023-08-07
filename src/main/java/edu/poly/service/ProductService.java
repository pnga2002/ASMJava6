package edu.poly.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import edu.poly.dao.CategoryDAO;
import edu.poly.dao.ProductDAO;
import edu.poly.entity.Category;
import edu.poly.entity.Product;
@Service
public class ProductService {
	private final ProductDAO productRepository ;
    private final CategoryDAO categoryRepository;
    
    public ProductService(ProductDAO productRepository, CategoryDAO categoryRepository) {
        this.productRepository = productRepository;
        this.categoryRepository = categoryRepository;
    }
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }
    
    public Product createProduct(String tenSP, Double gia,String mota, String hinhanh,String maloai,Integer soluong) {
        Category category = categoryRepository.findById(maloai).orElse(null);
        if (category == null) {
            // Handle error when category is not found
        }
        
        Product product = new Product();
        product.setTenSP(tenSP);
        product.setDongia(gia);
        product.setMota(mota);
        product.setHinhanh(hinhanh);
        product.setCategory(category);
        product.setSoluong(soluong);
        return productRepository.save(product);
    }
    public Product getEmployeeById(Integer id) {
        Optional<Product>  optional = productRepository.findById(id);
        Product prod = null;
        if (optional.isPresent()) {
            prod = optional.get();
        } else {
            throw new RuntimeException(" Product not found for id :: " + id);
        }
        return prod;
    }
}
