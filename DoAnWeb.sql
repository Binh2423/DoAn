USE [DoAnWeb]
GO
/****** Object:  Table [dbo].[CTHD]    Script Date: 18/04/2024 6:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHD](
	[SoHD] [int] NOT NULL,
	[MaTP] [int] NOT NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK__CTHD__7E4EFB5060D60250] PRIMARY KEY CLUSTERED 
(
	[SoHD] ASC,
	[MaTP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTTT]    Script Date: 18/04/2024 6:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTTT](
	[IdMay] [int] NOT NULL,
	[SDT] [char](10) NOT NULL,
	[SoGioDaSuDung] [decimal](5, 2) NULL,
	[GioBatDau] [datetime] NOT NULL,
	[GioKetThuc] [datetime] NULL,
	[ThanhTien] [int] NULL,
 CONSTRAINT [PK_CTTT_1] PRIMARY KEY CLUSTERED 
(
	[IdMay] ASC,
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 18/04/2024 6:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[SoHD] [int] IDENTITY(1,1) NOT NULL,
	[SDT] [char](10) NOT NULL,
	[TongTien] [int] NULL,
	[NgayThanhToan] [datetime] NULL,
 CONSTRAINT [PK__HoaDon__BC3CAB57E819ABE1] PRIMARY KEY CLUSTERED 
(
	[SoHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loai]    Script Date: 18/04/2024 6:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[MaLoai] [varchar](10) NOT NULL,
	[TenLoai] [nvarchar](30) NULL,
	[Hide] [bit] NULL,
	[Link] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MayTinh]    Script Date: 18/04/2024 6:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MayTinh](
	[IdMay] [int] IDENTITY(1,1) NOT NULL,
	[TenMay] [nvarchar](30) NULL,
	[Gia] [int] NULL,
	[TrangThai] [bit] NULL,
	[HinhAnh] [nvarchar](100) NULL,
	[BiHong] [bit] NULL,
	[Order] [int] NULL,
	[Hide] [bit] NULL,
	[MaLoai] [varchar](10) NULL,
 CONSTRAINT [PK__MayTinh__0D13B75997AD6F61] PRIMARY KEY CLUSTERED 
(
	[IdMay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 18/04/2024 6:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[IdMenu] [varchar](10) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Link] [varchar](20) NULL,
	[Hide] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 18/04/2024 6:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[SDT] [char](10) NOT NULL,
	[HoTen] [nvarchar](60) NULL,
	[NgaySinh] [datetime] NULL,
	[Email] [varchar](100) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[Hide] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 18/04/2024 6:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[SDT] [char](10) NOT NULL,
	[MaVT] [varchar](10) NOT NULL,
	[MatKhau] [varchar](255) NULL,
	[Hide] [bit] NULL,
	[SoTienTrongTK] [int] NULL,
 CONSTRAINT [PK__TaiKhoan__CA1930A4997D07E6] PRIMARY KEY CLUSTERED 
(
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThucPham]    Script Date: 18/04/2024 6:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThucPham](
	[MaTP] [int] NOT NULL,
	[MaLoai] [varchar](10) NOT NULL,
	[TenTP] [nvarchar](30) NULL,
	[GiaTP] [int] NULL,
	[SoLuong] [smallint] NULL,
	[HinhAnh] [varchar](100) NULL,
	[Order] [int] NULL,
	[Hide] [bit] NULL,
 CONSTRAINT [PK__ThucPham__2725007D94D93315] PRIMARY KEY CLUSTERED 
(
	[MaTP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VaiTro]    Script Date: 18/04/2024 6:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VaiTro](
	[MaVT] [varchar](10) NOT NULL,
	[TenVT] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CTHD] ([SoHD], [MaTP], [SoLuong]) VALUES (2, 2, 3)
INSERT [dbo].[CTHD] ([SoHD], [MaTP], [SoLuong]) VALUES (2, 3, 1)
INSERT [dbo].[CTHD] ([SoHD], [MaTP], [SoLuong]) VALUES (2, 4, 1)
INSERT [dbo].[CTHD] ([SoHD], [MaTP], [SoLuong]) VALUES (2, 11, 1)
INSERT [dbo].[CTHD] ([SoHD], [MaTP], [SoLuong]) VALUES (3, 2, 2)
INSERT [dbo].[CTHD] ([SoHD], [MaTP], [SoLuong]) VALUES (3, 3, 1)
INSERT [dbo].[CTHD] ([SoHD], [MaTP], [SoLuong]) VALUES (3, 4, 1)
INSERT [dbo].[CTHD] ([SoHD], [MaTP], [SoLuong]) VALUES (4, 3, 1)
INSERT [dbo].[CTHD] ([SoHD], [MaTP], [SoLuong]) VALUES (4, 15, 1)
INSERT [dbo].[CTHD] ([SoHD], [MaTP], [SoLuong]) VALUES (4, 23, 1)
INSERT [dbo].[CTHD] ([SoHD], [MaTP], [SoLuong]) VALUES (5, 2, 1)
INSERT [dbo].[CTHD] ([SoHD], [MaTP], [SoLuong]) VALUES (5, 30, 1)
INSERT [dbo].[CTHD] ([SoHD], [MaTP], [SoLuong]) VALUES (6, 8, 1)
INSERT [dbo].[CTHD] ([SoHD], [MaTP], [SoLuong]) VALUES (7, 2, 4)
INSERT [dbo].[CTHD] ([SoHD], [MaTP], [SoLuong]) VALUES (7, 3, 1)
INSERT [dbo].[CTHD] ([SoHD], [MaTP], [SoLuong]) VALUES (8, 2, 1)
INSERT [dbo].[CTHD] ([SoHD], [MaTP], [SoLuong]) VALUES (8, 7, 1)
GO
INSERT [dbo].[CTTT] ([IdMay], [SDT], [SoGioDaSuDung], [GioBatDau], [GioKetThuc], [ThanhTien]) VALUES (1, N'0101010101', CAST(0.00 AS Decimal(5, 2)), CAST(N'2024-04-17T21:33:56.227' AS DateTime), CAST(N'2024-04-17T22:02:43.003' AS DateTime), 3290)
INSERT [dbo].[CTTT] ([IdMay], [SDT], [SoGioDaSuDung], [GioBatDau], [GioKetThuc], [ThanhTien]) VALUES (4, N'0101010101', CAST(1.00 AS Decimal(5, 2)), CAST(N'2024-04-18T00:21:36.087' AS DateTime), CAST(N'2024-04-18T01:43:24.407' AS DateTime), 9450)
INSERT [dbo].[CTTT] ([IdMay], [SDT], [SoGioDaSuDung], [GioBatDau], [GioKetThuc], [ThanhTien]) VALUES (6, N'0101010101', NULL, CAST(N'2024-04-18T01:47:48.313' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([SoHD], [SDT], [TongTien], [NgayThanhToan]) VALUES (2, N'0101010101', 130000, CAST(N'2024-04-14T14:44:58.527' AS DateTime))
INSERT [dbo].[HoaDon] ([SoHD], [SDT], [TongTien], [NgayThanhToan]) VALUES (3, N'0101010101', 80000, CAST(N'2024-04-14T14:59:44.680' AS DateTime))
INSERT [dbo].[HoaDon] ([SoHD], [SDT], [TongTien], [NgayThanhToan]) VALUES (4, N'0101010101', 70000, CAST(N'2024-04-14T15:02:23.287' AS DateTime))
INSERT [dbo].[HoaDon] ([SoHD], [SDT], [TongTien], [NgayThanhToan]) VALUES (5, N'0101010101', 35000, CAST(N'2024-04-14T15:02:54.017' AS DateTime))
INSERT [dbo].[HoaDon] ([SoHD], [SDT], [TongTien], [NgayThanhToan]) VALUES (6, N'0101010101', 20000, CAST(N'2024-04-14T15:04:21.720' AS DateTime))
INSERT [dbo].[HoaDon] ([SoHD], [SDT], [TongTien], [NgayThanhToan]) VALUES (7, N'0101010101', 105000, CAST(N'2024-04-14T22:57:31.213' AS DateTime))
INSERT [dbo].[HoaDon] ([SoHD], [SDT], [TongTien], [NgayThanhToan]) VALUES (8, N'0101010101', 35000, CAST(N'2024-04-14T23:20:47.227' AS DateTime))
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [Hide], [Link]) VALUES (N'MT10', N'Khu Máy 10', 0, N'khu-may-10')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [Hide], [Link]) VALUES (N'MT7', N'Khu Máy 7', 0, N'khu-may-7')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [Hide], [Link]) VALUES (N'MT8', N'Khu Máy 8', 0, N'khu-may-8')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [Hide], [Link]) VALUES (N'TP01', N'Nước Uống', 0, N'nuoc-uong')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [Hide], [Link]) VALUES (N'TP02', N'Nước Pha Chế', 0, N'nuoc-pha-che')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [Hide], [Link]) VALUES (N'TP03', N'Đồ Ăn Vặt', 0, N'do-an-vat')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [Hide], [Link]) VALUES (N'TP04', N'Món Chính', 0, N'mon-chinh')
GO
SET IDENTITY_INSERT [dbo].[MayTinh] ON 

INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (1, N'Máy tính 1', 7000, 0, N'MH_Den.jpg', 0, 1, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (2, N'Máy tính 2', 7000, 0, N'MH_Den.jpg', 0, 2, 1, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (3, N'Máy tính 3', 7000, 0, N'MH_Den.jpg', 0, 3, 1, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (4, N'Máy tính 4', 7000, 0, N'MH_Den.jpg', 0, 4, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (5, N'Máy tính 5', 7000, 0, N'MH_Den.jpg', 0, 5, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (6, N'Máy tính 6', 7000, 1, N'MH_Xanh.jpg', 0, 6, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (7, N'Máy tính 7', 7000, 0, N'MH_Den.jpg', 0, 7, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (8, N'Máy tính 8', 7000, 0, N'MH_Den.jpg', 0, 8, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (9, N'Máy tính 9', 7000, 0, N'MH_Den.jpg', 0, 9, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (10, N'Máy tính 10', 7000, 0, N'MH_Den.jpg', 0, 10, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (11, N'Máy tính 11', 7000, 0, N'MH_Den.jpg', 0, 11, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (12, N'Máy tính 12', 7000, 0, N'MH_Den.jpg', 0, 12, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (13, N'Máy tính 13', 7000, 0, N'MH_Den.jpg', 0, 13, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (14, N'Máy tính 14', 7000, 0, N'MH_Den.jpg', 0, 14, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (15, N'Máy tính 15', 7000, 0, N'MH_Den.jpg', 0, 15, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (16, N'Máy tính 16', 7000, 0, N'MH_Den.jpg', 0, 16, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (17, N'Máy tính 17', 7000, 0, N'MH_Den.jpg', 0, 17, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (18, N'Máy tính 18', 7000, 0, N'MH_Den.jpg', 0, 18, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (19, N'Máy tính 19', 7000, 0, N'MH_Den.jpg', 0, 19, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (20, N'Máy tính 20', 7000, 0, N'MH_Den.jpg', 0, 20, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (21, N'Máy tính 21', 7000, 0, N'MH_Den.jpg', 0, 21, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (22, N'Máy tính 22', 7000, 0, N'MH_Den.jpg', 0, 22, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (23, N'Máy tính 23', 7000, 0, N'MH_Den.jpg', 0, 23, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (24, N'Máy tính 24', 7000, 0, N'MH_Den.jpg', 0, 24, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (25, N'Máy tính 25', 7000, 0, N'MH_Den.jpg', 0, 25, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (26, N'Máy tính 26', 7000, 0, N'MH_Den.jpg', 0, 26, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (27, N'Máy tính 27', 7000, 0, N'MH_Den.jpg', 0, 27, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (28, N'Máy tính 28', 7000, 0, N'MH_Den.jpg', 0, 28, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (29, N'Máy tính 29', 7000, 0, N'MH_Den.jpg', 0, 29, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (30, N'Máy tính 30', 7000, 0, N'MH_Den.jpg', 0, 30, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (31, N'Máy tính 31', 8000, 0, N'MH_Den.jpg', 0, 31, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (32, N'Máy tính 32', 8000, 0, N'MH_Den.jpg', 0, 32, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (33, N'Máy tính 33', 8000, 0, N'MH_Den.jpg', 0, 33, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (34, N'Máy tính 34', 8000, 0, N'MH_Den.jpg', 0, 34, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (35, N'Máy tính 35', 8000, 0, N'MH_Den.jpg', 0, 35, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (36, N'Máy tính 36', 8000, 0, N'MH_Den.jpg', 0, 36, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (37, N'Máy tính 37', 8000, 0, N'MH_Den.jpg', 0, 37, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (38, N'Máy tính 38', 8000, 0, N'MH_Den.jpg', 0, 38, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (39, N'Máy tính 39', 8000, 0, N'MH_Den.jpg', 0, 39, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (40, N'Máy tính 40', 8000, 0, N'MH_Den.jpg', 0, 40, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (41, N'Máy tính 41', 8000, 0, N'MH_Den.jpg', 0, 41, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (42, N'Máy tính 42', 8000, 0, N'MH_Den.jpg', 0, 42, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (43, N'Máy tính 43', 8000, 0, N'MH_Den.jpg', 0, 43, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (44, N'Máy tính 44', 8000, 0, N'MH_Den.jpg', 0, 44, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (45, N'Máy tính 45', 8000, 0, N'MH_Den.jpg', 0, 45, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (46, N'Máy tính 46', 8000, 0, N'MH_Den.jpg', 0, 46, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (47, N'Máy tính 47', 8000, 0, N'MH_Den.jpg', 0, 47, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (48, N'Máy tính 48', 8000, 0, N'MH_Den.jpg', 0, 48, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (49, N'Máy tính 49', 8000, 0, N'MH_Den.jpg', 0, 49, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (50, N'Máy tính 50', 8000, 0, N'MH_Den.jpg', 0, 50, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (51, N'Máy tính 51', 8000, 0, N'MH_Den.jpg', 0, 51, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (52, N'Máy tính 52', 8000, 0, N'MH_Den.jpg', 0, 52, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (53, N'Máy tính 53', 8000, 0, N'MH_Den.jpg', 0, 53, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (54, N'Máy tính 54', 8000, 0, N'MH_Den.jpg', 0, 54, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (55, N'Máy tính 55', 8000, 0, N'MH_Den.jpg', 0, 55, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (56, N'Máy tính 56', 8000, 0, N'MH_Den.jpg', 0, 56, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (57, N'Máy tính 57', 8000, 0, N'MH_Den.jpg', 0, 57, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (58, N'Máy tính 58', 8000, 0, N'MH_Den.jpg', 0, 58, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (59, N'Máy tính 59', 8000, 0, N'MH_Den.jpg', 0, 59, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (60, N'Máy tính 60', 8000, 0, N'MH_Den.jpg', 0, 60, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (61, N'Máy tính 61', 8000, 0, N'MH_Den.jpg', 0, 61, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (62, N'Máy tính 62', 8000, 0, N'MH_Den.jpg', 0, 62, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (63, N'Máy tính 63', 8000, 0, N'MH_Den.jpg', 0, 63, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (64, N'Máy tính 64', 8000, 0, N'MH_Den.jpg', 0, 64, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (65, N'Máy tính 65', 8000, 0, N'MH_Den.jpg', 0, 65, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (66, N'Máy tính 66', 8000, 0, N'MH_Den.jpg', 0, 66, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (67, N'Máy tính 67', 8000, 0, N'MH_Den.jpg', 0, 67, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (68, N'Máy tính 68', 8000, 0, N'MH_Den.jpg', 0, 68, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (69, N'Máy tính 69', 8000, 0, N'MH_Den.jpg', 0, 69, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (70, N'Máy tính 70', 8000, 0, N'MH_Den.jpg', 0, 70, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (71, N'Máy tính 71', 8000, 0, N'MH_Den.jpg', 0, 71, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (72, N'Máy tính 72', 8000, 0, N'MH_Den.jpg', 0, 72, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (73, N'Máy tính 73', 8000, 0, N'MH_Den.jpg', 0, 73, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (74, N'Máy tính 74', 8000, 0, N'MH_Den.jpg', 0, 74, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (75, N'Máy tính 75', 8000, 0, N'MH_Den.jpg', 0, 75, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (76, N'Máy tính 76', 8000, 0, N'MH_Den.jpg', 0, 76, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (77, N'Máy tính 77', 8000, 0, N'MH_Den.jpg', 0, 77, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (78, N'Máy tính 78', 8000, 0, N'MH_Den.jpg', 0, 78, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (79, N'Máy tính 79', 8000, 0, N'MH_Den.jpg', 0, 79, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (80, N'Máy tính 80', 8000, 0, N'MH_Den.jpg', 0, 80, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (81, N'Máy tính 81', 8000, 0, N'MH_Den.jpg', 0, 81, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (82, N'Máy tính 82', 8000, 0, N'MH_Den.jpg', 0, 82, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (83, N'Máy tính 83', 8000, 0, N'MH_Den.jpg', 0, 83, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (84, N'Máy tính 84', 8000, 0, N'MH_Den.jpg', 0, 84, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (85, N'Máy tính 85', 8000, 0, N'MH_Den.jpg', 0, 85, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (86, N'Máy tính 86', 8000, 0, N'MH_Den.jpg', 0, 86, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (87, N'Máy tính 87', 8000, 0, N'MH_Den.jpg', 0, 87, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (88, N'Máy tính 88', 8000, 0, N'MH_Den.jpg', 0, 88, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (89, N'Máy tính 89', 8000, 0, N'MH_Den.jpg', 0, 89, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (90, N'Máy tính 90', 8000, 0, N'MH_Den.jpg', 0, 90, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (91, N'Máy tính 91', 8000, 0, N'MH_Den.jpg', 0, 91, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (92, N'Máy tính 92', 8000, 0, N'MH_Den.jpg', 0, 92, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (93, N'Máy tính 93', 8000, 0, N'MH_Den.jpg', 0, 93, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (94, N'Máy tính 94', 8000, 0, N'MH_Den.jpg', 0, 94, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (95, N'Máy tính 95', 8000, 0, N'MH_Den.jpg', 0, 95, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (96, N'Máy tính 96', 8000, 0, N'MH_Den.jpg', 0, 96, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (97, N'Máy tính 97', 8000, 0, N'MH_Den.jpg', 0, 97, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (98, N'Máy tính 98', 8000, 0, N'MH_Den.jpg', 0, 98, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (99, N'Máy tính 99', 8000, 0, N'MH_Den.jpg', 0, 99, 0, N'MT8')
GO
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (100, N'Máy tính 100', 10000, 0, N'MH_Den.jpg', 0, 100, 0, N'MT10')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (101, N'Máy tính 101', 10000, 0, N'MH_Den.jpg', 0, 101, 0, N'MT10')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (102, N'Máy tính 102', 10000, 0, N'MH_Den.jpg', 0, 102, 0, N'MT10')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (103, N'Máy tính 103', 10000, 0, N'MH_Den.jpg', 0, 103, 0, N'MT10')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (104, N'Máy tính 104', 10000, 0, N'MH_Den.jpg', 0, 104, 0, N'MT10')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (105, N'Máy tính 105', 10000, 0, N'MH_Den.jpg', 0, 105, 0, N'MT10')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (106, N'Máy tính 106', 10000, 0, N'MH_Den.jpg', 0, 106, 0, N'MT10')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (107, N'Máy tính 107', 10000, 0, N'MH_Den.jpg', 0, 107, 0, N'MT10')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (108, N'Máy tính 108', 10000, 0, N'MH_Den.jpg', 0, 108, 0, N'MT10')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (109, N'Máy tính 109', 10000, 0, N'MH_Den.jpg', 0, 109, 0, N'MT10')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (110, N'Máy tính 110', 10000, 0, N'MH_Den.jpg', 0, 110, 0, N'MT10')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (111, N'Máy tính 111', 10000, 0, N'MH_Den.jpg', 0, 110, 0, N'MT10')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (112, N'Máy tính 112', 10000, 0, N'MH_Den.jpg', 0, 110, 0, N'MT10')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (114, N'Máy tính 113', 10000, NULL, N'MH_Den.jpg', 0, 113, 0, N'MT10')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (115, N'Máy tính 114', 7000, NULL, N'MH_Den.jpg', 0, 114, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (116, N'Máy tính 115', 8000, NULL, N'MH_Den.jpg', 0, 115, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (117, N'Máy tính 116', 7000, NULL, N'MH_Den.jpg', 0, 116, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (118, N'Máy tính 117', 8000, NULL, N'MH_Den.jpg', 0, 117, 0, N'MT8')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (119, N'Máy tính 118', 7000, NULL, N'MH_Den.jpg', 0, 118, 0, N'MT7')
INSERT [dbo].[MayTinh] ([IdMay], [TenMay], [Gia], [TrangThai], [HinhAnh], [BiHong], [Order], [Hide], [MaLoai]) VALUES (120, N'Máy tính 119', 10000, NULL, N'MH_Den.jpg', 0, 119, 0, N'MT10')
SET IDENTITY_INSERT [dbo].[MayTinh] OFF
GO
INSERT [dbo].[Menu] ([IdMenu], [Title], [Link], [Hide]) VALUES (N'MM01', N'Trang Chủ', N'trang-chu', 0)
INSERT [dbo].[Menu] ([IdMenu], [Title], [Link], [Hide]) VALUES (N'MM02', N'Máy Tính', N'may-tinh', 0)
INSERT [dbo].[Menu] ([IdMenu], [Title], [Link], [Hide]) VALUES (N'MM03', N'Đồ Ăn', N'do-an', 0)
INSERT [dbo].[Menu] ([IdMenu], [Title], [Link], [Hide]) VALUES (N'MM04', N'Thống Kê', N'thong-ke', 0)
INSERT [dbo].[Menu] ([IdMenu], [Title], [Link], [Hide]) VALUES (N'MM05', N'Đăng Ký', N'dang-ky', 0)
INSERT [dbo].[Menu] ([IdMenu], [Title], [Link], [Hide]) VALUES (N'MM06', N'Đăng Nhập', N'dang-nhap', 0)
INSERT [dbo].[Menu] ([IdMenu], [Title], [Link], [Hide]) VALUES (N'SMC05', N'Khu Máy 7', N'khu-may-7', 0)
INSERT [dbo].[Menu] ([IdMenu], [Title], [Link], [Hide]) VALUES (N'SMC06', N'Khu Máy 8', N'khu-may-8', 0)
INSERT [dbo].[Menu] ([IdMenu], [Title], [Link], [Hide]) VALUES (N'SMC07', N'Khu Máy 10', N'khu-may-10', 0)
INSERT [dbo].[Menu] ([IdMenu], [Title], [Link], [Hide]) VALUES (N'SMF01', N'Món Chính', N'mon-chinh', 0)
INSERT [dbo].[Menu] ([IdMenu], [Title], [Link], [Hide]) VALUES (N'SMF02', N'Đồ Ăn Vặt', N'do-an-vat', 0)
INSERT [dbo].[Menu] ([IdMenu], [Title], [Link], [Hide]) VALUES (N'SMF03', N'Nước Uống', N'nuoc-uong', 0)
INSERT [dbo].[Menu] ([IdMenu], [Title], [Link], [Hide]) VALUES (N'SMF04', N'Nước Pha Chế', N'nuoc-pha-che', 0)
GO
INSERT [dbo].[NguoiDung] ([SDT], [HoTen], [NgaySinh], [Email], [DiaChi], [Hide]) VALUES (N'0101010101', N'Nguyễn Văn A', NULL, N'thanhan2423@gmail.com', NULL, 0)
INSERT [dbo].[NguoiDung] ([SDT], [HoTen], [NgaySinh], [Email], [DiaChi], [Hide]) VALUES (N'0866916506', NULL, CAST(N'2003-12-14T00:00:00.000' AS DateTime), N'thanhbinh14122003@gmail.com', NULL, 0)
INSERT [dbo].[NguoiDung] ([SDT], [HoTen], [NgaySinh], [Email], [DiaChi], [Hide]) VALUES (N'111111111 ', N'Nguyễn Văn A', CAST(N'2003-12-14T00:00:00.000' AS DateTime), N'nguyenvana@gmail.com', N'TP. Hồ Chí Minh', 0)
INSERT [dbo].[NguoiDung] ([SDT], [HoTen], [NgaySinh], [Email], [DiaChi], [Hide]) VALUES (N'222222222 ', N'Nguyễn Văn B', CAST(N'2003-12-15T00:00:00.000' AS DateTime), N'nguyenvanb@gmail.com', N'TP. Hồ Chí Minh', 0)
INSERT [dbo].[NguoiDung] ([SDT], [HoTen], [NgaySinh], [Email], [DiaChi], [Hide]) VALUES (N'333333333 ', N'Nguyễn Văn C', CAST(N'2003-12-16T00:00:00.000' AS DateTime), N'nguyenvanc@gmail.com', N'TP. Hồ Chí Minh', 0)
INSERT [dbo].[NguoiDung] ([SDT], [HoTen], [NgaySinh], [Email], [DiaChi], [Hide]) VALUES (N'444444444 ', N'Nguyễn Văn D', CAST(N'2003-12-17T00:00:00.000' AS DateTime), N'nguyenvand@gmail.com', N'TP. Hồ Chí Minh', 0)
INSERT [dbo].[NguoiDung] ([SDT], [HoTen], [NgaySinh], [Email], [DiaChi], [Hide]) VALUES (N'555555555 ', N'Nguyễn Văn E', CAST(N'2003-12-18T00:00:00.000' AS DateTime), N'nguyenvane@gmail.com', N'TP. Hồ Chí Minh', 0)
INSERT [dbo].[NguoiDung] ([SDT], [HoTen], [NgaySinh], [Email], [DiaChi], [Hide]) VALUES (N'666666666 ', N'Nguyễn Văn F', CAST(N'2003-12-19T00:00:00.000' AS DateTime), N'nguyenvanf@gmail.com', N'TP. Hồ Chí Minh', 0)
INSERT [dbo].[NguoiDung] ([SDT], [HoTen], [NgaySinh], [Email], [DiaChi], [Hide]) VALUES (N'777777777 ', N'Nguyễn Văn G', CAST(N'2003-12-20T00:00:00.000' AS DateTime), N'nguyenvang@gmail.com', N'TP. Hồ Chí Minh', 0)
INSERT [dbo].[NguoiDung] ([SDT], [HoTen], [NgaySinh], [Email], [DiaChi], [Hide]) VALUES (N'888888888 ', N'Nguyễn Văn H', CAST(N'2003-12-21T00:00:00.000' AS DateTime), N'nguyenvanh@gmail.com', N'TP. Hồ Chí Minh', 0)
INSERT [dbo].[NguoiDung] ([SDT], [HoTen], [NgaySinh], [Email], [DiaChi], [Hide]) VALUES (N'999999999 ', N'Nguyễn Văn I', CAST(N'2003-12-22T00:00:00.000' AS DateTime), N'nguyenvani@gmail.com', N'TP. Hồ Chí Minh', 0)
GO
INSERT [dbo].[TaiKhoan] ([SDT], [MaVT], [MatKhau], [Hide], [SoTienTrongTK]) VALUES (N'0101010101', N'VT04', N'$2a$11$S29cpu88UX/3UcB0KI/QXu2EREhm383nXO2Ua1AWdZtols8ljFpvi', 0, 52260)
INSERT [dbo].[TaiKhoan] ([SDT], [MaVT], [MatKhau], [Hide], [SoTienTrongTK]) VALUES (N'0866916506', N'VT01', N'$2a$11$SmNSPYfV/2/ViKQAib.CBe.ymkX2Gg6vLGcLQQDjEikvOnXUIQ6uO', 0, NULL)
GO
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (1, N'TP03', N'Xúc Xích', 10000, 10, N'd1.png', 11, 1)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (2, N'TP03', N'Khoai Tây', 20000, 10, N'd2.png', 12, 1)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (3, N'TP03', N'Khoai Tay Lắc Phô Mai', 25000, 10, N'd3.png', 13, 1)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (4, N'TP03', N'Cá Viên', 15000, 10, N'd4.png', 14, 1)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (5, N'TP03', N'Bò Viên', 15000, 10, N'd5.png', 15, 1)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (6, N'TP03', N'Chả Cá Basa', 15000, 10, N'd6.png', 16, 1)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (7, N'TP03', N'Hồ Lô', 15000, 10, N'd7.png', 17, 1)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (8, N'TP03', N'Cơm Cháy', 20000, 10, N'd8.png', 18, 1)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (9, N'TP03', N'Hải Sản Sốt', 20000, 10, N'd9.png', 19, 1)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (10, N'TP03', N'Combo ăn vặt', 70000, 10, N'd10.png', 20, 1)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (11, N'TP04', N'Mì Xào Bò', 30000, 10, N'M1.png', 21, 0)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (12, N'TP04', N'Mì Xào Trứng', 25000, 10, N'M2.png', 22, 0)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (13, N'TP04', N'Mì Xào Bò Trứng', 35000, 10, N'M3.png', 23, 0)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (14, N'TP04', N'Mì Nước Trứng', 20000, 10, N'M4.png', 24, 0)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (15, N'TP04', N'Mì Nước Bò', 25000, 10, N'M5.png', 25, 0)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (16, N'TP04', N'Nui Xào Bò', 25000, 10, N'M6.png', 26, 0)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (17, N'TP04', N'Nui Xào Trứng', 20000, 10, N'M7.png', 27, 0)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (18, N'TP04', N'Cơm Chiên Đùi Gà', 30000, 10, N'M8.png', 28, 0)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (19, N'TP04', N'Cơm Chiên Dương Châu', 25000, 10, N'M9.png', 29, 0)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (20, N'TP04', N'Mì thêm/Trứng thêm/Cơm thêm', 5000, 10, N'M10,m.png', 30, 1)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (21, N'TP02', N'Trà Sữa Truyền Thống', 20000, 10, N'ts1.png', 1, 0)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (22, N'TP02', N'Trà Sữa Socolate', 20000, 10, N'ts.scl.png', 2, 0)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (23, N'TP02', N'Trà Sữa Đào', 20000, 10, N'ts.d.png', 3, 0)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (24, N'TP02', N'Sữa Chua Trân Châu', 25000, 10, N'sc.tc.png', 4, 0)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (25, N'TP02', N'Cafe đá/nóng', 15000, 10, N'cff.png', 5, 0)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (26, N'TP02', N'Cafe sữa đá/nóng', 18000, 10, N'cff ss.png', 6, 0)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (27, N'TP02', N'Bạc xỉu', 20000, 10, N'bs.png', 7, 0)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (28, N'TP02', N'Trà Chanh', 15000, 10, N'trachanh.png', 8, 0)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (29, N'TP02', N'Trà Tắc', 15000, 10, N'tratac.png', 9, 0)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (30, N'TP02', N'Trà Đào', 15000, 10, N'tradao.png', 10, 0)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (31, N'TP01', N'Sting', 15000, 10, N'sting.png', 31, 0)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (32, N'TP01', N'Bò Húc', 15000, 10, N'N2.png', 32, 0)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (33, N'TP01', N'Revive', 10000, 10, N'N3.png', 33, 0)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (34, N'TP01', N'Nuti', 10000, 10, N'N4.png', 34, 0)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (35, N'TP01', N'7Up', 15000, 10, N'N5.png', 35, 0)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (36, N'TP01', N'Fanta', 10000, 10, N'N6.png', 36, 0)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (37, N'TP01', N'Sprite', 10000, 10, N'N7.png', 37, 0)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (38, N'TP01', N'Trà Xanh 0 Độ', 10000, 10, N'N8.png', 38, 0)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (39, N'TP01', N'CoCa CoLa', 15000, 10, N'N9.png', 39, 0)
INSERT [dbo].[ThucPham] ([MaTP], [MaLoai], [TenTP], [GiaTP], [SoLuong], [HinhAnh], [Order], [Hide]) VALUES (40, N'TP01', N'Pepsi', 15000, 10, N'N10.png', 40, 0)
GO
INSERT [dbo].[VaiTro] ([MaVT], [TenVT]) VALUES (N'VT01', N'Admin')
INSERT [dbo].[VaiTro] ([MaVT], [TenVT]) VALUES (N'VT02', N'Vip')
INSERT [dbo].[VaiTro] ([MaVT], [TenVT]) VALUES (N'VT03', N'Thân Quen')
INSERT [dbo].[VaiTro] ([MaVT], [TenVT]) VALUES (N'VT04', N'Thường')
GO
ALTER TABLE [dbo].[CTHD]  WITH CHECK ADD  CONSTRAINT [FK__CTHD__MaTP__48CFD27E] FOREIGN KEY([MaTP])
REFERENCES [dbo].[ThucPham] ([MaTP])
GO
ALTER TABLE [dbo].[CTHD] CHECK CONSTRAINT [FK__CTHD__MaTP__48CFD27E]
GO
ALTER TABLE [dbo].[CTHD]  WITH CHECK ADD  CONSTRAINT [FK__CTHD__SoHD__49C3F6B7] FOREIGN KEY([SoHD])
REFERENCES [dbo].[HoaDon] ([SoHD])
GO
ALTER TABLE [dbo].[CTHD] CHECK CONSTRAINT [FK__CTHD__SoHD__49C3F6B7]
GO
ALTER TABLE [dbo].[CTTT]  WITH CHECK ADD  CONSTRAINT [FK__CTTT__IdMay__4AB81AF0] FOREIGN KEY([IdMay])
REFERENCES [dbo].[MayTinh] ([IdMay])
GO
ALTER TABLE [dbo].[CTTT] CHECK CONSTRAINT [FK__CTTT__IdMay__4AB81AF0]
GO
ALTER TABLE [dbo].[CTTT]  WITH CHECK ADD  CONSTRAINT [FK__CTTT__SDT__4BAC3F29] FOREIGN KEY([SDT])
REFERENCES [dbo].[TaiKhoan] ([SDT])
GO
ALTER TABLE [dbo].[CTTT] CHECK CONSTRAINT [FK__CTTT__SDT__4BAC3F29]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_TaiKhoan] FOREIGN KEY([SDT])
REFERENCES [dbo].[TaiKhoan] ([SDT])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_TaiKhoan]
GO
ALTER TABLE [dbo].[MayTinh]  WITH CHECK ADD  CONSTRAINT [FK_MayTinh_Loai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([MaLoai])
GO
ALTER TABLE [dbo].[MayTinh] CHECK CONSTRAINT [FK_MayTinh_Loai]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK__TaiKhoan__MaVT__4D94879B] FOREIGN KEY([MaVT])
REFERENCES [dbo].[VaiTro] ([MaVT])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK__TaiKhoan__MaVT__4D94879B]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK__TaiKhoan__SDT__4E88ABD4] FOREIGN KEY([SDT])
REFERENCES [dbo].[NguoiDung] ([SDT])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK__TaiKhoan__SDT__4E88ABD4]
GO
ALTER TABLE [dbo].[ThucPham]  WITH CHECK ADD  CONSTRAINT [FK__ThucPham__MaLoai__4F7CD00D] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([MaLoai])
GO
ALTER TABLE [dbo].[ThucPham] CHECK CONSTRAINT [FK__ThucPham__MaLoai__4F7CD00D]
GO
