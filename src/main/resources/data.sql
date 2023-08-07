create database asmjava6
use asmjava6
create table Account (
	maND nvarchar(20) primary key,
	tenND nvarchar(225),
	sdt varchar(20),
	matKhau varchar(20),
	gioiTinh bit,
	ngaySinh datetime,
	diaChi nvarchar(50),
	email nvarchar(50),
	isAdmin bit
)

insert into Account (maND, tenND, sdt, matKhau, gioiTinh, ngaySinh, diaChi, email, isAdmin) values('ND01','Ho Thi Phuong Nga','0944057053','123',0, 01/01/2002, 'quận 12, tphcm','nga@gmail.com',0)
insert into Account (maND, tenND, sdt, matKhau, gioiTinh, ngaySinh, diaChi, email, isAdmin) values('ND02','Nguyen Truong An','0944989898','123',0, 02/01/2000, 'quận 11, tphcm','an@gmail.com',0)
insert into Account (maND, tenND, sdt, matKhau, gioiTinh, ngaySinh, diaChi, email, isAdmin) values('ND03','Trinh Duc Bao','0977787878','123',0, 03/01/2003, 'quận 10, tphcm','bao@gmail.com',0)
insert into Account (maND, tenND, sdt, matKhau, gioiTinh, ngaySinh, diaChi, email, isAdmin) values('ND05','Vu Dinh Khang','0977787878','123',0, 03/01/2003, 'quận 10, tphcm','bao@gmail.com',0)
insert into Account (maND, tenND, sdt, matKhau, gioiTinh, ngaySinh, diaChi, email, isAdmin) values('ND04','Lai Van Sam','0977787878','123',0, 03/01/2003, 'quận 10, tphcm','bao@gmail.com',0)

insert into Account (maND, tenND, sdt, matKhau, gioiTinh, ngaySinh, diaChi, email, isAdmin) values('AD01','Ha Thanh Liem','0977787111','123',0, 03/01/2003, 'quận 11, tphcm','bao@gmail.com',1)

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
	maOrder int IDENTITY(1,1) primary key,
	maND nvarchar(20),
	ngayDatHang datetime,
	trangThai nvarchar(50),
	ngayGiao datetime,
	CONSTRAINT fk_orders_account
  FOREIGN KEY (maND)
  REFERENCES Account(maND)
)
insert into Orders( maND, ngayDatHang, trangThai, ngayGiao) values ('ND01',01/01/2023,'dagiao',12/01/2023)
insert into Orders( maND, ngayDatHang, trangThai, ngayGiao) values ('ND01',01/03/2023,'gioHang','')

create table OrderDetail(
	maOderDetail int IDENTITY(1,1) primary key,
	maOrder int,
	maSP int,
	soLuong int,
	donGia float,
	CONSTRAINT fk_orderdetail_orrders FOREIGN KEY (maOrder) REFERENCES Orders(maOrder),
	CONSTRAINT fk_orderdetail_product FOREIGN KEY (maSP) REFERENCES Product(maSP)
)

insert into OrderDetail( maOrder, maSP, soLuong, donGia) values (1,1,2,11890000)
insert into OrderDetail( maOrder, maSP, soLuong, donGia) values (1,2,1,20890999)

insert into OrderDetail( maOrder, maSP, soLuong, donGia) values (2,3,2,13990000)
insert into OrderDetail( maOrder, maSP, soLuong, donGia) values (2,4,1,17890999)
select  *from orders
delete from product where masp=22
select sum(d.soluong * d.dongia) from orders o inner join OrderDetail d on o.maOrder = d.maOrder where trangthai='dagiao' and o.ngayGiao  between 2011/02/25 and 2011/02/27