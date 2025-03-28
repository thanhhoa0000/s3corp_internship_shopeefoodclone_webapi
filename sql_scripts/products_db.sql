USE [master]
GO
/****** Object:  Database [spf_products_db]    Script Date: 3/28/2025 5:00:06 PM ******/
CREATE DATABASE [spf_products_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'spf_products_db', FILENAME = N'/var/opt/mssql/data/spf_products_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'spf_products_db_log', FILENAME = N'/var/opt/mssql/data/spf_products_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [spf_products_db] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [spf_products_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [spf_products_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [spf_products_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [spf_products_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [spf_products_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [spf_products_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [spf_products_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [spf_products_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [spf_products_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [spf_products_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [spf_products_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [spf_products_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [spf_products_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [spf_products_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [spf_products_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [spf_products_db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [spf_products_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [spf_products_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [spf_products_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [spf_products_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [spf_products_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [spf_products_db] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [spf_products_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [spf_products_db] SET RECOVERY FULL 
GO
ALTER DATABASE [spf_products_db] SET  MULTI_USER 
GO
ALTER DATABASE [spf_products_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [spf_products_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [spf_products_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [spf_products_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [spf_products_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [spf_products_db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'spf_products_db', N'ON'
GO
ALTER DATABASE [spf_products_db] SET QUERY_STORE = ON
GO
ALTER DATABASE [spf_products_db] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [spf_products_db]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/28/2025 5:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuProduct]    Script Date: 3/28/2025 5:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuProduct](
	[MenusId] [uniqueidentifier] NOT NULL,
	[ProductsId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MenuProduct] PRIMARY KEY CLUSTERED 
(
	[MenusId] ASC,
	[ProductsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 3/28/2025 5:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[Id] [uniqueidentifier] NOT NULL,
	[StoreId] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[State] [tinyint] NOT NULL,
	[ConcurrencyStamp] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[LastUpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Menus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/28/2025 5:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [uniqueidentifier] NOT NULL,
	[StoreId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[AvailableStock] [int] NOT NULL,
	[BookingCount] [int] NOT NULL,
	[CoverImagePath] [nvarchar](max) NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[ConcurrencyStamp] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[LastUpdatedAt] [datetime2](7) NULL,
	[State] [tinyint] NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[RateCount] [int] NOT NULL,
	[Rating] [float] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250304045615_InitialMigration', N'8.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250321095315_AdjustProductsColumn', N'8.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250327065733_AdjustColumnsContraints', N'8.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250327083855_AddColumnDiscountForProducts', N'8.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250328023735_AddMenusTable', N'8.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250328083546_AddRatingColumnsForProducts', N'8.0.12')
GO
INSERT [dbo].[MenuProduct] ([MenusId], [ProductsId]) VALUES (N'9b2ea81a-d1b8-4079-86c0-912dc49afea9', N'332fc7da-b0be-4533-bf67-2909020ff689')
INSERT [dbo].[MenuProduct] ([MenusId], [ProductsId]) VALUES (N'dba69c53-2ffe-4d28-a883-b37eaf73553d', N'2f5dbe05-3b35-4b1f-9e37-9c46f2cb473c')
GO
INSERT [dbo].[Menus] ([Id], [StoreId], [Title], [State], [ConcurrencyStamp], [CreatedDate], [LastUpdatedAt]) VALUES (N'9b2ea81a-d1b8-4079-86c0-912dc49afea9', N'906bf960-417d-4697-9bbb-5d351e455bfe', N'Trưa nay ăn gì', 0, N'3ecf31c1-5925-4da7-ad56-a5f45f2703ec', CAST(N'2025-03-28T04:20:42.6063910' AS DateTime2), CAST(N'2025-03-28T06:55:19.3405738' AS DateTime2))
INSERT [dbo].[Menus] ([Id], [StoreId], [Title], [State], [ConcurrencyStamp], [CreatedDate], [LastUpdatedAt]) VALUES (N'dba69c53-2ffe-4d28-a883-b37eaf73553d', N'906bf960-417d-4697-9bbb-5d351e455bfe', N'Món đang giảm', 0, N'8f829d13-1ec4-4e58-8c6c-4bfd944758ec', CAST(N'2025-03-28T04:20:32.7083458' AS DateTime2), CAST(N'2025-03-28T06:48:24.0096572' AS DateTime2))
GO
INSERT [dbo].[Products] ([Id], [StoreId], [Name], [Description], [AvailableStock], [BookingCount], [CoverImagePath], [Price], [ConcurrencyStamp], [CreatedAt], [LastUpdatedAt], [State], [Discount], [RateCount], [Rating]) VALUES (N'332fc7da-b0be-4533-bf67-2909020ff689', N'906bf960-417d-4697-9bbb-5d351e455bfe', N'Combo Cơm Trưa Phi-lê Gà Quay', N'1 Cơm Phi-lê Gà Quay/Cơm Phi-lê Gà Quay Tiêu + 1 ly Pepsi (Vừa)', 0, 0, N'/stores/906bf960-417d-4697-9bbb-5d351e455bfe/products/332fc7da-b0be-4533-bf67-2909020ff689/cover-img.jpg', CAST(59000 AS Decimal(18, 0)), N'00000000-0000-0000-0000-000000000000', CAST(N'2025-03-27T08:20:21.3722984' AS DateTime2), NULL, 0, CAST(0.00 AS Decimal(18, 2)), 0, 0)
INSERT [dbo].[Products] ([Id], [StoreId], [Name], [Description], [AvailableStock], [BookingCount], [CoverImagePath], [Price], [ConcurrencyStamp], [CreatedAt], [LastUpdatedAt], [State], [Discount], [RateCount], [Rating]) VALUES (N'2f5dbe05-3b35-4b1f-9e37-9c46f2cb473c', N'906bf960-417d-4697-9bbb-5d351e455bfe', N'Combo Deal Hời 55k', N'01 miếng Gà/01 Mì Ý Gà Viên + 01 Khoai Tây Chiên (Vừa)/01 Bắp Cải Trộn (Lớn) + 01 Bánh Trứng/02 Viên Khoai Môn Kim Sa', 0, 0, N'/stores/906bf960-417d-4697-9bbb-5d351e455bfe/products/2f5dbe05-3b35-4b1f-9e37-9c46f2cb473c/cover-img.jpg', CAST(79000 AS Decimal(18, 0)), N'00000000-0000-0000-0000-000000000000', CAST(N'2025-03-27T08:40:48.8698677' AS DateTime2), CAST(N'2025-03-27T08:40:48.8698687' AS DateTime2), 0, CAST(24000.00 AS Decimal(18, 2)), 0, 0)
INSERT [dbo].[Products] ([Id], [StoreId], [Name], [Description], [AvailableStock], [BookingCount], [CoverImagePath], [Price], [ConcurrencyStamp], [CreatedAt], [LastUpdatedAt], [State], [Discount], [RateCount], [Rating]) VALUES (N'6c48ba52-7c01-4cd5-9cad-cee4f5de4a29', N'df958450-5c70-44ed-989d-448cb6cec6aa', N'producttest', N'verylongdescriptiontestforproducttest', 0, 0, NULL, CAST(20000 AS Decimal(18, 0)), N'00000000-0000-0000-0000-000000000000', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, CAST(0.00 AS Decimal(18, 2)), 0, 0)
GO
/****** Object:  Index [IX_MenuProduct_ProductsId]    Script Date: 3/28/2025 5:00:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_MenuProduct_ProductsId] ON [dbo].[MenuProduct]
(
	[ProductsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([tinyint],(0))) FOR [State]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0.0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [RateCount]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0.0000000000000000e+000)) FOR [Rating]
GO
ALTER TABLE [dbo].[MenuProduct]  WITH CHECK ADD  CONSTRAINT [FK_MenuProduct_Menus_MenusId] FOREIGN KEY([MenusId])
REFERENCES [dbo].[Menus] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MenuProduct] CHECK CONSTRAINT [FK_MenuProduct_Menus_MenusId]
GO
ALTER TABLE [dbo].[MenuProduct]  WITH CHECK ADD  CONSTRAINT [FK_MenuProduct_Products_ProductsId] FOREIGN KEY([ProductsId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MenuProduct] CHECK CONSTRAINT [FK_MenuProduct_Products_ProductsId]
GO
USE [master]
GO
ALTER DATABASE [spf_products_db] SET  READ_WRITE 
GO
