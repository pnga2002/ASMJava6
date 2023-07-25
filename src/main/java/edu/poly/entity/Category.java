package edu.poly.entity;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;
@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "Category")
public class Category implements Serializable{
	@Id
	String maloai;
	String tenloai;
	@JsonIgnore
	@OneToMany(mappedBy = "category")
	List<Product> products;
}
