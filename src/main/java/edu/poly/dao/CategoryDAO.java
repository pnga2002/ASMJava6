package edu.poly.dao;


import org.springframework.data.jpa.repository.JpaRepository;

import edu.poly.entity.Category;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryDAO extends JpaRepository<Category, String>{
	@Query("SELECT c FROM Category c Where c.tenloai=:tenloai")
    Category itemCateogry(String tenloai);
}
