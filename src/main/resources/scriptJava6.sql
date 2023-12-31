USE [master]
GO
/****** Object:  Database [asmjava6]    Script Date: 8/12/2023 12:03:56 AM ******/
CREATE DATABASE [asmjava6]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'asmjava6', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\asmjava6.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'asmjava6_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\asmjava6_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [asmjava6] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [asmjava6].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [asmjava6] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [asmjava6] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [asmjava6] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [asmjava6] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [asmjava6] SET ARITHABORT OFF 
GO
ALTER DATABASE [asmjava6] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [asmjava6] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [asmjava6] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [asmjava6] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [asmjava6] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [asmjava6] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [asmjava6] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [asmjava6] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [asmjava6] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [asmjava6] SET  ENABLE_BROKER 
GO
ALTER DATABASE [asmjava6] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [asmjava6] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [asmjava6] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [asmjava6] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [asmjava6] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [asmjava6] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [asmjava6] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [asmjava6] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [asmjava6] SET  MULTI_USER 
GO
ALTER DATABASE [asmjava6] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [asmjava6] SET DB_CHAINING OFF 
GO
ALTER DATABASE [asmjava6] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [asmjava6] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [asmjava6] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [asmjava6] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [asmjava6] SET QUERY_STORE = ON
GO
ALTER DATABASE [asmjava6] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [asmjava6]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 8/12/2023 12:03:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[maND] [nvarchar](20) NOT NULL,
	[tenND] [nvarchar](225) NULL,
	[sdt] [varchar](20) NULL,
	[matKhau] [varchar](20) NULL,
	[gioiTinh] [bit] NULL,
	[ngaySinh] [datetime] NULL,
	[diaChi] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[isAdmin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[maND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/12/2023 12:03:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[maLoai] [varchar](20) NOT NULL,
	[tenLoai] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[maLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 8/12/2023 12:03:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[maOderDetail] [int] IDENTITY(1,1) NOT NULL,
	[maOrder] [int] NULL,
	[maSP] [int] NULL,
	[soLuong] [int] NULL,
	[donGia] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[maOderDetail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 8/12/2023 12:03:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[maOrder] [int] IDENTITY(1,1) NOT NULL,
	[maND] [nvarchar](20) NULL,
	[ngayDatHang] [datetime] NULL,
	[trangThai] [nvarchar](50) NULL,
	[ngayGiao] [datetime] NULL,
	[tennguoinhan] [varchar](200) NULL,
	[diachi] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[maOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 8/12/2023 12:03:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[maSP] [int] IDENTITY(1,1) NOT NULL,
	[tenSP] [nvarchar](200) NULL,
	[donGia] [float] NULL,
	[moTa] [nvarchar](1000) NULL,
	[hinhAnh] [varchar](50) NULL,
	[maLoai] [varchar](20) NULL,
	[soLuong] [int] NULL,
	[baohanh] [nvarchar](200) NULL,
	[thehecpu] [nvarchar](200) NULL,
	[cpu] [nvarchar](200) NULL,
	[chipdohoa] [nvarchar](200) NULL,
	[ram] [nvarchar](200) NULL,
	[manhinh] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[maSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([maND], [tenND], [sdt], [matKhau], [gioiTinh], [ngaySinh], [diaChi], [email], [isAdmin]) VALUES (N'AD01', N'Ha Thanh Liem', N'0977787111', N'123', 1, CAST(N'1990-09-12T00:00:00.000' AS DateTime), N'qu?n 11, tphcm', N'liem@gmail.com', 1)
INSERT [dbo].[Account] ([maND], [tenND], [sdt], [matKhau], [gioiTinh], [ngaySinh], [diaChi], [email], [isAdmin]) VALUES (N'ND01', N'Ho Thi Phuong Nga', N'0944057053', N'123', 1, CAST(N'2002-01-14T00:00:00.000' AS DateTime), N'qu?n 12, tphcm', N'nga@gmail.com', 0)
INSERT [dbo].[Account] ([maND], [tenND], [sdt], [matKhau], [gioiTinh], [ngaySinh], [diaChi], [email], [isAdmin]) VALUES (N'ND02', N'Nguyen Truong An', N'0944989898', N'123', 0, CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'qu?n 11, tphcm', N'an@gmail.com', 0)
INSERT [dbo].[Account] ([maND], [tenND], [sdt], [matKhau], [gioiTinh], [ngaySinh], [diaChi], [email], [isAdmin]) VALUES (N'ND03', N'Trinh Duc Bao', N'0977787878', N'123', 0, CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'qu?n 10, tphcm', N'bao@gmail.com', 0)
INSERT [dbo].[Account] ([maND], [tenND], [sdt], [matKhau], [gioiTinh], [ngaySinh], [diaChi], [email], [isAdmin]) VALUES (N'ND04', N'Lai Van Sam', N'0977787878', N'123', 1, CAST(N'2001-12-12T00:00:00.000' AS DateTime), N'qu?n 10, tphcm', N'bao@gmail.com', 0)
INSERT [dbo].[Account] ([maND], [tenND], [sdt], [matKhau], [gioiTinh], [ngaySinh], [diaChi], [email], [isAdmin]) VALUES (N'ND05', N'Vu Dinh Khang', N'0777878787', N'123', 1, CAST(N'2003-01-01T00:00:00.000' AS DateTime), N'123 au co, quan tan binh', N'khangdv@gmail.com', 0)
GO
INSERT [dbo].[Category] ([maLoai], [tenLoai]) VALUES (N'L01', N'Lenovo')
INSERT [dbo].[Category] ([maLoai], [tenLoai]) VALUES (N'L02', N'ASUS')
INSERT [dbo].[Category] ([maLoai], [tenLoai]) VALUES (N'L03', N'Macbook')
INSERT [dbo].[Category] ([maLoai], [tenLoai]) VALUES (N'L04', N'Dell')
INSERT [dbo].[Category] ([maLoai], [tenLoai]) VALUES (N'L05', N'Acer')
INSERT [dbo].[Category] ([maLoai], [tenLoai]) VALUES (N'L06', N'HG')
INSERT [dbo].[Category] ([maLoai], [tenLoai]) VALUES (N'L07', N'samsung')
INSERT [dbo].[Category] ([maLoai], [tenLoai]) VALUES (N'l08', N'check')
INSERT [dbo].[Category] ([maLoai], [tenLoai]) VALUES (N'l09', N'111')
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([maOderDetail], [maOrder], [maSP], [soLuong], [donGia]) VALUES (1, 1, 1, 2, 11890000)
INSERT [dbo].[OrderDetail] ([maOderDetail], [maOrder], [maSP], [soLuong], [donGia]) VALUES (2, 1, 2, 1, 20890999)
INSERT [dbo].[OrderDetail] ([maOderDetail], [maOrder], [maSP], [soLuong], [donGia]) VALUES (3, 2, 3, 2, 13990000)
INSERT [dbo].[OrderDetail] ([maOderDetail], [maOrder], [maSP], [soLuong], [donGia]) VALUES (4, 2, 4, 1, 17890999)
INSERT [dbo].[OrderDetail] ([maOderDetail], [maOrder], [maSP], [soLuong], [donGia]) VALUES (5, 3, 1, 1, NULL)
INSERT [dbo].[OrderDetail] ([maOderDetail], [maOrder], [maSP], [soLuong], [donGia]) VALUES (6, 4, 1, 4, NULL)
INSERT [dbo].[OrderDetail] ([maOderDetail], [maOrder], [maSP], [soLuong], [donGia]) VALUES (7, 5, 2, 4, NULL)
INSERT [dbo].[OrderDetail] ([maOderDetail], [maOrder], [maSP], [soLuong], [donGia]) VALUES (8, 6, 19, 3, NULL)
INSERT [dbo].[OrderDetail] ([maOderDetail], [maOrder], [maSP], [soLuong], [donGia]) VALUES (9, 7, 2, 1, NULL)
INSERT [dbo].[OrderDetail] ([maOderDetail], [maOrder], [maSP], [soLuong], [donGia]) VALUES (10, 8, 8, 2, NULL)
INSERT [dbo].[OrderDetail] ([maOderDetail], [maOrder], [maSP], [soLuong], [donGia]) VALUES (11, 9, 9, 3, NULL)
INSERT [dbo].[OrderDetail] ([maOderDetail], [maOrder], [maSP], [soLuong], [donGia]) VALUES (13, 11, 14, 2, NULL)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([maOrder], [maND], [ngayDatHang], [trangThai], [ngayGiao], [tennguoinhan], [diachi]) VALUES (1, N'ND01', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'dagiao', CAST(N'2023-07-08T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Orders] ([maOrder], [maND], [ngayDatHang], [trangThai], [ngayGiao], [tennguoinhan], [diachi]) VALUES (2, N'ND01', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'gioHang', CAST(N'2023-03-08T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Orders] ([maOrder], [maND], [ngayDatHang], [trangThai], [ngayGiao], [tennguoinhan], [diachi]) VALUES (3, NULL, CAST(N'2023-08-08T00:00:00.000' AS DateTime), N'gioHang', CAST(N'2023-08-08T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Orders] ([maOrder], [maND], [ngayDatHang], [trangThai], [ngayGiao], [tennguoinhan], [diachi]) VALUES (4, NULL, CAST(N'2023-08-08T00:00:00.000' AS DateTime), N'gioHang', CAST(N'2023-08-08T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Orders] ([maOrder], [maND], [ngayDatHang], [trangThai], [ngayGiao], [tennguoinhan], [diachi]) VALUES (5, N'ND02', CAST(N'2023-08-08T00:00:00.000' AS DateTime), N'dagiao', CAST(N'2023-08-08T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Orders] ([maOrder], [maND], [ngayDatHang], [trangThai], [ngayGiao], [tennguoinhan], [diachi]) VALUES (6, N'ND02', CAST(N'2023-08-08T00:00:00.000' AS DateTime), N'dagiao', CAST(N'2023-08-08T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Orders] ([maOrder], [maND], [ngayDatHang], [trangThai], [ngayGiao], [tennguoinhan], [diachi]) VALUES (7, N'ND02', CAST(N'2023-08-08T00:00:00.000' AS DateTime), N'dagiao', CAST(N'2023-08-08T00:00:00.000' AS DateTime), N'Be Heo', N'a123 to ky DHT')
INSERT [dbo].[Orders] ([maOrder], [maND], [ngayDatHang], [trangThai], [ngayGiao], [tennguoinhan], [diachi]) VALUES (8, N'ND02', CAST(N'2023-08-08T00:00:00.000' AS DateTime), N'dagiao', CAST(N'2023-08-08T00:00:00.000' AS DateTime), N'mo ba', N'49 To Ky CAFE bazan')
INSERT [dbo].[Orders] ([maOrder], [maND], [ngayDatHang], [trangThai], [ngayGiao], [tennguoinhan], [diachi]) VALUES (9, N'ND02', CAST(N'2023-08-08T00:00:00.000' AS DateTime), N'gioHang', CAST(N'2023-08-08T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Orders] ([maOrder], [maND], [ngayDatHang], [trangThai], [ngayGiao], [tennguoinhan], [diachi]) VALUES (10, N'ND02', CAST(N'2023-08-08T00:00:00.000' AS DateTime), N'gioHang', CAST(N'2023-08-08T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Orders] ([maOrder], [maND], [ngayDatHang], [trangThai], [ngayGiao], [tennguoinhan], [diachi]) VALUES (11, N'ND02', CAST(N'2023-08-08T00:00:00.000' AS DateTime), N'dagiao', CAST(N'2023-08-08T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([maSP], [tenSP], [donGia], [moTa], [hinhAnh], [maLoai], [soLuong], [baohanh], [thehecpu], [cpu], [chipdohoa], [ram], [manhinh]) VALUES (1, N'Laptop Lenovo Legion 5 15IAH7H-82RB0047VN (i7-12700H/RAM 16GB/512GB SSD/RTX 3060 6GB GDDR6/Windows 11)', 32690000, N'Laptop Lenovo Legion 5 15IAH7H-82RB0047VN (i7-12700H/RAM 16GB/512GB SSD/RTX 3060 6GB GDDR6/Windows 11)', N'pic1.webp', N'L01', 20, N'12 thang', N'Core i7', N'
Intel Core i7-12700H ( 2.3 GHz - 4.7GHz / 24MB / 14 nhân, 20 luồng )', N'RTX 3060 6GB GDDR6 / Intel Iris Xe Graphics', N'
2 x 8GB DDR5 4800MHz ( 2 Khe cắm / Hỗ trợ tối đa 32GB )', N'
15.6" ( 2560 x 1440 ) WQHD IPS 165Hz , Màn hình ch?ng lóa , FHD webcam')
INSERT [dbo].[Product] ([maSP], [tenSP], [donGia], [moTa], [hinhAnh], [maLoai], [soLuong], [baohanh], [thehecpu], [cpu], [chipdohoa], [ram], [manhinh]) VALUES (2, N'Laptop Lenovo Ideapad Gaming 3', 20890999, N'Laptop Lenovo Ideapad Gaming 3 - 15ARH7 -82SB007HVN (Ryzen 7 6800H/RAM 8GB/512GB SSD/ Windows 11)', N'lap2.webp', N'L01', 20, N'12 thang', N'Core i7 , Intel Core thế hệ thứ 12', N'
Intel Core i7-12700H ( 2.3 GHz - 4.7GHz / 24MB / 14 nhân, 20 luồng )', N'RTX 3060 6GB GDDR6 / Intel Iris Xe Graphics', N'
2 x 8GB DDR5 4800MHz ( 2 Khe cắm / Hỗ trợ tối đa 32GB )', N'
15.6" ( 2560 x 1440 ) WQHD IPS 165Hz , Màn hình chống lóa , FHD webcam')
INSERT [dbo].[Product] ([maSP], [tenSP], [donGia], [moTa], [hinhAnh], [maLoai], [soLuong], [baohanh], [thehecpu], [cpu], [chipdohoa], [ram], [manhinh]) VALUES (3, N'Laptop Lenovo Ideapad 5', 13990000, N'Laptop Lenovo Ideapad 5 14ITL05-82FE016PVN (i5-1135G7/RAM 8GB/256GB SSD/ Windows 11)', N'lap3.webp', N'L01', 20, N'12 thang', N'Core i7 , Intel Core thế hệ thứ 12', N'
Intel Core i7-12700H ( 2.3 GHz - 4.7GHz / 24MB / 14 nhân, 20 luồng )', N'RTX 3060 6GB GDDR6 / Intel Iris Xe Graphics', N'
2 x 8GB DDR5 4800MHz ( 2 Khe cắm / Hỗ trợ tối đa 32GB )', N'
15.6" ( 2560 x 1440 ) WQHD IPS 165Hz , Màn hình chống lóa , FHD webcam')
INSERT [dbo].[Product] ([maSP], [tenSP], [donGia], [moTa], [hinhAnh], [maLoai], [soLuong], [baohanh], [thehecpu], [cpu], [chipdohoa], [ram], [manhinh]) VALUES (4, N'Laptop Lenovo ThinkPad E14', 17890999, N'Laptop Lenovo ThinkPad E14 15IAU7 - 82RK001NVN (i3-1215U/RAM 8GB/512GB SSD/ Windows 11)', N'lap4.webp', N'L01', 20, N'12 thang', N'Core i7 , Intel Core thế hệ thứ 12', N'
Intel Core i7-12700H ( 2.3 GHz - 4.7GHz / 24MB / 14 nhân, 20 luồng )', N'RTX 3060 6GB GDDR6 / Intel Iris Xe Graphics', N'
2 x 8GB DDR5 4800MHz ( 2 Khe cắm / Hỗ trợ tối đa 32GB )', N'
15.6" ( 2560 x 1440 ) WQHD IPS 165Hz , Màn hình chống lóa , FHD webcam')
INSERT [dbo].[Product] ([maSP], [tenSP], [donGia], [moTa], [hinhAnh], [maLoai], [soLuong], [baohanh], [thehecpu], [cpu], [chipdohoa], [ram], [manhinh]) VALUES (5, N'Laptop Lenovo V15 G3 IAP', 19899999, N'Laptop Lenovo V15 G3 IAP - 82TT00ARVN (i3-1215U/RAM 8GB/256GB SSD/ Windows 11)', N'lap5.webp', N'L01', 20, N'12 thang', N'Core i7 , Intel Core thế hệ thứ 12', N'
Intel Core i7-12700H ( 2.3 GHz - 4.7GHz / 24MB / 14 nhân, 20 luồng )', N'RTX 3060 6GB GDDR6 / Intel Iris Xe Graphics', N'
2 x 8GB DDR5 4800MHz ( 2 Khe cắm / Hỗ trợ tối đa 32GB )', N'
15.6" ( 2560 x 1440 ) WQHD IPS 165Hz , Màn hình chống lóa , FHD webcam')
INSERT [dbo].[Product] ([maSP], [tenSP], [donGia], [moTa], [hinhAnh], [maLoai], [soLuong], [baohanh], [thehecpu], [cpu], [chipdohoa], [ram], [manhinh]) VALUES (6, N'Laptop ASUS IdeaPad 3', 11890000, N'Laptop Lenovo IdeaPad 3 15IAU7 - 82RK001NVN (i3-1215U/RAM 8GB/512GB SSD/ Windows 11)', N'lap1.jpg', N'L02', 20, N'12 thang', N'Core i7 , Intel Core thế hệ thứ 12', N'
Intel Core i7-12700H ( 2.3 GHz - 4.7GHz / 24MB / 14 nhân, 20 luồng )', N'RTX 3060 6GB GDDR6 / Intel Iris Xe Graphics', N'
2 x 8GB DDR5 4800MHz ( 2 Khe cắm / Hỗ trợ tối đa 32GB )', N'
15.6" ( 2560 x 1440 ) WQHD IPS 165Hz , Màn hình chống lóa , FHD webcam')
INSERT [dbo].[Product] ([maSP], [tenSP], [donGia], [moTa], [hinhAnh], [maLoai], [soLuong], [baohanh], [thehecpu], [cpu], [chipdohoa], [ram], [manhinh]) VALUES (7, N'Laptop ASUS  Gaming 3', 200, N'Laptop Lenovo Ideapad Gaming 3 - 15ARH7 -82SB007HVN (Ryzen 7 6800H/RAM 8GB/512GB SSD/ Windows 11)', N'pro8.jpg', N'L02', 20, N'12 thang', N'Core i7 , Intel Core thế hệ thứ 12', N'
Intel Core i7-12700H ( 2.3 GHz - 4.7GHz / 24MB / 14 nhân, 20 luồng )', N'RTX 3060 6GB GDDR6 / Intel Iris Xe Graphics', N'
2 x 8GB DDR5 4800MHz ( 2 Khe cắm / Hỗ trợ tối đa 32GB )', N'
15.6" ( 2560 x 1440 ) WQHD IPS 165Hz , Màn hình chống lóa , FHD webcam')
INSERT [dbo].[Product] ([maSP], [tenSP], [donGia], [moTa], [hinhAnh], [maLoai], [soLuong], [baohanh], [thehecpu], [cpu], [chipdohoa], [ram], [manhinh]) VALUES (8, N'Laptop ASUS Ideapad 5', 13990000, N'Laptop Lenovo Ideapad 5 14ITL05-82FE016PVN (i5-1135G7/RAM 8GB/256GB SSD/ Windows 11)', N'lap7.webp', N'L02', 20, N'12 thang', N'Core i7 , Intel Core thế hệ thứ 12', N'
Intel Core i7-12700H ( 2.3 GHz - 4.7GHz / 24MB / 14 nhân, 20 luồng )', N'RTX 3060 6GB GDDR6 / Intel Iris Xe GraphicsRTX 3060 6GB GDDR6 / Intel Iris Xe Graphics', N'
2 x 8GB DDR5 4800MHz ( 2 Khe cắm / Hỗ trợ tối đa 32GB )', N'
15.6" ( 2560 x 1440 ) WQHD IPS 165Hz , Màn hình chống lóa , FHD webcam')
INSERT [dbo].[Product] ([maSP], [tenSP], [donGia], [moTa], [hinhAnh], [maLoai], [soLuong], [baohanh], [thehecpu], [cpu], [chipdohoa], [ram], [manhinh]) VALUES (9, N'Laptop ASUS  E14', 17890999, N'Laptop Lenovo ThinkPad E14 15IAU7 - 82RK001NVN (i3-1215U/RAM 8GB/512GB SSD/ Windows 11)', N'lap8.webp', N'L02', 20, N'12 thang', N'Core i7 , Intel Core thế hệ thứ 12', N'
Intel Core i7-12700H ( 2.3 GHz - 4.7GHz / 24MB / 14 nhân, 20 luồng )', N'RTX 3060 6GB GDDR6 / Intel Iris Xe Graphics', N'
2 x 8GB DDR5 4800MHz ( 2 Khe cắm / Hỗ trợ tối đa 32GB )
2 x 8GB DDR5 4800MHz ( 2 Khe cắm / Hỗ trợ tối đa 32GB )', N'
15.6" ( 2560 x 1440 ) WQHD IPS 165Hz , Màn hình chống lóa , FHD webcam')
INSERT [dbo].[Product] ([maSP], [tenSP], [donGia], [moTa], [hinhAnh], [maLoai], [soLuong], [baohanh], [thehecpu], [cpu], [chipdohoa], [ram], [manhinh]) VALUES (10, N'Laptop ASUS V15 G3 IAP', 19899999, N'Laptop Lenovo V15 G3 IAP - 82TT00ARVN (i3-1215U/RAM 8GB/256GB SSD/ Windows 11)', N'lap9.webp', N'L02', 20, N'12 thang', N'Core i7 , Intel Core thế hệ thứ 12', N'
Intel Core i7-12700H ( 2.3 GHz - 4.7GHz / 24MB / 14 nhân, 20 luồng )', N'RTX 3060 6GB GDDR6 / Intel Iris Xe Graphics', N'
2 x 8GB DDR5 4800MHz ( 2 Khe cắm / Hỗ trợ tối đa 32GB )', N'
15.6" ( 2560 x 1440 ) WQHD IPS 165Hz , Màn hình chống lóa , FHD webcam')
INSERT [dbo].[Product] ([maSP], [tenSP], [donGia], [moTa], [hinhAnh], [maLoai], [soLuong], [baohanh], [thehecpu], [cpu], [chipdohoa], [ram], [manhinh]) VALUES (11, N'Lap test', 29800000, N'laptop sieu xin', N'lap3.webp', N'L01', 20, N'12 thang', N'Core i7 , Intel Core thế hệ thứ 12', N'Core i7 ', N'RTX 3060 6GB GDDR6 / Intel Iris Xe Graphics', N'2x 8GB', N'16in')
INSERT [dbo].[Product] ([maSP], [tenSP], [donGia], [moTa], [hinhAnh], [maLoai], [soLuong], [baohanh], [thehecpu], [cpu], [chipdohoa], [ram], [manhinh]) VALUES (14, N'Laptop LG Gram 2023 15Z90RT-G.AH55A5 ', 200, N'Laptop LG Gram 2023 15Z90RT-G.AH55A5 (i5-1340P/RAM 16GB/512GB SSD/ Windows 11)', N'pro1.jpg', N'L03', 20, N'12 thang', N'Core i7 , Intel Core thế hệ thứ 12', N'
Intel Core i7-12700H ( 2.3 GHz - 4.7GHz / 24MB / 14 nhân, 20 luồng )', N'RTX 3060 6GB GDDR6 / Intel Iris Xe Graphics', N'
2 x 8GB DDR5 4800MHz ( 2 Khe cắm / Hỗ trợ tối đa 32GB )', N'
15.6" ( 2560 x 1440 ) WQHD IPS 165Hz , Màn hình chống lóa , FHD webcam')
INSERT [dbo].[Product] ([maSP], [tenSP], [donGia], [moTa], [hinhAnh], [maLoai], [soLuong], [baohanh], [thehecpu], [cpu], [chipdohoa], [ram], [manhinh]) VALUES (19, N' Laptop Asus X415EA-EK675W', 300, N'Laptop ASUS Vivobook X415EA-EK675W (i3-1115G4/RAM 4GB/256GB SSD/ Windows 11)', N'pro9.jpg', N'L03', 20, N'12 thang', N'Core i7 , Intel Core thế hệ thứ 12', N'
Intel Core i7-12700H ( 2.3 GHz - 4.7GHz / 24MB / 14 nhân, 20 luồng )', N'RTX 3060 6GB GDDR6 / Intel Iris Xe Graphics', N'
2 x 8GB DDR5 4800MHz ( 2 Khe cắm / Hỗ trợ tối đa 32GB )', N'
15.6" ( 2560 x 1440 ) WQHD IPS 165Hz , Màn hình chống lóa , FHD webcam')
INSERT [dbo].[Product] ([maSP], [tenSP], [donGia], [moTa], [hinhAnh], [maLoai], [soLuong], [baohanh], [thehecpu], [cpu], [chipdohoa], [ram], [manhinh]) VALUES (21, N'Laptop Dell Vostro 3510', 400, N'Laptop Dell Vostro 3510 (3510-P112F002BBL) (i5-1135G7/RAM 8GB/512GB SSD/ Windows 11 + Office)', N'lap5.webp', N'L03', 20, N'12 thang', N'Core i7 , Intel Core thế hệ thứ 12', N'
Intel Core i7-12700H ( 2.3 GHz - 4.7GHz / 24MB / 14 nhân, 20 luồng )', N'RTX 3060 6GB GDDR6 / Intel Iris Xe Graphics', N'
2 x 8GB DDR5 4800MHz ( 2 Khe cắm / Hỗ trợ tối đa 32GB )', N'
15.6" ( 2560 x 1440 ) WQHD IPS 165Hz , Màn hình chống lóa , FHD webcam')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [fk_orderdetail_orrders] FOREIGN KEY([maOrder])
REFERENCES [dbo].[Orders] ([maOrder])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [fk_orderdetail_orrders]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [fk_orderdetail_product] FOREIGN KEY([maSP])
REFERENCES [dbo].[Product] ([maSP])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [fk_orderdetail_product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_orders_account] FOREIGN KEY([maND])
REFERENCES [dbo].[Account] ([maND])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fk_orders_account]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [fk_product_category] FOREIGN KEY([maLoai])
REFERENCES [dbo].[Category] ([maLoai])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [fk_product_category]
GO
USE [master]
GO
ALTER DATABASE [asmjava6] SET  READ_WRITE 
GO
