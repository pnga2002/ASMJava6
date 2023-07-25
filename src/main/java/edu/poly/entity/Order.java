package edu.poly.entity;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "Orders")
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	@Temporal(TemporalType.DATE)
	@Column(name = "ngayDatHang")
	Date ngayDatHang = new Date();
	@Temporal(TemporalType.DATE)
	@Column(name = "ngayGiaoHang")
	Date ngayGiaoHang = new Date();
	@ManyToOne
	@JoinColumn(name = "maND")
	Account account;
	
	@JsonIgnore
	@OneToMany(mappedBy = "order")
	List<OrderDetail> orderDetails;
}
