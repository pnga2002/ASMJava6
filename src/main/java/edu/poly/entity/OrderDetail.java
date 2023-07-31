package edu.poly.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "Orderdetail")
public class OrderDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer maoderdetail;
	Integer soluong;
	Double dongia;
	@ManyToOne
	@JoinColumn(name = "masp")
	Product product;
	@ManyToOne
	@JoinColumn(name = "maorder")
	Order order;
}
