package edu.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import edu.poly.entity.OrderDetail;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Integer>{

	
	@Query("Select count(c.account.maND) From OrderDetail ci "
			+ "Join Order c On ci.order.maorder = c.maorder  Where c.account.maND=?1  and c.trangthai= 'gioHang'")
	Integer getAmount(String username);
	@Query("Select p.tenSP, p.hinhanh, p.dongia, ci.soluong, ci.maoderdetail From OrderDetail ci "
			+ "Join Order c On ci.order.maorder = c.maorder "
			+ "Join Account u On c.account.maND = u.maND "
			+ "Join Product p on p.maSP = ci.product.maSP"
			+ " Where u.maND = ?1 and c.trangthai= 'gioHang'"
			)
	List<Object[]> getAllInforWithUserName(String username);
	
	@Query("Select p.tenSP, p.hinhanh, p.dongia, ci.soluong, ci.maoderdetail From OrderDetail ci "
			+ "Join Order c On ci.order.maorder = c.maorder "
			+ "Join Account u On c.account.maND = u.maND "
			+ "Join Product p on p.maSP = ci.product.maSP"
			+ " Where u.maND = ?1 and c.trangthai= 'dangGiao'"
			)
	List<Object[]> getAllDangGiao(String username);
	@Query("Select p.tenSP, p.hinhanh, p.dongia, ci.soluong, ci.maoderdetail From OrderDetail ci "
			+ "Join Order c On ci.order.maorder = c.maorder "
			+ "Join Account u On c.account.maND = u.maND "
			+ "Join Product p on p.maSP = ci.product.maSP"
			+ " Where u.maND = ?1 and c.trangthai= 'dagiao'"
			)
	List<Object[]> getAllDaGiao(String username);
}
