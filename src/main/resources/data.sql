create database asmjava6
use asmjava6
create table Account (
	mand nvarchar(20) primary key,
	tennd nvarchar(225),
	sdt varchar(20),
	matkhau varchar(20),
	gioitinh bit,
	diachi nvarchar(50),
	email nvarchar(50),
	isadmin bit
)

insert into Account (maND, tenND, sdt, matKhau, gioitinh, ngaysinh, diachi, email, isadmin) values('ND01','Ho Thi Phuong Nga','0944057053','123',0, 01/01/2002, 'quận 12, tphcm','nga@gmail.com',0)
insert into Account (maND, tenND, sdt, matKhau, gioiTinh, ngaySinh, diaChi, email, isAdmin) values('ND02','Nguyen Truong An','0944989898','123',0, 02/01/2000, 'quận 11, tphcm','an@gmail.com',0)
insert into Account (maND, tenND, sdt, matKhau, gioiTinh, ngaySinh, diaChi, email, isAdmin) values('ND03','Trinh Duc Bao','0977787878','123',0, 03/01/2003, 'quận 10, tphcm','bao@gmail.com',0)

insert into Account (maND, tenND, sdt, matKhau, gioiTinh, ngaySinh, diaChi, email, isAdmin) values('AD01','Ha Thanh Liem','0977787111','123',0, 03/01/2003, 'quận 11, tphcm','bao@gmail.com',1)

create table Category(
	maloai varchar(20) primary key,
	tenloai nvarchar(50)
)
insert into Category (maLoai, tenLoai) values('L01','Lenovo');
insert into Category (maLoai, tenLoai) values('L02','ASUS');
insert into Category (maLoai, tenLoai) values('L03','Macbook');
insert into Category (maLoai, tenLoai) values('L04','Dell');
insert into Category (maLoai, tenLoai) values('L05','Acer');
insert into Category (maLoai, tenLoai) values('L06','HG');

create table Product(
	masp int IDENTITY(1,1) primary key,
	tensp nvarchar(50),
	dongia float,
	mota nvarchar(225),
	hinhanh varchar(50),
	maloai varchar(20),
	soluong int,
	CONSTRAINT fk_product_category
  FOREIGN KEY (maLoai)
  REFERENCES Category(maLoai)
)
insert into Product (tenSP,donGia,moTa,hinhAnh,maLoai,soLuong) values ('Laptop Lenovo IdeaPad 3', '11890000', 'Laptop Lenovo IdeaPad 3 15IAU7 - 82RK001NVN (i3-1215U/RAM 8GB/512GB SSD/ Windows 11)', 'pic1.webp', 'L01', 20)
insert into Product (tenSP,donGia,moTa,hinhAnh,maLoai,soLuong) values ('Laptop Lenovo Ideapad Gaming 3', '20890999', 'Laptop Lenovo Ideapad Gaming 3 - 15ARH7 -82SB007HVN (Ryzen 7 6800H/RAM 8GB/512GB SSD/ Windows 11)', 'lap2.webp', 'L01', 20)
insert into Product (tenSP,donGia,moTa,hinhAnh,maLoai,soLuong) values ('Laptop Lenovo Ideapad 5', 13990000, 'Laptop Lenovo Ideapad 5 14ITL05-82FE016PVN (i5-1135G7/RAM 8GB/256GB SSD/ Windows 11)', 'lap3.webp', 'L01', 20)
insert into Product (tenSP,donGia,moTa,hinhAnh,maLoai,soLuong) values ('Laptop Lenovo ThinkPad E14', 17890999, 'Laptop Lenovo ThinkPad E14 15IAU7 - 82RK001NVN (i3-1215U/RAM 8GB/512GB SSD/ Windows 11)', 'lap4.webp', 'L01', 20)
insert into Product (tenSP,donGia,moTa,hinhAnh,maLoai,soLuong) values ('Laptop Lenovo V15 G3 IAP', 19899999, 'Laptop Lenovo V15 G3 IAP - 82TT00ARVN (i3-1215U/RAM 8GB/256GB SSD/ Windows 11)', 'lap5.webp', 'L01', 20)

insert into Product (tenSP,donGia,moTa,hinhAnh,maLoai,soLuong) values ('Laptop ASUS IdeaPad 3', '11890000', 'Laptop Lenovo IdeaPad 3 15IAU7 - 82RK001NVN (i3-1215U/RAM 8GB/512GB SSD/ Windows 11)', 'lap1.jpg', 'L02', 20)
insert into Product (tenSP,donGia,moTa,hinhAnh,maLoai,soLuong) values ('Laptop ASUS  Gaming 3', '20890999', 'Laptop Lenovo Ideapad Gaming 3 - 15ARH7 -82SB007HVN (Ryzen 7 6800H/RAM 8GB/512GB SSD/ Windows 11)', 'lap6.webp', 'L02', 20)
insert into Product (tenSP,donGia,moTa,hinhAnh,maLoai,soLuong) values ('Laptop ASUS Ideapad 5', 13990000, 'Laptop Lenovo Ideapad 5 14ITL05-82FE016PVN (i5-1135G7/RAM 8GB/256GB SSD/ Windows 11)', 'lap7.webp', 'L02', 20)
insert into Product (tenSP,donGia,moTa,hinhAnh,maLoai,soLuong) values ('Laptop ASUS  E14', 17890999, 'Laptop Lenovo ThinkPad E14 15IAU7 - 82RK001NVN (i3-1215U/RAM 8GB/512GB SSD/ Windows 11)', 'lap8.webp', 'L02', 20)
insert into Product (tenSP,donGia,moTa,hinhAnh,maLoai,soLuong) values ('Laptop ASUS V15 G3 IAP', 19899999, 'Laptop Lenovo V15 G3 IAP - 82TT00ARVN (i3-1215U/RAM 8GB/256GB SSD/ Windows 11)', 'lap9.webp', 'L02', 20)

create table Orders(
	maorder int IDENTITY(1,1) primary key,
	mand nvarchar(20),
	ngaydathang datetime,
	trangthai nvarchar(50),
	ngaygiao datetime,
	CONSTRAINT fk_orders_account
  FOREIGN KEY (mand)
  REFERENCES Account(mand)
)
insert into Orders( maND, ngayDathang, trangThai, ngayGiao) values ('ND01',01/01/2023,'dagiao',12/01/2023)
insert into Orders( maND, ngayDatHang, trangThai, ngayGiao) values ('ND01',01/03/2023,'gioHang','')

create table OrderDetail(
	maoderdetail int IDENTITY(1,1) primary key,
	maorder int,
	masp int,
	soluong int,
	dongia float,
	CONSTRAINT fk_orderdetail_orrders FOREIGN KEY (maorder) REFERENCES orders(maorder),
	CONSTRAINT fk_orderdetail_product FOREIGN KEY (maSP) REFERENCES Product(maSP)
)

insert into OrderDetail( maOrder, maSP, soLuong, donGia) values (1,1,2,11890000)
insert into OrderDetail( maOrder, maSP, soLuong, donGia) values (1,2,1,20890999)

insert into OrderDetail( maOrder, maSP, soLuong, donGia) values (2,3,2,13990000)
insert into OrderDetail( maOrder, maSP, soLuong, donGia) values (2,4,1,17890999)