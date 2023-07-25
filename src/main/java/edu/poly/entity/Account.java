package edu.poly.entity;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "Account")
public class Account {
	@Id
	Integer maND;
	String sdt;
	String matKhau;
	Boolean gioiTinh;
	@Temporal(TemporalType.DATE)
	@Column(name = "ngaySinh")
	Date ngaySinh = new Date();
	String diaChi;
	String email;
	Boolean isAdmin;
	@JsonIgnore
	@OneToMany(mappedBy = "account")
	List<Order> orders;
}
