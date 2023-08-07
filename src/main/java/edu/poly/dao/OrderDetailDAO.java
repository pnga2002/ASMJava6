package edu.poly.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import edu.poly.entity.OrderDetail;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Integer>{

	
	@Query("Select count(c.account.mand) From OrderDetail ci "
			+ "Join Order c On ci.order.maorder = c.maorder  Where c.account.mand=?1  and c.trangthai= 'gioHang'")
	Integer getAmount(String username);
	@Query("Select p.tenSP,p.maSP, p.hinhanh, p.dongia, ci.soluong, ci.maoderdetail,c.maorder From OrderDetail ci "
			+ "Join Order c On ci.order.maorder = c.maorder "
			+ "Join Account u On c.account.mand = u.mand "
			+ "Join Product p on p.maSP = ci.product.maSP"
			+ " Where u.mand = ?1 and c.trangthai= 'gioHang'"
			)
	List<Object[]> getAllInforWithUserName(String username);
	
	@Query("Select p.tenSP,p.maSP, p.hinhanh, p.dongia, ci.soluong, ci.maoderdetail,c.maorder From OrderDetail ci "
			+ "Join Order c On ci.order.maorder = c.maorder "
			+ "Join Account u On c.account.mand = u.mand "
			+ "Join Product p on p.maSP = ci.product.maSP"
			+ " Where u.mand = ?1 and c.trangthai= 'dangGiao'"
			)
	List<Object[]> getAllDangGiao(String username);
	@Query("Select p.tenSP,p.maSP, p.hinhanh, p.dongia, ci.soluong, ci.maoderdetail,c.maorder From OrderDetail ci "
			+ "Join Order c On ci.order.maorder = c.maorder "
			+ "Join Account u On c.account.mand = u.mand "
			+ "Join Product p on p.maSP = ci.product.maSP"
			+ " Where u.mand = ?1 and c.trangthai= 'dagiao'"
			)
	List<Object[]> getAllDaGiao(String username);
	
	@Query("Select o from OrderDetail o where o.maoderdetail = ?1")
	OrderDetail getBymaoderdetail(Integer maoderdetail);
	
	@Query("Select Sum(p.dongia * ci.soluong) From OrderDetail ci "
			+ "Join Product p On p.maSP = ci.product.maSP "
			+ "Join Order c On ci.order.maorder = c.maorder "
			+ "Where c.account.mand = ?1")
	Double getToTal(String username);
	@Query("Select Sum(p.dongia * ci.soluong) From OrderDetail ci "
			+ "Join Product p On p.maSP = ci.product.maSP "
			+ "Join Order c On ci.order.maorder = c.maorder "
			+ "Where c.trangthai = 'dagiao'")
	Double getToTal();
	@Query("Select Sum(p.dongia * ci.soluong) From OrderDetail ci "
			+ "Join Product p On p.maSP = ci.product.maSP "
			+ "Join Order c On ci.order.maorder = c.maorder "
			+ "Where c.trangthai = 'dagiao'"
			+ "and c.ngaygiaohang between ?1 and ?2")
	Double getToTalMonth(Date d1, Date d2);
	@Query("Select p.tenSP,p.maSP, p.hinhanh, p.dongia, ci.soluong, ci.maoderdetail,c.maorder,c.trangthai From OrderDetail ci "
			+ "Join Order c On ci.order.maorder = c.maorder "
			+ "Join Account u On c.account.mand = u.mand "
			+ "Join Product p on p.maSP = ci.product.maSP"
			+ " Where c.trangthai= ?1"
			)
	List<Object[]> getOderDangGiao(String text);
}
