package edu.poly.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import edu.poly.entity.Product;


public interface ProductDAO extends JpaRepository<Product, Integer>{
	@Query("Select o From Product o Where o.category.maloai = ?1")
	Page<Product> findByCategoryId(String id,Pageable pageable);
	
	@Query("Select o From Product o Where o.maSP = ?1")
	Product findOneById(Integer id);
	
}
