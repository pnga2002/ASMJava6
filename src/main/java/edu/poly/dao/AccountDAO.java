package edu.poly.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import edu.poly.entity.Account;

public interface AccountDAO extends JpaRepository<Account, String>{
	@Query("Select o from Account o Where o.mand = ?1")
	Account findByMaND(String maND);
}
