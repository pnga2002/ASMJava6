package edu.poly.entity;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
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
	String mand;
	String sdt;
	String matkhau;
	Boolean gioitinh;
	@Temporal(TemporalType.DATE)
	@Column(name = "ngaysinh")
	Date ngaysinh = new Date();
	String diachi;
	String email;
	Boolean isadmin;
	@JsonIgnore
	@OneToMany(mappedBy = "account",fetch = FetchType.EAGER)
	List<Order> orders;
}
