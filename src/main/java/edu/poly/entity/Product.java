package edu.poly.entity;

import java.io.Serializable;
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
@Table(name = "Product")
public class Product implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer maSP;
	String tenSP;
	Double dongia;
	String mota;
	String hinhanh;
	@ManyToOne
	@JoinColumn(name = "maloai")
	Category category;
	Integer soluong;
	@JsonIgnore
	@OneToMany(mappedBy = "product")
	List<OrderDetail> orderDetail;
}
