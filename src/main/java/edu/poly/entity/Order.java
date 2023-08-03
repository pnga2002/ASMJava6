package edu.poly.entity;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
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
	Integer maorder;
	@Temporal(TemporalType.DATE)
	@Column(name = "ngaydathang")
	Date ngaydathang = new Date();
	@Temporal(TemporalType.DATE)
	@Column(name = "ngaygiao")
	Date ngaygiaohang = new Date();
	@ManyToOne
	@JoinColumn(name = "mand")
	Account account;
	String trangthai;
	@JsonIgnore
	@OneToMany(mappedBy = "order",fetch = FetchType.EAGER)
	List<OrderDetail> orderdetails;
}
