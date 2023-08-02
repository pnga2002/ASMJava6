package edu.poly.dao;

import edu.poly.dto.ProductDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.*;

import edu.poly.entity.Product;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductDAO extends JpaRepository<Product, Integer>{
	@Query("Select o From Product o Where o.category.maloai = ?1")
	Page<Product> findByCategoryId(String id,Pageable pageable);
	@Query("SELECT new edu.poly.dto.ProductDTO(p.maSP, p.tenSP,p.dongia, p.mota, p.hinhanh, p.soluong, p.category.tenloai) FROM Product p")
	Page<ProductDTO> fillAllProducts(Pageable pageable);
}
