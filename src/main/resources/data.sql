create database asmjava6
use asmjava6
create table Account (
	maND int primary key,
	sdt varchar(20),
	matKhau varchar(20),
	gioiTinh bit,
	ngaySinh datetime,
	diaChi nvarchar(50),
	email nvarchar(50),
	isAdmin bit
)


create table Category(
	maLoai varchar(20) primary key,
	tenLoai nvarchar(50)
)
insert into Category (maLoai, tenLoai) values('L01','Lenovo');
insert into Category (maLoai, tenLoai) values('L02','ASUS');
insert into Category (maLoai, tenLoai) values('L03','Macbook');
insert into Category (maLoai, tenLoai) values('L04','Dell');
insert into Category (maLoai, tenLoai) values('L05','Acer');
insert into Category (maLoai, tenLoai) values('L06','HG');

create table Product(
	maSP int IDENTITY(1,1) primary key,
	tenSP nvarchar(50),
	donGia float,
	moTa nvarchar(225),
	hinhAnh varchar(50),
	maLoai varchar(20),
	soLuong int,
	CONSTRAINT fk_product_category
  FOREIGN KEY (maLoai)
  REFERENCES Category(maLoai)
)
insert into Product (tenSP,donGia,moTa,hinhAnh,maLoai,soLuong) values ('Laptop Lenovo IdeaPad 3', '11890000', 'Laptop Lenovo IdeaPad 3 15IAU7 - 82RK001NVN (i3-1215U/RAM 8GB/512GB SSD/ Windows 11)', 'lap1.jpg', 'L01', 20)
insert into Product (tenSP,donGia,moTa,hinhAnh,maLoai,soLuong) values ('Laptop Lenovo Ideapad Gaming 3', '20890999', 'Laptop Lenovo Ideapad Gaming 3 - 15ARH7 -82SB007HVN (Ryzen 7 6800H/RAM 8GB/512GB SSD/ Windows 11)', 'lap2.webp', 'L01', 20)
insert into Product (tenSP,donGia,moTa,hinhAnh,maLoai,soLuong) values ('Laptop Lenovo Ideapad 5', 13990000, 'Laptop Lenovo Ideapad 5 14ITL05-82FE016PVN (i5-1135G7/RAM 8GB/256GB SSD/ Windows 11)', 'lap3.webp', 'L01', 20)
insert into Product (tenSP,donGia,moTa,hinhAnh,maLoai,soLuong) values ('Laptop Lenovo ThinkPad E14', 17890999, 'Laptop Lenovo ThinkPad E14 15IAU7 - 82RK001NVN (i3-1215U/RAM 8GB/512GB SSD/ Windows 11)', 'lap4.webp', 'L01', 20)
insert into Product (tenSP,donGia,moTa,hinhAnh,maLoai,soLuong) values ('Laptop Lenovo V15 G3 IAP', 19899999, 'Laptop Lenovo V15 G3 IAP - 82TT00ARVN (i3-1215U/RAM 8GB/256GB SSD/ Windows 11)', 'lap5.webp', 'L01', 20)

create table Orders(
	maOrder int IDENTITY(1,1) primary key,
	maND int,
	ngayDatHang datetime,
	trangThai bit,
	ngayGiao datetime,
	CONSTRAINT fk_orders_account
  FOREIGN KEY (maND)
  REFERENCES Account(maND)
)

create table OrderDetail(
	maOderDetail int IDENTITY(1,1) primary key,
	maOrder int,
	maSP int,
	soLuong int,
	donGia float,
	CONSTRAINT fk_orderdetail_orrders FOREIGN KEY (maOrder) REFERENCES Orders(maOrder),
	CONSTRAINT fk_orderdetail_product FOREIGN KEY (maSP) REFERENCES Product(maSP)
)
Select * From Product  Where maloai = 'L01'