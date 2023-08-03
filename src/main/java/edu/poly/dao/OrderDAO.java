package edu.poly.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import edu.poly.entity.Order;

public interface OrderDAO extends JpaRepository<Order, Integer>{
	@Query("Select o From Order o Where o.account.mand = ?1")
	Order findByMaND(String username);
}
