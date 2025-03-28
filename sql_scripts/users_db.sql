USE [master]
GO
/****** Object:  Database [spf_users_db]    Script Date: 3/24/2025 5:23:43 PM ******/
CREATE DATABASE [spf_users_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'spf_users_db', FILENAME = N'/var/opt/mssql/data/spf_users_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'spf_users_db_log', FILENAME = N'/var/opt/mssql/data/spf_users_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [spf_users_db] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [spf_users_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [spf_users_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [spf_users_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [spf_users_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [spf_users_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [spf_users_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [spf_users_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [spf_users_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [spf_users_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [spf_users_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [spf_users_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [spf_users_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [spf_users_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [spf_users_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [spf_users_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [spf_users_db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [spf_users_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [spf_users_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [spf_users_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [spf_users_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [spf_users_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [spf_users_db] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [spf_users_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [spf_users_db] SET RECOVERY FULL 
GO
ALTER DATABASE [spf_users_db] SET  MULTI_USER 
GO
ALTER DATABASE [spf_users_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [spf_users_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [spf_users_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [spf_users_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [spf_users_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [spf_users_db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'spf_users_db', N'ON'
GO
ALTER DATABASE [spf_users_db] SET QUERY_STORE = ON
GO
ALTER DATABASE [spf_users_db] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [spf_users_db]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/24/2025 5:23:43 PM ******/
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
/****** Object:  Table [dbo].[AppRoles]    Script Date: 3/24/2025 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppRoles](
	[Id] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Name] [nvarchar](30) NOT NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AppRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppUsers]    Script Date: 3/24/2025 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUsers](
	[Id] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](30) NULL,
	[LastName] [nvarchar](50) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AppUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 3/24/2025 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 3/24/2025 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 3/24/2025 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 3/24/2025 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 3/24/2025 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [uniqueidentifier] NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshTokens]    Script Date: 3/24/2025 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshTokens](
	[Id] [uniqueidentifier] NOT NULL,
	[AppUserId] [uniqueidentifier] NOT NULL,
	[Token] [nvarchar](200) NOT NULL,
	[ExpireTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_RefreshTokens] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250226082905_InitialMigration', N'8.0.12')
GO
INSERT [dbo].[AppRoles] ([Id], [Description], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'a7b5d50e-f703-4790-ae4c-234fc6fe6df1', N'Vendor role', N'Vendor', N'VENDOR', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[AppRoles] ([Id], [Description], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'f6fe96d6-874b-4c9e-a80e-b35d430029da', N'Administrator role', N'Admin', N'ADMIN', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[AppRoles] ([Id], [Description], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1514474e-63e4-47bc-b3b8-fd1c174b9e5f', N'Customer role', N'Customer', N'CUSTOMER', N'00000000-0000-0000-0000-000000000000')
GO
INSERT [dbo].[AppUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'Hoa', N'Nguyen', N'admin1', N'ADMIN1', N'admin1@example.com', N'ADMIN1@EXAMPLE.COM', 0, N'AQAAAAIAAYagAAAAEK/xnRgGf/u8jz+hl6ZuEs6wi+GYU9U3SxH0Sy0GbOpuBrz7fOY8pQZsRMOOeZq09w==', N'OYGFEXOBD3YIFZKVGOOKTXZIINVAGFDL', N'ea033bf5-8174-414f-98e9-b5d7d4da816b', N'023564786', 0, 0, NULL, 1, 0)
INSERT [dbo].[AppUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'John', N'Duck', N'normal1', N'NORMAL1', N'normal1@example.com', N'NORMAL1@EXAMPLE.COM', 0, N'AQAAAAIAAYagAAAAEE1QxajG59tHH2afBL3RkZ6X78wDA9BkfCH7MHgGBM3N2BV4o2EG0p2LVeB6stMCpQ==', N'GXVN2JARU4UQ2VBYEIEJ4AKSQF6XSVHJ', N'25aefcb9-9c84-4eb3-bf82-4799e9e94664', N'0236487636', 0, 0, NULL, 1, 0)
INSERT [dbo].[AppUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8c010297-879f-4a2a-8743-08dd5a40559c', N'John', N'Vend', N'vendor1', N'VENDOR1', N'vendor1@example.com', N'VENDOR1@EXAMPLE.COM', 0, N'AQAAAAIAAYagAAAAECK9xoDXQSaXYTDdxEKOJO253AXA/cQMHlJwhzb+HeGRW+tP3HqXiX0wDth9V9vETA==', N'UVKAS5WZGJKO5LSRTTCEU7WCBNR5IJI4', N'8e7a6fca-7964-4b4a-986b-dc6e3606c679', N'0256387636', 0, 0, NULL, 1, 0)
INSERT [dbo].[AppUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'42bbc47e-770b-43de-130d-08dd5ace423e', N'John', N'Wang', N'vendor2', N'VENDOR2', N'vendor2@example.com', N'VENDOR2@EXAMPLE.COM', 0, N'AQAAAAIAAYagAAAAEOsoxW+VflqH6Dg26f0anm2BC7l8Nj2zKHSzNhi3pFEUgZtLsJzyvlrqYJw+/ZZdMg==', N'O365PXPW7LAVS6OXPEI5IVS6QU5RRZZA', N'9326a220-04d1-4731-811e-cc11cfbe1e36', N'0236633636', 0, 0, NULL, 1, 0)
INSERT [dbo].[AppUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'7868c42d-cd60-45e1-6dee-08dd62cbcedf', N'John', N'Bunny', N'vendor3', N'VENDOR3', N'vendor3@example.com', N'VENDOR3@EXAMPLE.COM', 0, N'AQAAAAIAAYagAAAAELHucVIKWq1Zyyuhd9WcMrDf2f5WlHILS3ma+X2Fv/kRSvuBMTkSZbMxRFn0N9ejFQ==', N'ENXAXOM7MIJZVSXOS5VVFDXAQKS5YVGE', N'e4fa722f-0d00-438e-adc3-92d5410c6a88', N'0236636376', 0, 0, NULL, 1, 0)
INSERT [dbo].[AppUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'46e132c8-5514-4e6b-6def-08dd62cbcedf', N'Andy', N'Bunny', N'vendor4', N'VENDOR4', N'vendor4@example.com', N'VENDOR4@EXAMPLE.COM', 0, N'AQAAAAIAAYagAAAAEHrZFlQCZL2J+9uXGiiE1X7ysRoQIHFPUn2Lk/UeIrbXQqMxKV4rc54ZlUf4ZFVKEw==', N'ZVWXVLUCJJLNCXPYCU2RIQB3FE3OAQYX', N'1e0a80b1-d185-4db8-ae17-4d71148e607a', N'0236445476', 0, 0, NULL, 1, 0)
INSERT [dbo].[AppUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'eeee8fa9-32be-4ea7-3473-08dd678bcd01', N'Jim', N'Bunny', N'vendor5', N'VENDOR5', N'vendor5@example.com', N'VENDOR5@EXAMPLE.COM', 0, N'AQAAAAIAAYagAAAAEMsPN9CVNKgE1SWzuwsJsm6EPYRAZgrQ21RJoBAzIewi1NMDxLI1HYgZjD4wn0uq6Q==', N'OQXNFK7VXVQEUEB36TXUILVLZNBBZCGU', N'3c66e228-61b7-4511-9d67-7b52bf0cf7d5', N'0236445476', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8c010297-879f-4a2a-8743-08dd5a40559c', N'a7b5d50e-f703-4790-ae4c-234fc6fe6df1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'42bbc47e-770b-43de-130d-08dd5ace423e', N'a7b5d50e-f703-4790-ae4c-234fc6fe6df1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7868c42d-cd60-45e1-6dee-08dd62cbcedf', N'a7b5d50e-f703-4790-ae4c-234fc6fe6df1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'46e132c8-5514-4e6b-6def-08dd62cbcedf', N'a7b5d50e-f703-4790-ae4c-234fc6fe6df1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'eeee8fa9-32be-4ea7-3473-08dd678bcd01', N'a7b5d50e-f703-4790-ae4c-234fc6fe6df1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'f6fe96d6-874b-4c9e-a80e-b35d430029da')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'1514474e-63e4-47bc-b3b8-fd1c174b9e5f')
GO
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'a5b54ff8-6933-4552-b86a-01127683af6d', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'tm9mp19VIoH0+/MWlvFHgFK2XIcDiU+lviCCEY0cgdE=', CAST(N'2025-03-10T08:08:56.2193063' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'faa6800b-1bda-466d-b4a4-019f48ecd294', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'pwLoODiB3K0sft9SPYD4u06u4h/zuV0JjbgdqukqQV0=', CAST(N'2025-03-21T04:18:27.8725399' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'f1626380-bc68-4b19-811a-02e32d77c835', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'B55k6NOcQySPTcrFwlqr3wTUdznfs8O1Q/h3auBFpfg=', CAST(N'2025-03-11T02:46:42.5534060' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'620984dd-e736-43b5-a5af-02f9923ead99', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'QlvwNI44iLqr3BMySwZ4H4QiJJZQ3OY47k5s4nGFcIg=', CAST(N'2025-03-11T03:10:09.6978353' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'1dcf3c29-3b6b-4e93-b97e-034db733314d', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'F/bXmKyJfQq65Mxl/ZzK6ijEgI7UcK3ivFkA+xlJ2Rk=', CAST(N'2025-03-17T05:31:13.3121554' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'0470bbc7-971f-40bf-a010-060bf0ef64af', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'xu39NhrA5bM4/OsfspKhzHBOjL+seXXeQ/dP3U11PIw=', CAST(N'2025-03-13T07:01:41.0485665' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'1a793f42-2525-40ba-af8c-07077874aa8f', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'zDq7caYfiUFezGUlAurS5pdwPdqkm5OeNRdtsvSGBl8=', CAST(N'2025-03-13T07:09:39.9447635' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'da99d59d-ae36-4105-a8de-0809abc95e6e', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'cA/hiVj/S0dD3uRgTdtITd9Myo9rs6P9ggZe1pmGcws=', CAST(N'2025-03-19T08:32:21.6378308' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'e8ac0c8c-9d14-4c8c-8162-084d859efb4b', N'7868c42d-cd60-45e1-6dee-08dd62cbcedf', N'qSnfGCXp7zMWVox8EsfZFyITj/XG8pmMjc4dsMNfp4o=', CAST(N'2025-03-21T07:43:24.6487440' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'55914956-efe0-4b73-898b-086d17c7e3da', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'cSogy2TgJCEmpUKVtDkgpZlmAzCYLKhw/MaOAlOGMVE=', CAST(N'2025-03-10T05:38:58.8909819' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'b14bde65-dba8-4c6e-9eb2-08a3600793a8', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'RCqSwOmD+rqZM3JUYzjNKw8+Iz+kBA960drz0ETA4O8=', CAST(N'2025-03-11T02:42:52.3530218' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'890377d1-4870-42ca-9f05-08d1c574a318', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'JT/EQm8Z80jdNHuMCQQG+z0MQDsGcWOPj2ZkGE/V+k0=', CAST(N'2025-03-06T06:07:51.0158703' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'81d6b2ca-e911-4fae-a2b4-08ff266b967e', N'46e132c8-5514-4e6b-6def-08dd62cbcedf', N'/c6eDfHHQUphYP1f7Oq8WXg3I64lBXRkNh7KJ5OzArA=', CAST(N'2025-03-21T08:51:50.5555122' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'ddf2329a-376e-450c-8808-0a4bc1ae1215', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'POhTtzzsK7guhMmkFhvgRDZZiO96vxLaSZ45chPMuPA=', CAST(N'2025-03-20T03:19:02.6119678' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'0fcb84eb-7205-4602-94ad-0ae4d962b10c', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'dCz5EQ6qjrmPUFl/gsoroRBOjJXITwkdsfeTr7A6K8Y=', CAST(N'2025-03-21T04:36:57.6729254' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'9cb1ed1b-031e-479a-9e80-0ebc6f09f82c', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'vR7oxJaWwhKguWrjQb0ZOx8ZJVJTM4GmwbXLjUir6TA=', CAST(N'2025-03-10T06:47:38.0234548' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'b3919f11-5ad3-4db6-af49-0f1ff819b320', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'I8XZygbwPJ3A+zlchyR+Xf82pliQ0W04EXjeOPmv2Do=', CAST(N'2025-03-11T06:58:16.8874426' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'3a188f45-b2ea-4073-9936-11efc4d3f149', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'NWfov6m3gaI/24Tc7xTxFyYQVN1TdGmxGTjFYGTPw1Q=', CAST(N'2025-03-11T03:40:12.7623337' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'19aabec5-e8ae-4bbd-bcd7-12ec9ec62a8c', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'4j8T+N0TvNGXh4m1Jyghm2rc/O6F5qL2WG0PTk8Vcps=', CAST(N'2025-03-25T03:15:38.2124336' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'9bf43477-1ee3-40a3-ba6f-150776fc0f28', N'46e132c8-5514-4e6b-6def-08dd62cbcedf', N'sldbEfK3bn7COnpdGr5Yzjh2OvKEdoHpXNQ3CGHW2cM=', CAST(N'2025-03-28T09:50:44.3084879' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'3bc5bf1d-4e35-49ca-8474-15d17a473e91', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'wddDgy6AsTGauDdh/8rrIcLUw66pbojwfWlcCteXjnc=', CAST(N'2025-03-21T08:53:07.0980775' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'bbf4f054-9546-493a-b17a-17a811c1f0d8', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'uu660CwMckx6bIfPMGN36r9EdEsylL+ZZV/5ErUQRtU=', CAST(N'2025-03-11T02:40:36.3126443' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'9ac449ae-d73e-4138-a8e4-196e57d0287f', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'J1IPyMuhdFBbWJQ7AA9tu6SuAWMTJm/OSsHtmsyvbL8=', CAST(N'2025-03-06T06:11:16.4552743' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'3a1191e9-14ec-4974-98bf-1f1258041f91', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'kDk1TUusi/QaJxrVP+uvgmyJOk/NwAoJEYEqSjsuYZI=', CAST(N'2025-03-21T07:42:56.5687933' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'8ac02938-af19-4aeb-9351-1f84cf943439', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'+L97H9xTXJK4Nf0oTaVP0/qIAuNFIFVFnCyqPlYKhMY=', CAST(N'2025-03-19T07:25:45.2353755' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'95d6bcc9-9cfc-42fd-897c-2251bc5fa359', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'p8rdUwRgTt9JVQtN31WR3y4LdDeBbY60ATVu4ptllLo=', CAST(N'2025-03-20T02:57:00.8751778' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'd6c2ffc9-ebd9-4cfb-876c-239797b34129', N'7868c42d-cd60-45e1-6dee-08dd62cbcedf', N'gaAz/rtQ4y+oISnWjbih61jV7i3yoTSZ5kHODzd6Dl0=', CAST(N'2025-03-21T08:25:32.7717662' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'7bff1a1c-c665-4cab-a7e9-25276d55d310', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'TNILebxlxEcb+UMlIZEZTLic4N5MBiTMRk6G6kRv1lg=', CAST(N'2025-03-12T07:45:43.2702880' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'6cdea81f-65cc-41c0-88ad-25727118724f', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'sRQO52el2TiU/veJ9FYCUfceLl2Ka+SufhsvIE/MifE=', CAST(N'2025-03-17T06:44:41.1677015' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'433110dd-6305-4879-ae0c-26cbdc1a3b15', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'I4cVY4m1fYiYNDOTwngEwscop7gSfnpzlLTZx26qQ34=', CAST(N'2025-03-10T07:07:31.0563956' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'16ce711a-bbc5-4470-8f15-2792f02cd181', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'AIIrvB9dAgyekiqDrav+sp8SYrtuiXtBIx/cteC6KYQ=', CAST(N'2025-03-11T07:08:11.1872595' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'4cbd4128-aa5a-4548-bd95-2884943a479f', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'Mr7r+OsIHpqSTlPy9pnQAj3qv01fu1m81YjNkOnxDoE=', CAST(N'2025-03-06T04:54:41.4584712' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'4b7a9769-f46e-41e0-9d31-295cbd247390', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'mtOQDmylIYrqkomrHwKRtYhFYBNUZxBDJgC7Ckpwkk0=', CAST(N'2025-03-11T03:08:00.8115883' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'5a662510-83e4-4585-a08b-29a9fce584b4', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'WjDoVHy/p/iRl7jqwwVDFNtS6ft+xgQafdLfce5E1iI=', CAST(N'2025-03-20T03:00:24.1673749' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'255e12f3-f7af-49c7-bfc7-29bd5eda64f5', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'If9PML5vrp7VizIfuhRwhDWhx5l/f3xzODYqTdR9wN0=', CAST(N'2025-03-17T06:38:45.6382102' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'87ca9e52-4717-400b-894c-2a00c4189749', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'ZcUVV/zuEOlFHnmO9EeKQJ0RI4870e1Njv4BtLkEMx8=', CAST(N'2025-03-14T04:26:32.8948979' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'3969ed13-442e-481d-9942-2c312b0b0263', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'WtP0bqlmJKxaKoanEG3plERN/rahZ4ziXLb+mU+ytWs=', CAST(N'2025-03-20T01:54:26.7869107' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'1b37558f-7aa2-417a-905f-2d3078edd764', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'GM4QIIgMryQ+jBxIT2N8i50Y1Phd4Hk7zQAgAqhFZzA=', CAST(N'2025-03-19T07:51:18.0533778' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'e532872c-32a6-42a7-8bbf-2ddc2de2e96d', N'7868c42d-cd60-45e1-6dee-08dd62cbcedf', N'dy50IWin5pTPZoH9zn6TdpDVNRxcwGjrLls9I35JZmg=', CAST(N'2025-03-21T08:08:07.3466290' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'040df604-6527-4b16-89a8-30a05b82879a', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'U9AX2vlzmX11LlMeTD8e3bvWsvrE2qzwE+acg7Ayaag=', CAST(N'2025-03-21T06:36:15.4003916' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'96c76cf9-7aee-401b-b89f-31435073475c', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'fpNnRMfTvVPlR+Mui16HJ9WBAbXl2vWC8xDHEIuDTSg=', CAST(N'2025-03-11T02:37:03.2458847' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'7ffc83d5-e88e-4813-82b4-32debc3ab0b2', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'hM0VSlyaGHwLkiqyu6GG4Ady8KrXkxyzG4OSTlA4zQw=', CAST(N'2025-03-10T06:19:01.0648158' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'fd35978b-d7b1-4e13-90a8-332c969847e0', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'vLV+asufLqB3yu9oLmzjGDnltuQ3oUXJEoHAugs+1i0=', CAST(N'2025-03-20T07:12:52.0701106' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'9a790944-1e78-42dc-acf2-33d91a015cea', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'n1OJZWQzHX8CQyQZX7+VCe9Ak8ZDTgUNelwASlAXo+A=', CAST(N'2025-03-10T06:00:31.6155334' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'9183d574-1bf0-4987-9835-340cb906f1df', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'cTMSo/MluGV+PmFlirwNVh1aCep9L6TCtJS0CDSV7C4=', CAST(N'2025-03-10T06:48:36.1456582' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'6b5123eb-a3b7-4ac9-b989-345854566a55', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'oOtey0Ixd36Q3c1K0D7wrclKbbhlVRUiLaHDAcJMxU0=', CAST(N'2025-03-20T05:03:27.4677839' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'449cb269-e0b2-49ca-80e7-36e36da6e566', N'46e132c8-5514-4e6b-6def-08dd62cbcedf', N'OXpnP8NRF2vXyz6U9gy3GogOqpQvAMW2QJ6kboBOMcI=', CAST(N'2025-03-21T08:44:42.9926297' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'e10accd4-bd4b-4301-a3e6-3b3e2139ff9a', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'Kv9RGbioTisy9pA9Ra3mcy+sPrnDAdmfmYo6UXFIVdE=', CAST(N'2025-03-06T06:48:20.3600654' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'a94b9941-40e4-40e4-b7e8-3bab2628c28c', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'cVR0I4AJyHHR2WArQGNDuir/pTKOmRo5UR468OqcW3Q=', CAST(N'2025-03-11T02:46:19.2050184' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'a9f64441-1327-4f0f-8751-3c65e786f457', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'e6YyLA3i3rVOet83gCFuWVq5eIA5HorgAYXA7u6yj1k=', CAST(N'2025-03-20T07:26:17.3807084' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'4c158285-7d06-4ba6-af03-3dfd3c47de2f', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'JI+9XHCJ2wT7ETBoDNAeS05u5DqVznM0pqXEKI/xIF4=', CAST(N'2025-03-11T02:40:47.9425007' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'0f86c6ee-47b2-4c20-bf67-3e0a683c08cd', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'7IxJxOZVzuTcGHWnkCOdmneSIFhQkuk/nmhe895//2Y=', CAST(N'2025-03-14T06:13:31.3255600' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'2d89b5b9-2a5c-4db0-9a8f-3eedcb592d2d', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'yEtaGADLKoImpKdW5ahXh9OOn/5weS1gxaE0LESPtss=', CAST(N'2025-03-25T10:53:07.5511062' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'0ba61fd9-9b81-41fe-8769-3f637b838983', N'46e132c8-5514-4e6b-6def-08dd62cbcedf', N'7J8I947GFNz5Z7kPO8NNrg4BgKXWg0B9R2YOB6G7+bY=', CAST(N'2025-03-21T08:44:55.3652271' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'0add2b4a-9d72-4610-944a-40703a1bff1c', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'uCGNtsOPKMvq/W+dhzW1eUIw0yolVWByr+Os19apBGU=', CAST(N'2025-03-11T02:25:16.9693191' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'9eecd842-1c63-4594-a169-4070d83c46e5', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'h1IiMmLexGTDX4zHLb7UMkvDzUT93vdXHAnzdh+8HS4=', CAST(N'2025-03-12T08:25:45.6128741' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'b07d628f-b2db-40c6-ba16-411a3f66bf75', N'46e132c8-5514-4e6b-6def-08dd62cbcedf', N'MDAXkOQ/BaQZW26Qk81q29qEU0p6Ea6LKOeilJt7auE=', CAST(N'2025-03-21T08:58:27.4305224' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'9843ac3a-4851-4f0c-85c3-416c923d7681', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'Lc7IHCoP7g3Wd+4vPPWHP6clAvqbou2kY27Nw+1ydeU=', CAST(N'2025-03-11T03:09:07.5441142' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'08ca6fd9-88a9-4e54-bd97-43a02d512b9b', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'lUinF+Acp8t2RNR64bQ47RogI/PjQh5H7fmqX2YXEns=', CAST(N'2025-03-11T02:26:46.4078091' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'708e9555-3c46-4ace-ac94-4544e7c35834', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'gTMaHVXVB3YFaCsl7lecWotM2BOt9242pjs9yfyNlik=', CAST(N'2025-03-11T02:32:30.0066002' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'420f799e-d174-45f4-92d9-45823ef77427', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'SQk5ssk8w9pSgo4hbcCKwuZpnsa0hIz0BfpWHn1O71Q=', CAST(N'2025-03-10T07:34:52.3145423' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'ea80e3f7-ef00-461c-b9c7-45b2c998e92f', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'TcCPnYLv1sKQ4//CyWROoi+fhU7lbI0BkVsd9gg+vzI=', CAST(N'2025-03-14T04:27:44.8995243' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'6f79f789-f4e5-43d4-82fe-48ee4de7e34a', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'dPJY5g8Mv7ephj2C/CRdrT7AXteksDTs0Wn0N4rT9Xc=', CAST(N'2025-03-10T07:49:30.0720217' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'534df1c1-02af-4a44-a64f-4a7b1200e31e', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'z9ZTIKQqipSzXhjqASKnlPzXxInSQw/KYZDjzRFWn44=', CAST(N'2025-03-20T05:09:50.4260000' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'74753b47-e828-47db-bc07-4c8b9a6d0028', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'LGw+kPxRMKOqx2i8VP8n5sanAQ6p8K5yFxJaR+BuIso=', CAST(N'2025-03-06T06:27:44.8828875' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'd2692a96-fd84-4de3-bd97-4d35610316a3', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'BPHnop09JE99Hi/W18Q1RsA7JTWovHOPI3rX5G2aWSI=', CAST(N'2025-03-10T10:37:45.1491798' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'3bc01055-971f-4f35-8496-4e5654d32394', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'Z0o0Ly7RQqTVGNhz1Ks29+y37qdBEjxniEW1g/iPk6w=', CAST(N'2025-03-19T09:31:48.5551746' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'635d4047-9b3a-4db3-b365-4f99cb52a128', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'8oIlNqcG5g5lxd+ufCi2bTGwKh0rfGJqQ8UWwfgC8/M=', CAST(N'2025-03-17T09:03:00.1819901' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'866387ad-65b9-4849-9c62-5189962a616a', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'lms+MbsjmoLshIlHWDmxN8fdnYj/4Jl1Fft/hgXxbKA=', CAST(N'2025-03-06T05:06:11.0219937' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'bddaea02-e3fe-4fcc-aa3c-537a8a1d74e3', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'JCyleNxd1lkTuK8uTtm6/0cGWfQ6WUNSKybcQnhgMM0=', CAST(N'2025-03-10T10:57:26.1887319' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'87d1cc42-be46-4ccf-8149-5389c977741f', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'6Zbze4A7fAqfsmHAucac/8GLZAFh9yE9LgMnvFpjNfg=', CAST(N'2025-03-14T04:52:31.7980500' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'f98abec5-07ac-4b3b-8221-55681a420cef', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'UCogdtV7DGxdLpbXdiauhbdTRNznc/SJH+BdHNmLxOc=', CAST(N'2025-03-19T07:47:26.5127303' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'415ad3f7-ada2-487b-a742-55a9cd332aa5', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'KpFtrNrtvVvg/0g5Ghb30GxyghpV5Gaf2qujF+Voc0U=', CAST(N'2025-03-14T04:25:52.0779931' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'7e607576-1018-4603-9324-56ecb0f52664', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'MPJQWYgrtBoeknFmlraPFkw4XG0pZGmAryRBIlAAJH8=', CAST(N'2025-03-20T03:51:19.0950966' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'03447ed9-5467-4a89-b08b-575ae2eb78df', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'FYmSxR3mOlmFTWPRteo0UNLEHWIOQkWV2U6rPH0TBYc=', CAST(N'2025-03-17T09:09:41.8029423' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'5b72f992-8254-45a5-9803-590c14acfe9e', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'YNFZLrjEc/5JtTNhio/THYp6grmlTQPqn17xEk2Nf8U=', CAST(N'2025-03-14T06:15:04.6008149' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'5a53fe29-a7a1-4b33-a497-5989e7e92113', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'eObjXujvT2GXkdFQcO4gFcOaZXdtwHCjIlTQk5P9P2Y=', CAST(N'2025-03-06T04:59:54.2198087' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'ec8b62f7-c164-4033-a74f-59eed22f603b', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'L8W6U2uDBTnFHFL1qqAhBuAH5RqwrXAgqrA/Dc9G40k=', CAST(N'2025-03-06T02:58:47.0531154' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'fc080111-4a06-484f-8cd2-5bb75b28ccae', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'1JmUMTwG+1HBlI6uYAlG8jI4lBvr7QkagYqQbkdrclY=', CAST(N'2025-03-06T03:05:36.8955256' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'e4763abd-7e07-4d03-b3a6-5bd5a6429a00', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'whFRFpIOeVxF3lRRuZpElvdqwNqfwKEi23qMUOIMuL4=', CAST(N'2025-03-20T06:29:04.8024717' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'bb828e21-3498-49da-8b5f-5d0b02a4606f', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'ojUanckcLy9GpYj0XTIg73vkoVeD5Dm+y7ZX0/vfo/A=', CAST(N'2025-03-06T06:44:26.6268406' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'25901a34-a9b7-437b-b7ea-60d7fb0e013d', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'xy0PkjFC0Ej7GGmuexzksCvhYYiqzK/N6gLaHd+e+ko=', CAST(N'2025-03-06T05:11:33.2474340' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'af26fa6d-b786-4097-a10f-61b9cc657f34', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'nokS+pjzp2Fm0ZwjDXrJBWVxQnvbKoy34YxgwFz2oxo=', CAST(N'2025-03-06T06:32:07.6625930' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'e9cd6dbb-f1ac-4033-9f76-61e485f90efd', N'7868c42d-cd60-45e1-6dee-08dd62cbcedf', N'5JltjDI4p7nGHN+iD1GxCWZ3AxBMkIhDt34weoH9sEg=', CAST(N'2025-03-21T08:14:44.9388540' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'70c9fae4-43c7-4718-ba2a-62a4a04e429a', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'a4EiEPNjPV2s6dpX6J/1KBDt3sAt+PDdJza8NMEp0BY=', CAST(N'2025-03-06T05:25:00.6256559' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'b6327210-67df-4adc-8197-62d8e80de095', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'orK+ciI5Q/8yxpPG0yG9CP7x4Mvc2xvnAx3qK/g/Kfk=', CAST(N'2025-03-10T06:47:46.1343369' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'15ada799-1f06-4bcf-bb2d-6a02b8928c62', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'pB4yKjQ13Zh3hRjkNbgban8USC4zPsUX2KCKO9X0DxI=', CAST(N'2025-03-28T10:26:23.8351155' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'6ba109a2-c3cf-47a4-a88b-6a2a529a80b5', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'wj5OFZIQFPo/uGAmV9YNTlVEY752irEhGE2LZnG/K8g=', CAST(N'2025-03-10T06:50:22.8965376' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'20eca14a-165f-4093-ad98-6b367fdc8e1f', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'mdRxvwjGHN1nBmblMgXmhKoC7JaSoRn4VeMZnNrNXaQ=', CAST(N'2025-03-12T07:45:27.6286379' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'34ac00ff-7172-4060-9401-6c98e9b60bd2', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'Jc1qIx9tlCK7jCvHoZhA3DKTq+mnQ8fCrJD37NE/JCo=', CAST(N'2025-03-11T02:36:54.2793251' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'82297394-0023-44ed-a508-6eb2f6b78122', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'LbVOIB0o0aJmtv547uzBXx6sSA2fmb9UTLxPClqn/N8=', CAST(N'2025-03-11T03:09:39.5464169' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'68cbcd25-76d1-462f-a62c-7321bb7834be', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'Lw+J+syqibq6GiBGHiJ+Hn+W51OLdkbrAM52Vc8Mbxo=', CAST(N'2025-03-13T06:41:28.1841616' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'1a0755b9-0d4f-43dc-83af-73a98a06c6fe', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'BaynyT+mVApUMP7xfC1T2rOVGutBVSOLVRZjIIKcTsY=', CAST(N'2025-03-20T03:41:25.2364356' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'33439eb7-8a9c-4ad0-88be-74db83c9f31c', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'BmPvDZh0F4wfQuhSfSdVBq+pnWJrBn/rC/W2tdgNc04=', CAST(N'2025-03-06T05:15:55.0302319' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'7929a957-e7e2-43ee-8c9c-752e1e8bb9c2', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'ZH343vxyw5z7DCVaJ/YU+Gakxz83u41sJbu/Ym6ZGAY=', CAST(N'2025-03-20T03:01:06.2816604' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'85b403a5-61cc-44a1-a745-76f5038b8030', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'k5xzsjf9Zq86dMrojNv8BivTg9kqhj81DnIBtoyA6uA=', CAST(N'2025-03-11T02:25:59.9189880' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'66a09f2f-defd-436b-93d9-7856f5327392', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'o2tMNt0Dw4W6EWG6pPy6Gw6aGxbZiLLBifnWgFT+o+A=', CAST(N'2025-03-19T04:36:34.5789556' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'1492e7ec-1db9-4828-8bbb-78bcb6b3fe1a', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'Aq0Pqt6xiCXzeQ1hii/6ZnexjxRqBKPiWfxoWFnDT3M=', CAST(N'2025-03-11T02:59:59.7657973' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'a3cc7104-e128-4754-877d-7902c4167453', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'Ryg6XnP4hoU8iYrUaUbdacbN5CUTBMJcz3ZqfgWWP4k=', CAST(N'2025-03-19T07:57:20.7280737' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'398c44f4-54ef-4463-b1a2-7a6815c8161f', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'PTRLYDECNMaxY5CrsQ6dEicYBfo2BPVgYn6qzF1Bgc0=', CAST(N'2025-03-17T06:30:27.9297033' AS DateTime2))
GO
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'4bbc3aba-e756-48fd-a6a8-7c0af8df86b9', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'/tkd4A/P0Wet/6EcIQ17lv6Ga7kyBDuD0mnRsfLRNk0=', CAST(N'2025-03-12T10:27:05.3055189' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'8b87c427-ae23-43eb-890b-7d19dfc7259d', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'7hc5Z87Wv6outOgSiy60+BHndhE03djws4RNmRz2ZTE=', CAST(N'2025-03-21T08:44:46.3883978' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'99c07db4-c76d-40f8-9eb0-7e4d95f3343a', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'8DavsvcvPJaK6aK59Hm39ngcRG7hXI5FDTbgyuzIgBc=', CAST(N'2025-03-17T06:41:12.0862725' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'6077ff11-4fbb-4e7e-a89a-88e5706cbe90', N'46e132c8-5514-4e6b-6def-08dd62cbcedf', N'1NSQh0hIoEt7BokK5RRXMDFwcTr0wcyzqNWEviziEzs=', CAST(N'2025-03-25T04:23:08.6894017' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'9d4203a1-e202-491c-aabd-8ac0fba4b632', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'hxul29bcC56YkrdJulKF/QWujGbyj/SqaT3+4Q3M2TQ=', CAST(N'2025-03-11T02:58:24.2537076' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'7bfe1b55-dcdd-4b06-acca-8b015b7509eb', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'QQvxnplcagHujl88Q7eFS1R/qrpiGgKxlxTrFLfkXQw=', CAST(N'2025-03-21T08:57:24.8531249' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'c4eda621-c83a-4d4b-a912-8bc472112d1d', N'46e132c8-5514-4e6b-6def-08dd62cbcedf', N'FK2NfETPgK4Ye/E6epw0FslnoE3DXHK8SAa2NRqq+lo=', CAST(N'2025-03-28T10:16:56.3712325' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'008a3549-c884-4d90-9e0e-8cbc1e9ba346', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'n/xAJ8V/e6Qe5E2dhniw52nvaMxHFpIkfwdKfVr7UfA=', CAST(N'2025-03-11T03:39:09.8008987' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'de15989b-622f-4540-93f6-8e78afbc618a', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'dfscyMVBsM00FSFFq3R2c7+I8C83L///MMmt1zPsgzU=', CAST(N'2025-03-14T06:20:11.3850018' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'82c3143b-b739-47b1-9895-8ec0cec84d8d', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'B5MaLwMnKpQRlpXF8KbdxILAODlqJ5HRQmDUohAlGI8=', CAST(N'2025-03-11T03:23:06.6189426' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'408e297a-aba1-4d51-860e-8fb1ae383658', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'7OOvaBlLtaeIpwp1poPbbMmBmgeHyGoa9yREFrd5TYs=', CAST(N'2025-03-11T03:39:04.0001120' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'79d4528b-fb99-477d-9b13-918efca0ecc9', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'znvuPvsmWWxhMTnFJRgebMsC4Scuu7lDKSG5UT5Xar0=', CAST(N'2025-03-06T06:15:33.1164836' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'000263a0-9a2b-461a-828d-931aed1b3394', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'xREY00VNSGnghqeZ4p5A/kYFHY+QhJ6nISVVpdfucY0=', CAST(N'2025-03-10T06:48:41.7296915' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'7a981360-0025-4a1a-b552-94a3c042b706', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'9tnumxD1CHewY5xAoQ4RbwcbSsmfsZAR03NIqWVKIl4=', CAST(N'2025-03-14T06:17:37.4873771' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'6498fdeb-8dd8-4de8-bd36-976a3620f55c', N'46e132c8-5514-4e6b-6def-08dd62cbcedf', N'vwxoBHwcRu7+bDtL/0SFkHq+DtjzH8bnYoBCKCfSSEw=', CAST(N'2025-03-27T08:46:47.3068607' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'e4ca4fe8-2cab-4bce-848a-982fa9c55d8d', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'5NUJ8dnZbq0L9JTa3xVt0WgQiDXebJ819Oo73j1YDZc=', CAST(N'2025-03-20T04:25:50.2031761' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'6c9aeb6e-6e59-4097-8a71-98838ccb2b7d', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'F2huiTAxAvqb6na7G2VJ/0tfGQlHlOWl5J+03A2M+C4=', CAST(N'2025-03-12T10:26:21.7269523' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'cc128e41-fa1f-47bd-8ace-993ca4a13cb5', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'KwOoOobWoyRF4Emfp8b836a0IqZw2LM3PMKQVDA678g=', CAST(N'2025-03-06T04:17:21.8930148' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'29639871-848b-499d-a068-99b92b1ef6ce', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'p5fNAnaLuQ6DAt3RBxKOZhPHny5hARCBnVIypvEN+1o=', CAST(N'2025-03-10T10:37:13.0124906' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'2d7d953f-c40b-45af-8003-9a0adad6ab62', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'lF+nZdR55K56UfXR6Aifyw6uZ92t0sNG0LmeUj4xiVM=', CAST(N'2025-03-19T08:28:46.0416435' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'10e3bd7d-d1c8-4196-8010-9ad0a97b0b6b', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'aBpYDz3veDziP2sHffNaSioViU//lRyE5FWNNwjpi2I=', CAST(N'2025-03-20T04:16:13.3263011' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'8479d44c-e335-4727-b927-9e70c3a434f0', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'1UueNlvjCQwEDknph1nr0s6Qs0S4MklWYI3inqzgbS8=', CAST(N'2025-03-11T07:03:33.6877394' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'b340db31-bb02-482c-9d12-9f9288044434', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'te/Fs/aoicx6WyRpZw3iNmByNVqPP08IVKxu8KgtIw8=', CAST(N'2025-03-17T04:36:55.7035051' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'78424d1d-dc33-4664-8fb8-9febe42b59b3', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'gUocBil6qz92DaLgyKOA7gnydl46ndRG0rKbbvE8cdA=', CAST(N'2025-03-21T08:34:03.7956303' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'9fe75472-8fc3-44b8-bdc3-a290b1c18f64', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'0Yd8FvhB7uzHgXhNbjxgi36OB54Jwddnp9EBAVQ8unQ=', CAST(N'2025-03-11T03:30:45.6268873' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'004f2f68-1958-41c1-96e8-a3edb319bcab', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'nWwjNZtZzpoRqRdWoJ39ogMN2AuFx+se1WyMsjMeSDU=', CAST(N'2025-03-14T04:33:14.9973323' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'438197ed-3552-4126-a194-a41041261c10', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'ewLBXANYwjHTMnzLbKguM9jSMcttnTJ0WE+aeW4hrsA=', CAST(N'2025-03-10T10:47:12.1277055' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'a8a9431f-e823-46a5-bef1-a6b2efce92c1', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'73BTjo6/Ld20w5itHd4uh1OK4Zu78zcRKPSsvTwsjrA=', CAST(N'2025-03-11T07:04:49.5260926' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'e992437d-d9f2-41bd-9698-a7cf872be414', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'0p8SvAsMsKoRW6rxNC52mjQhySt4TQNsNQ1ItWcDSOw=', CAST(N'2025-03-19T09:40:30.0536358' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'a5a3aad2-ac0f-4d3a-b44a-abee9040f444', N'46e132c8-5514-4e6b-6def-08dd62cbcedf', N'Cc24uUHk1ksVUHQ+JE50qaO73Bnctw+Tuclgv1eJJ64=', CAST(N'2025-03-28T10:26:53.0128364' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'9ca5f9aa-7388-4778-ad55-acb439afcf24', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'W8l7d4JGVkJSx/NahOcJ683waccn9BGbeh6HjC4nKDU=', CAST(N'2025-03-20T06:56:52.8793210' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'8571811c-3361-42f0-8dee-ad7cac301549', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'siYiHFKPDUaWT/M/XmJUWo+mtNWhvmV/IsW9CTY8iOU=', CAST(N'2025-03-06T06:51:05.3507441' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'2ae78d60-db4b-4727-aea9-adbcbf86d34e', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'COpKce1ctpDwCfhwIEyAvqNYx0pAUCPPyppgiMZkPZI=', CAST(N'2025-03-10T08:00:37.9246110' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'c79ea2f0-f365-4fdb-98ea-aea2a92d77a3', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'fzSNdeKMVpuPSh0BB+0CzH8Gzpx3+wLVw96QZ4oNubY=', CAST(N'2025-03-17T05:25:03.1754685' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'b737619a-c65d-482d-9f6a-b0bbb64b814d', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'H+pitgi0jmHrXxmy8h44lxkFs4TCdHp2aWsXwOBfFfY=', CAST(N'2025-03-11T03:40:18.4080280' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'1a0b57cc-b941-46c8-ac53-b0fd23286114', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'zQskQcnGB3tsBpdPcni2u9Vp08v3a2ffmOlujXOf9wI=', CAST(N'2025-03-19T01:54:00.9978346' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'89a3ec0c-e817-46df-a0c7-b3072447bc5c', N'46e132c8-5514-4e6b-6def-08dd62cbcedf', N'osghw3UOksveGrV/GriaCyoGGsBnbaGjVdO5faBix0k=', CAST(N'2025-03-25T02:19:17.3966668' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'38098546-4ac4-408a-8d84-b33d6c7217ab', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'kRR5ZXSe33MoONGFSLG78SQrUPQLf3eltSRVn3r5EqY=', CAST(N'2025-03-11T02:26:13.8970994' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'022a1fba-12f4-4e83-8a3e-b4c92b683444', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'r6COfy/j1DTBklV4WeWQESYlwcTcDjdpGa2a8EFGuu8=', CAST(N'2025-03-11T03:04:38.6843019' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'c151823c-fcb5-4dd1-9e64-b543d8981f94', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'APdIWslyatpYzjUCo8UtadNsr3I+3f0JB2N9cXU6eGo=', CAST(N'2025-03-10T06:44:52.4167171' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'18891298-aeae-47a4-b846-b7f236cf7d33', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'chxPygDHyc+O6DbCUoVjadPAJNdbY4xiJgfSio+wFcc=', CAST(N'2025-03-11T06:58:11.1209736' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'faedd2a1-727a-42c9-8e1c-b8d42da48c73', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'01JtmusfVZI26hoiruAePikZkuXHqhZnVPABMe3x7co=', CAST(N'2025-03-10T10:38:46.2918655' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'88111c54-6c4a-48bf-9161-be0f7e3fdc7c', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'JXukm/N2WAHZOwo/caPz52vHLcBQYQdYuQuVyDNlAOY=', CAST(N'2025-03-14T04:35:07.9371652' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'6905d13b-3cdf-4338-a4a3-c14481153d65', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'UygCnk6TaBtmZm6cGS/T+Ohq9yiYIDjtAZZyjnC1ql4=', CAST(N'2025-03-17T05:20:39.1120144' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'10c10693-046c-4024-9657-c17dbe8e372b', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'QHWLPSk/2UGrEExwFBSOxxcaXBSfRQDp890RUbFZ3xc=', CAST(N'2025-03-20T04:03:35.7067895' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'89233f4b-a686-469d-a206-c1bd75806e42', N'42bbc47e-770b-43de-130d-08dd5ace423e', N'3ZqFlo2+wKF5KPjVzZR7L0iRVfNWw4oxHpbpvQma3O0=', CAST(N'2025-03-11T03:40:49.3593248' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'1a924302-c94f-42ca-80d9-c27324d1c096', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'CmFeJ87o6kijLbsMXdvpq6DrR9nCfLeDCyT4BlNkeIk=', CAST(N'2025-03-11T02:43:03.3676520' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'b0767a6c-accd-40d2-91ef-c28230b64f94', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'npB/qXwS5It7plu0VKdDJvpsJgy+2fz+D9XXxWa1/0U=', CAST(N'2025-03-19T07:45:21.6249695' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'af441977-558c-4b70-808a-c3e1c43f5f0d', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'rYcqhItze4ctdbL57Mwj8iWuOj7fU/tzWS1/1kq4DMA=', CAST(N'2025-03-10T10:47:59.4970297' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'c87b98b8-b6cd-4918-85c9-c474ee80f389', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'KT3xaO00hzOfR5UVqscT+DNj5/GLp3RtTodGkQEXzjE=', CAST(N'2025-03-12T10:27:24.7242522' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'7c6c049f-59a3-4de8-a253-c4e5f1f0156c', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'x/sykU+AGYHeYhut6s/t2j1r1QGx7ssTK5Z9VtZo/Fo=', CAST(N'2025-03-11T02:46:26.5760051' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'73d95581-b403-49cf-a399-c57a9fc7e667', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'wjk4pHzIMSSBLj9zjAcEpkL6TKvrAaNcLQv80ln14WI=', CAST(N'2025-03-11T02:24:02.5399955' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'c2dba21a-1f41-49f9-b08f-c6b2b8d634ed', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'Rnh6v4JuAzKZTKbQ+SAsf3ZWoUwnCfhQKzje/6Ehh0g=', CAST(N'2025-03-17T06:33:59.0168089' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'c1312bf3-7066-4935-a1bb-c6ef81db7179', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'+TYPUbij8+RsdQutiE6Ss79DYpvSSJe2xRbZR49IuVk=', CAST(N'2025-03-06T06:30:08.8836580' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'b7c2c5d2-8957-4e3a-b7c2-c7324c67dfa0', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'1j83T027Os5l7Db6cOWAi/9bCF7UqzLA3qNGeVeFduI=', CAST(N'2025-03-20T07:19:09.7310530' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'016841de-2b11-4afe-ba7b-ca1d4885a4fb', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'ebSQKiTQXcDQUUHw+vdER09Ykjy6ldhWVPEhboun3UU=', CAST(N'2025-03-20T06:44:28.6043555' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'086d965d-b759-45c0-9dd8-ca9c9e134fbc', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'lPXGjZ2ep5D6w6azJZU54sBmt7ImIcng0S8xJsH1PIw=', CAST(N'2025-03-06T10:23:58.0552049' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'1b482a4a-977c-4253-8726-cbfa0e0b1898', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'c8dpzI9duRJtP1e301RVHLpR4f8ERBJ9hv/6MBzQp4w=', CAST(N'2025-03-17T05:15:30.4933108' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'6d79ad99-8559-43dd-ac5e-ccfa9e1962fc', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'U+Z2bd5SAsG77YzE1+oE2s3YSI91E9f+1ZT9uOA4ftE=', CAST(N'2025-03-10T07:45:51.4387527' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'b04bee8d-be06-4420-b9b5-cf5e6605bae4', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'uc24i2VX1NbKt+XB4vwdo6f3nPHdnHCF68En7aWlBUs=', CAST(N'2025-03-17T06:22:46.2679915' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'dbd92c4c-19fc-4b4a-b203-d0d05aeceb15', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'hShpG3nD1wtciOrt+fvE4mxfvsKkQNjVL/6DCgHXVP4=', CAST(N'2025-03-20T07:06:14.4367559' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'd546a586-13de-4dee-a240-d1221e728b47', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'nBmj9qzc++jCSVoQU/V3sAvcsIXEFO8WNt5CZnFtNjo=', CAST(N'2025-03-20T06:19:31.2141521' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'01bf8cd1-35a7-4ab3-9e72-d1fbcf97200b', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'lxxIVBtIhPfeVc+0k/NjBXCjjMJsmtJLyPJ1osDj3Rk=', CAST(N'2025-03-11T02:26:54.9915891' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'96b778a3-f34d-49b2-a33f-d2bf0c30aab0', N'46e132c8-5514-4e6b-6def-08dd62cbcedf', N'W2BG5C7dxa/01g97lpZUMvIu0+MOxEpCzbq8IGy989o=', CAST(N'2025-03-21T08:54:39.4159786' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'0bd29fdb-d3e8-4695-83a9-d41745a5e07b', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'dh5vNvSfNj11OBOeDl8xXajBbXd3yWskQt6Pjq2SATc=', CAST(N'2025-03-11T03:08:55.9182762' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'508a7693-2326-4744-9cbd-d4253122b215', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'uf4gNLOnZx1JaBhYzRM4pBWoZng9CWzNHOQT770sfg0=', CAST(N'2025-03-19T07:47:19.7112068' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'7ff7152d-2514-46e5-97ce-d44d3542e10c', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'g4FkF2ibIua+k576mq2WF6nwq9yUz361xReVZfEbsrk=', CAST(N'2025-03-06T06:29:26.1499386' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'1f9b094b-c059-4058-8ad8-d49fe8753eeb', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'+dHBwx9nPMwHQyEp9m3QBqbBFSx6hht3cCrpSTRjO68=', CAST(N'2025-03-27T08:49:16.3241993' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'5e617081-9902-496a-8abe-d4abcabdc8af', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'QnwpN9JCpIP31j3Q9f1sOfNwHEk+7Lnmh/Kzl1hiuCI=', CAST(N'2025-03-12T08:26:16.4697663' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'90feff5d-12a3-427e-999a-d5078558cb47', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'rq3FwQl+cDJ0syDYagotUsmuj95ddZeD1dwLNRclFPQ=', CAST(N'2025-03-19T07:20:00.1090322' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'b572abbc-5c32-4f84-b214-d5a5073eed5a', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'8MKLxdTfJR3BpC33yh7v/VlQf1NDPMSjgdq1Q2dImbM=', CAST(N'2025-03-21T03:39:50.2890441' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'be06b0a6-450c-4078-ad97-d72621db427e', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'nC+N7une2fDzbE+BEkeLOqoJFw4pReqC5NNu48MAovM=', CAST(N'2025-03-10T08:06:49.5405957' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'28f21d3c-ca9f-4f9b-8a5e-d7572f27604b', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'1Q4/Cg0ywcTQwbYEXA6R1DTi91wTFrBDsIo563j4/9w=', CAST(N'2025-03-21T06:26:28.7628235' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'3024f283-736b-4b59-a0f3-d8ed7ea06ee2', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'AmfEnYanwZvnQF2Y5dDNF+a5s2fVZYCgweO+8vbRo5E=', CAST(N'2025-03-11T07:08:18.4322097' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'ad267a02-9c09-4ddf-bdf1-d903eef719d0', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'U2RdLHh3A3fv5t0SQGffIE3NWNSscu/j/nQ1PYBLpHk=', CAST(N'2025-03-11T02:23:35.9522114' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'4d2cb4a9-80db-4bdc-9156-d9cf0c469a69', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'uQ1q99iacidbEdWCoEeOJ3OitIPxg3+uqAxBdXOI7y0=', CAST(N'2025-03-17T05:28:26.4384279' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'801ac126-3ed9-4495-91be-dc91073b47a0', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'P5dN7Zxxo9oxsBuwHtP8Tcs9WCOXt1v5A/rKkxlgx+o=', CAST(N'2025-03-10T10:41:07.3187473' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'17badf2a-16d6-4ddd-b3a3-dd674602c286', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'TkvoxcymqoMZRuGVT0KfMF//W8pZxuTq17qjRs1I6nk=', CAST(N'2025-03-06T06:50:47.9677872' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'e618aa84-73c0-4cf9-9dcf-de03a7493ebc', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'4ylUrgsomv/Xu+8et/AFrrO+j7P2ycGq5Uvaptzz4Z0=', CAST(N'2025-03-21T08:35:54.5604736' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'2efa5302-54cd-4fcb-a83e-dfda2752aa4a', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'I9ifMbk/XO2ekloDvjosXh907HXAsByOCqtQABn0FE4=', CAST(N'2025-03-19T04:35:58.0462585' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'92202ff3-7cd9-4797-82d9-e1365ab1e0c6', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'uufQefmASmcNMHVWszNR8aok+DDSoeOiTfMRLU3HHXo=', CAST(N'2025-03-10T07:52:50.5949903' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'c31d2140-92aa-4e90-b5b2-e1b378c8411e', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'Me5zczbdfExlyvThTl0u0eMCiDo9Otq/gG5yYLUDIJM=', CAST(N'2025-03-12T08:26:07.7165292' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'0777fa10-92d5-4055-b5b7-e2f88b2e9dc0', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'pw595Ysn6gR/+EsOm8kZyvYyYyNqH+6LOopyVAaPW2k=', CAST(N'2025-03-11T02:43:33.8661205' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'351156f9-425e-4f29-abdd-e42c7ed976c3', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'XunqFuaKXE6QQXv4dTunZkwsQUZBFi8tJdZdNp6oac0=', CAST(N'2025-03-10T10:46:45.7150785' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'f92fb6cc-30ec-439b-9d92-e480f4503fd8', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'ICEXfA3CBmwITfM8AI8M2pN1p2kvhJpu8rno++QtYTk=', CAST(N'2025-03-20T04:59:46.7611321' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'84a85625-9288-4915-b163-e69c700ced5e', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'QiQcIP26e8e9PXL+93U0puQIQiyLMRqbFG71ENwmwxo=', CAST(N'2025-03-10T06:48:39.7745308' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'dd9ae913-ff70-490b-aeec-e738e04a62e5', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'JhtlH8N3J4H4KrK9Jq6Rr/0aGJubxyLw1701ZBzw1us=', CAST(N'2025-03-27T08:47:15.1770414' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'6446e816-3bfc-4166-a4cd-e976f2d2473f', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'dx5QmXAfx7A4y0eb2jyM3HD3Wi7RDksWllw3szsj2Aw=', CAST(N'2025-03-20T07:32:47.8475160' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'dbb2b859-b61d-4f82-9e7e-e9a4ebc94960', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'+4v3Ol1mTBBjuwGd7tvliNt6tY46sD5pHuOlRSgJ6vg=', CAST(N'2025-03-21T08:42:16.1452788' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'1eb3a8e3-f0e0-4a22-aeaa-e9fe018199d9', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'yd/4KDH9EkNju11+sX8dtGSel2yLIpss9pyaWEhPMMI=', CAST(N'2025-03-10T06:48:37.6838474' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'300b7608-3e85-43d0-bd9b-ead9f69f3e9e', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'DpZHAfASC/KYfXjdEUXmJqkWJOrN74gL462uzmah2SI=', CAST(N'2025-03-20T06:37:04.0004487' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'a9ca7676-5eb8-47b0-ac92-eb4b1036f5d5', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'aHZJ2XZYO6olSdSG/onXdzT1Z2ZNgrY4MOblArq9Zwc=', CAST(N'2025-03-11T02:22:59.8928261' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'1a27e44b-7c56-494a-af9e-ec38454a75bc', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'gu+CNizT8vytJ7W3GnI1bfYc0BtUPOBigNrUaLBWr38=', CAST(N'2025-03-27T08:46:39.3428355' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'a659edc7-96fa-4f81-8001-ec42ce03e609', N'8c010297-879f-4a2a-8743-08dd5a40559c', N't0nagBMKNYNTNzDQQM0+w+aEtyj4MyfFUZZXgSGep1o=', CAST(N'2025-03-13T07:20:42.2617814' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'b6b9d0fc-09ae-4d29-8e1f-ecab5b26c9cb', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'dMiO7XFmDp244pIpzgcxOMYSYVe3MPaZu0jElGBJr6A=', CAST(N'2025-03-11T06:58:39.5726613' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'8b7cc14b-1d16-4d46-8de9-f18df868964d', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'koS7X41oUu3/JUBUrkolg/2dlUeNsqgKgN0cHG9OvuY=', CAST(N'2025-03-11T03:39:13.1858763' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'f81f1df3-c744-46ed-a236-f1db35ebe291', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'R4p9gK5zKjQHm5+Bz7hByyyBeMvkunz61WUoDmvbGBU=', CAST(N'2025-03-10T08:05:29.2071260' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'302b8444-76b0-46c9-ace4-f23cd15a4f0e', N'7868c42d-cd60-45e1-6dee-08dd62cbcedf', N'dJzgnk6MK8idjdMT91sUjYmfoJ0e7uplRWUOlnKyhF4=', CAST(N'2025-03-21T08:35:49.7790286' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'0fb4b83a-9b4e-4afc-84bd-f4197789167e', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'+OE+DzxuBvvXwAkSSbA3db5gWNPv669SccG34FXYbsk=', CAST(N'2025-03-10T07:03:21.9876551' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'8d3c7f22-600e-40d5-b5ef-f5e8b0e07390', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'jn6KVVg1O7zc5nmSODeAm0qoIiQFoMgOetckHW5X7YQ=', CAST(N'2025-03-13T06:41:22.2040009' AS DateTime2))
GO
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'584797f8-c99b-4f27-97a0-f5ff7dea53d5', N'46e132c8-5514-4e6b-6def-08dd62cbcedf', N'qEemnT6D4Vwj3ifeXnqHppBOsprTKVk1nGiz06pVpTE=', CAST(N'2025-03-28T03:47:38.4291400' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'3921688a-1343-4938-8784-f7b193219792', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'6VMXfgQf49MI0wS5PIesHuNL4/yiVoleqCLGe1kxGvY=', CAST(N'2025-03-11T02:23:34.0355101' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'b26f815c-e87d-45b9-bdbf-f839048fb2e5', N'8c010297-879f-4a2a-8743-08dd5a40559c', N'+RRFsbKz0gXgNYg1dJvDfZjLiMMsy7AVIL6T6CF/gSo=', CAST(N'2025-03-11T03:00:15.4516831' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'a407d7d3-691b-49f2-8bb8-fa62db47a916', N'8f499674-b6db-4f0b-d3a9-08dd56daa1a7', N'QgqJJ0Z97U1jEepu+JrP5QnVDsa8twjfDJX/vjcXIhs=', CAST(N'2025-03-06T05:19:00.8590025' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'2361ce6a-4a38-4cce-9bcc-fca29e8c864b', N'62b3d6ba-b064-446e-5063-08dd56ef0d0e', N'G6d6ZbRCfcBxQ6FQ96cwMGd3k0CfNMR0onfTfyk2kvw=', CAST(N'2025-03-10T10:48:08.4723508' AS DateTime2))
INSERT [dbo].[RefreshTokens] ([Id], [AppUserId], [Token], [ExpireTime]) VALUES (N'a247356b-ba18-446c-b171-ffd93fc20f59', N'46e132c8-5514-4e6b-6def-08dd62cbcedf', N'2tI9PHwkPIsJ8UmuTpq7w/N/Xvt9xc1YNzsKKbUCuJw=', CAST(N'2025-03-28T03:47:46.7358513' AS DateTime2))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AppRoles_Name]    Script Date: 3/24/2025 5:23:43 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AppRoles_Name] ON [dbo].[AppRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 3/24/2025 5:23:43 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AppRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 3/24/2025 5:23:43 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AppUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 3/24/2025 5:23:43 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AppUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 3/24/2025 5:23:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 3/24/2025 5:23:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 3/24/2025 5:23:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 3/24/2025 5:23:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RefreshTokens_AppUserId]    Script Date: 3/24/2025 5:23:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_RefreshTokens_AppUserId] ON [dbo].[RefreshTokens]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RefreshTokens_Token]    Script Date: 3/24/2025 5:23:43 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RefreshTokens_Token] ON [dbo].[RefreshTokens]
(
	[Token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AppRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AppRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AppRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AppUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AppUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AppUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AppUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AppUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AppUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AppRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AppRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AppRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AppUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AppUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AppUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AppUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AppUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AppUsers_UserId]
GO
ALTER TABLE [dbo].[RefreshTokens]  WITH CHECK ADD  CONSTRAINT [FK_RefreshTokens_AppUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RefreshTokens] CHECK CONSTRAINT [FK_RefreshTokens_AppUsers_AppUserId]
GO
USE [master]
GO
ALTER DATABASE [spf_users_db] SET  READ_WRITE 
GO
