USE [master]
GO
/****** Object:  Database [MRLanguageSchool]    Script Date: 19.03.2025 12:53:52 ******/
CREATE DATABASE [MRLanguageSchool]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LanguageTR14WR', FILENAME = N'D:\Language_School\DataBase\LanguageTR14WR.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LanguageTR14WR_log', FILENAME = N'D:\Language_School\DataBase\LanguageTR14WR_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MRLanguageSchool] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MRLanguageSchool].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MRLanguageSchool] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MRLanguageSchool] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MRLanguageSchool] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MRLanguageSchool] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MRLanguageSchool] SET ARITHABORT OFF 
GO
ALTER DATABASE [MRLanguageSchool] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MRLanguageSchool] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MRLanguageSchool] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MRLanguageSchool] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MRLanguageSchool] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MRLanguageSchool] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MRLanguageSchool] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MRLanguageSchool] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MRLanguageSchool] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MRLanguageSchool] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MRLanguageSchool] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MRLanguageSchool] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MRLanguageSchool] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MRLanguageSchool] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MRLanguageSchool] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MRLanguageSchool] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MRLanguageSchool] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MRLanguageSchool] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MRLanguageSchool] SET  MULTI_USER 
GO
ALTER DATABASE [MRLanguageSchool] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MRLanguageSchool] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MRLanguageSchool] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MRLanguageSchool] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MRLanguageSchool] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MRLanguageSchool] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MRLanguageSchool] SET QUERY_STORE = ON
GO
ALTER DATABASE [MRLanguageSchool] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MRLanguageSchool]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 19.03.2025 12:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[MainProductID] ASC,
	[AttachedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 19.03.2025 12:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
	[Birthday] [date] NULL,
	[Email] [nvarchar](255) NULL,
	[RegistrationDate] [date] NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 19.03.2025 12:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[ClientID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 19.03.2025 12:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 19.03.2025 12:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 19.03.2025 12:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19.03.2025 12:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 19.03.2025 12:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 19.03.2025 12:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 19.03.2025 12:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[DurationInSeconds] [nvarchar](50) NOT NULL,
	[Cost] [decimal](18, 2) NOT NULL,
	[Discount] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 19.03.2025 12:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 19.03.2025 12:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 19.03.2025 12:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (1, N'Голубев', N'Иосиф', N'Тимофеевич', N'м', N'7(78)972-73-11 ', N'img\m18.jpg', CAST(N'1982-05-06' AS Date), N'smcnabb@att.net', CAST(N'2018-08-18' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (2, N'Ермакова', N'Алла', N'Мироновна', N'ж', N'7(06)437-13-73 ', N'img\48.jpg', CAST(N'1976-01-22' AS Date), N'whimsy@aol.com', CAST(N'2017-02-09' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (3, N'Селиверстов', N'Глеб', N'Максимович', N'м', N'7(20)554-28-68 ', N'img\m37.jpg', CAST(N'1999-06-20' AS Date), N'jigsaw@sbcglobal.net', CAST(N'2016-01-07' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (4, N'Агафонов', N'Юстиниан', N'Олегович', N'м', N'7(303)810-28-78 ', N'img\m1.jpg', CAST(N'1997-02-02' AS Date), N'staffelb@sbcglobal.net', CAST(N'2016-06-08' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (5, N'Колобова', N'Злата', N'Романовна', N'ж', N'7(50)884-07-35 ', N'img\18.jpg', CAST(N'1994-08-25' AS Date), N'sinkou@aol.com', CAST(N'2016-12-03' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (6, N'Сысоева', N'Дарина', N'Ярославовна', N'ж', N'7(0698)387-96-04 ', N'img\32.jpg', CAST(N'1982-02-03' AS Date), N'treit@verizon.net', CAST(N'2016-05-13' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (7, N'Некрасов', N'Варлам', N'Михайлович', N'м', N'7(019)258-06-35 ', N'img\m42.jpg', CAST(N'2000-11-12' AS Date), N'dogdude@verizon.net', CAST(N'2017-12-03' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (8, N'Крюков', N'Наум', N'Ильяович', N'м', N'7(81)657-88-92 ', N'img\m30.jpg', CAST(N'1993-11-17' AS Date), N'floxy@hotmail.com', CAST(N'2017-02-01' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (9, N'Сидорова', N'Татьяна', N'Михайловна', N'ж', N'7(51)732-91-79 ', N'img\42.jpg', CAST(N'1974-04-24' AS Date), N'tbeck@mac.com', CAST(N'2018-10-03' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (10, N'Трофимова', N'Альжбета', N'Якововна', N'ж', N'7(1084)658-92-95 ', N'img\25.jpg', CAST(N'1988-10-22' AS Date), N'gbacon@mac.com', CAST(N'2017-09-21' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (11, N'Новиков', N'Адриан', N'Аркадьевич', N'м', N'7(70)572-33-62 ', N'img\m40.jpg', CAST(N'1974-01-15' AS Date), N'multiplx@verizon.net', CAST(N'2018-11-23' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (12, N'Мишина', N'Иветта', N'Андреевна', N'ж', N'7(3926)244-81-96 ', N'img\30.jpg', CAST(N'2002-10-05' AS Date), N'aukjan@yahoo.com', CAST(N'2016-01-24' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (13, N'Шестаков', N'Геннадий', N'Рубенович', N'м', N'7(2066)037-11-60 ', N'img\m41.jpg', CAST(N'2001-07-01' AS Date), N'tokuhirom@live.com', CAST(N'2018-12-08' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (14, N'Зуев', N'Матвей', N'Иванович', N'м', N'7(5383)893-04-66 ', N'img\m38.jpg', CAST(N'1981-03-28' AS Date), N'brickbat@verizon.net', CAST(N'2018-12-18' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (15, N'Турова', N'Георгина', N'Семёновна', N'ж', N'7(555)321-42-99 ', N'img\27.jpg', CAST(N'1974-05-28' AS Date), N'yruan@optonline.net', CAST(N'2018-02-22' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (16, N'Анисимов', N'Валентин', N'Пантелеймонович', N'м', N'7(700)326-70-24 ', N'img\m99.jpg', CAST(N'2000-12-10' AS Date), N'aaribaud@hotmail.com', CAST(N'2018-01-20' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (17, N'Анисимова', N'Тамара', N'Витальевна', N'ж', N'7(66)128-04-10 ', N'img\2.jpg', CAST(N'1988-06-16' AS Date), N'schwaang@mac.com', CAST(N'2016-02-25' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (18, N'Колобов', N'Орест', N'Юлианович', N'м', N'7(1680)508-58-26 ', N'img\m27.jpg', CAST(N'2001-07-14' AS Date), N'parkes@verizon.net', CAST(N'2017-01-01' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (19, N'Филатов', N'Аристарх', N'Дмитриевич', N'м', N'7(696)235-29-24 ', N'img\m43.jpg', CAST(N'1989-05-29' AS Date), N'hampton@att.net', CAST(N'2017-01-11' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (20, N'Орлова', N'Влада', N'Мартыновна', N'ж', N'7(2506)433-38-35 ', N'img\22.jpg', CAST(N'1990-06-26' AS Date), N'rnelson@yahoo.ca', CAST(N'2016-03-21' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (21, N'Алексеева', N'Элина', N'Матвеевна', N'ж', N'7(8086)245-64-81 ', N'img\1.jpg', CAST(N'2002-05-07' AS Date), N'pthomsen@verizon.net', CAST(N'2018-03-28' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (22, N'Бобров', N'Агафон', N'Лаврентьевич', N'м', N'7(2159)507-39-57 ', N'img\m35.jpg', CAST(N'1995-07-29' AS Date), N'petersen@comcast.net', CAST(N'2017-05-09' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (23, N'Бирюкова', N'Инара', N'Улебовна', N'ж', N'7(098)346-50-58 ', N'img\5.jpg', CAST(N'1978-07-21' AS Date), N'smpeters@hotmail.com', CAST(N'2017-10-01' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (24, N'Панфилов', N'Марк', N'Рудольфович', N'м', N'7(764)282-55-22 ', N'img\m45.jpg', CAST(N'1991-04-13' AS Date), N'cremonini@optonline.net', CAST(N'2016-02-23' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (25, N'Колесникова', N'Алина', N'Еремеевна', N'ж', N'7(74)977-39-71 ', N'img\40.jpg', CAST(N'2001-04-19' AS Date), N'gfxguy@outlook.com', CAST(N'2017-01-18' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (26, N'Морозов', N'Наум', N'Валерьянович', N'м', N'7(636)050-96-13 ', N'img\m49.jpg', CAST(N'1985-07-04' AS Date), N'salesgeek@mac.com', CAST(N'2016-05-02' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (27, N'Горбачёв', N'Давид', N'Тимурович', N'м', N'7(53)602-85-41 ', N'img\m36.jpg', CAST(N'1983-05-22' AS Date), N'hedwig@att.net', CAST(N'2018-12-17' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (28, N'Васильев', N'Оскар', N'Богданович', N'м', N'7(585)801-94-29 ', N'img\m15.jpg', CAST(N'1971-01-30' AS Date), N'miturria@verizon.net', CAST(N'2017-05-28' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (29, N'Ершова', N'Номи', N'Андреевна', N'ж', N'7(7757)315-90-99 ', N'img\14.jpg', CAST(N'2001-09-13' AS Date), N'miltchev@mac.com', CAST(N'2016-06-30' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (30, N'Медведев', N'Святослав', N'Юлианович', N'м', N'7(3520)435-21-20 ', N'img\m13.jpg', CAST(N'1972-10-04' AS Date), N'hllam@comcast.net', CAST(N'2018-10-13' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (31, N'Баранова', N'Эльмира', N'Дмитриевна', N'ж', N'7(9240)643-15-50 ', N'img\4.jpg', CAST(N'1977-01-15' AS Date), N'jgmyers@comcast.net', CAST(N'2016-07-08' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (32, N'Попова', N'Харита', N'Якуновна', N'ж', N'7(335)386-81-06 ', N'img\36.jpg', CAST(N'1997-12-16' AS Date), N'firstpr@verizon.net', CAST(N'2016-07-05' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (33, N'Кудряшов', N'Аверкий', N'Константинович', N'м', N'7(88)732-96-30 ', N'img\m33.jpg', CAST(N'1991-07-26' AS Date), N'nanop@msn.com', CAST(N'2018-03-08' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (34, N'Горшкова', N'Марта', N'Иосифовна', N'ж', N'7(544)650-59-03', N'img\9.jpg', CAST(N'2001-02-13' AS Date), N'gbacon@mac.com', CAST(N'2016-08-04' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (35, N'Кудрявцев', N'Богдан', N'Христофорович', N'м', N'7(20)131-84-09 ', N'img\m31.jpg', CAST(N'1988-02-27' AS Date), N'lukka@hotmail.com', CAST(N'2016-10-07' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (36, N'Гусев', N'Яков', N'Авксентьевич', N'м', N'7(0972)781-11-37 ', N'img\m20.jpg', CAST(N'1995-12-10' AS Date), N'jdhedden@icloud.com', CAST(N'2017-11-20' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (37, N'Крюкова', N'Авигея', N'Святославовна', N'ж', N'7(499)318-88-53 ', N'img\19.jpg', CAST(N'2000-08-10' AS Date), N'simone@gmail.com', CAST(N'2018-01-03' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (38, N'Степанова', N'Амелия', N'Робертовна', N'ж', N'7(1217)441-28-42 ', N'img\15.jpg', CAST(N'1970-06-06' AS Date), N'rasca@hotmail.com', CAST(N'2017-09-27' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (39, N'Суворова', N'Божена', N'Анатольевна', N'ж', N'7(347)895-86-57 ', N'img\34.jpg', CAST(N'1981-03-09' AS Date), N'attwood@aol.com', CAST(N'2016-01-28' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (40, N'Борисов', N'Аввакум', N'Артемович', N'м', N'7(2296)930-08-88 ', N'img\m12.jpg', CAST(N'1974-04-25' AS Date), N'chlim@live.com', CAST(N'2017-03-11' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (41, N'Бобылёв', N'Георгий', N'Витальевич', N'м', N'7(88)685-13-51 ', N'img\m11.jpg', CAST(N'1983-12-19' AS Date), N'csilvers@mac.com', CAST(N'2018-04-06' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (42, N'Дроздов', N'Вольдемар', N'Артемович', N'м', N'7(307)456-99-05 ', N'img\m21.jpg', CAST(N'1976-02-07' AS Date), N'smpeters@me.com', CAST(N'2017-07-18' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (43, N'Беляева', N'Сабрина', N'Федосеевна', N'ж', N'7(6580)534-32-58 ', N'img\47.jpg', CAST(N'1972-07-26' AS Date), N'agapow@gmail.com', CAST(N'2017-06-14' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (44, N'Блохин', N'Пантелеймон', N'Феликсович', N'м', N'7(9524)556-48-98 ', N'img\m8.jpg', CAST(N'1978-03-06' AS Date), N'balchen@comcast.net', CAST(N'2018-02-14' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (45, N'Шашкова', N'Гелла', N'Эдуардовна', N'ж', N'7(57)446-21-04 ', N'img\43.jpg', CAST(N'1979-02-24' AS Date), N'jadavis@mac.com', CAST(N'2016-11-16' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (46, N'Калашников', N'Артур', N'Юрьевич', N'м', N'7(147)947-47-21 ', N'img\m10.jpg', CAST(N'1972-12-13' AS Date), N'oevans@aol.com', CAST(N'2017-08-20' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (47, N'Корнилова', N'Анэля', N'Михайловна', N'ж', N'7(20)980-01-60 ', N'img\26.jpg', CAST(N'1973-04-02' AS Date), N'jonathan@aol.com', CAST(N'2016-05-22' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (48, N'Гущина', N'Янита', N'Федоровна', N'ж', N'7(4544)716-68-96 ', N'img\11.jpg', CAST(N'1999-03-02' AS Date), N'lishoy@att.net', CAST(N'2018-02-01' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (49, N'Волков', N'Людвиг', N'Витальевич', N'м', N'7(8459)592-05-58 ', N'img\m50.jpg', CAST(N'1977-12-27' AS Date), N'jrkorson@msn.com', CAST(N'2016-04-27' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (50, N'Князев', N'Терентий', N'Валерьевич', N'м', N'7(98)397-23-23 ', N'img\m26.jpg', CAST(N'1991-06-19' AS Date), N'rjones@aol.com', CAST(N'2018-06-25' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (51, N'Силин', N'Гаянэ', N'Анатольевич', N'м', N'7(4547)615-22-69 ', N'img\m46.jpg', CAST(N'1976-05-27' AS Date), N'multiplx@comcast.net', CAST(N'2017-05-05' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (52, N'Казаков', N'Дмитрий', N'Русланович', N'м', N'7(51)682-19-40 ', N'img\m44.jpg', CAST(N'1978-12-15' AS Date), N'ozawa@verizon.net', CAST(N'2016-05-21' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (53, N'Гусева', N'Роза', N'Дмитриевна', N'ж', N'7(23)064-51-84 ', N'img\10.jpg', CAST(N'1999-02-13' AS Date), N'martyloo@live.com', CAST(N'2017-12-12' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (54, N'Мамонтова', N'Марфа', N'Мироновна', N'ж', N'7(38)095-64-18 ', N'img\29.jpg', CAST(N'1984-10-19' AS Date), N'rfoley@verizon.net', CAST(N'2018-02-27' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (55, N'Галкин', N'Эрик', N'Онисимович', N'м', N'7(759)873-77-39 ', N'img\m16.jpg', CAST(N'1975-01-18' AS Date), N'snunez@verizon.net', CAST(N'2016-07-19' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (56, N'Архипова', N'Прасковья', N'Валерьевна', N'ж', N'7(86)540-10-21 ', N'img\33.jpg', CAST(N'1979-01-09' AS Date), N'cgcra@live.com', CAST(N'2018-07-23' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (57, N'Овчинникова', N'Лаура', N'Еремеевна', N'ж', N'7(85)829-33-79 ', N'img\35.jpg', CAST(N'1992-04-03' AS Date), N'carcus@yahoo.ca', CAST(N'2018-11-24' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (58, N'Андреева', N'Патрисия', N'Валерьевна', N'ж', N'7(9648)953-81-26 ', N'img\37.jpg', CAST(N'1993-11-18' AS Date), N'jigsaw@aol.com', CAST(N'2016-07-17' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (59, N'Авдеев', N'Самуил', N'Улебович', N'м', N'7(3168)043-63-31 ', N'img\m96.jpg', CAST(N'1996-07-04' AS Date), N'cliffordj@mac.com', CAST(N'2016-02-11' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (60, N'Бурова', N'Светлана', N'Лукьевна', N'ж', N'7(358)173-82-21 ', N'img\39.jpg', CAST(N'1979-01-04' AS Date), N'wsnyder@aol.com', CAST(N'2016-10-13' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (61, N'Ершов', N'Глеб', N'Федорович', N'м', N'7(2608)298-40-82 ', N'img\m23.jpg', CAST(N'1970-06-14' AS Date), N'sjava@aol.com', CAST(N'2016-09-14' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (62, N'Игнатов', N'Захар', N'Павлович', N'м', N'7(578)574-73-36 ', N'img\m98.jpg', CAST(N'1998-10-07' AS Date), N'dieman@icloud.com', CAST(N'2017-11-10' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (63, N'Комиссарова', N'Амалия', N'Робертовна', N'ж', N'7(22)647-46-32 ', N'img\17.jpg', CAST(N'1971-08-18' AS Date), N'jorgb@msn.com', CAST(N'2017-08-04' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (64, N'Быков', N'Трофим', N'Константинович', N'м', N'7(3414)460-12-05 ', N'img\m14.jpg', CAST(N'1994-12-20' AS Date), N'jguyer@aol.com', CAST(N'2016-04-17' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (65, N'Кузьмин', N'Леонтий', N'Валерьянович', N'м', N'7(1340)148-90-68 ', N'img\m17.jpg', CAST(N'2000-05-05' AS Date), N'msloan@hotmail.com', CAST(N'2017-10-12' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (66, N'Белозёрова', N'Диана', N'Антоновна', N'ж', N'7(9900)174-59-87 ', N'img\7.jpg', CAST(N'1989-02-27' AS Date), N'dialworld@aol.com', CAST(N'2017-01-30' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (67, N'Блинов', N'Евгений', N'Мэлсович', N'м', N'7(0852)321-82-64 ', N'img\m7.jpg', CAST(N'1994-01-05' AS Date), N'moxfulder@outlook.com', CAST(N'2017-05-07' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (68, N'Лазарев', N'Алексей', N'Богданович', N'м', N'7(0055)737-37-48 ', N'img\m48.jpg', CAST(N'1977-03-10' AS Date), N'claesjac@me.com', CAST(N'2017-01-02' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (69, N'Афанасьева', N'Розалия', N'Макаровна', N'ж', N'7(0661)413-23-32 ', N'img\31.jpg', CAST(N'1977-05-01' AS Date), N'malattia@hotmail.com', CAST(N'2017-09-06' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (70, N'Дементьева', N'Эдита', N'Онисимовна', N'ж', N'7(198)922-28-76 ', N'img\38.jpg', CAST(N'1975-09-17' AS Date), N'frosal@hotmail.com', CAST(N'2018-11-24' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (71, N'Калинин', N'Петр', N'Иванович', N'м', N'7(90)316-07-17 ', N'img\m47.jpg', CAST(N'1993-09-08' AS Date), N'aschmitz@hotmail.com', CAST(N'2016-05-26' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (72, N'Андреев', N'Станислав', N'Максович', N'м', N'7(02)993-91-28 ', N'img\m3.jpg', CAST(N'1975-10-10' AS Date), N'budinger@mac.com', CAST(N'2017-12-26' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (73, N'Киселёв', N'Устин', N'Яковлевич', N'м', N'7(83)334-52-76 ', N'img\m25.jpg', CAST(N'1985-01-08' AS Date), N'dalamb@verizon.net', CAST(N'2018-06-21' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (74, N'Гордеев', N'Павел', N'Семенович', N'м', N'7(5243)599-66-72 ', N'img\m19.jpg', CAST(N'1984-09-06' AS Date), N'dawnsong@verizon.net', CAST(N'2016-07-19' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (75, N'Горбачёва', N'Никки', N'Еремеевна', N'ж', N'7(94)789-69-20 ', N'img\8.jpg', CAST(N'1987-04-21' AS Date), N'chinthaka@att.net', CAST(N'2018-08-16' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (76, N'Копылов', N'Касьян', N'Робертович', N'м', N'7(5774)679-82-06 ', N'img\m29.jpg', CAST(N'1983-08-04' AS Date), N'crobles@sbcglobal.net', CAST(N'2018-03-18' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (77, N'Ефремов', N'Витольд', N'Авксентьевич', N'м', N'7(93)922-14-03 ', N'img\m28.jpg', CAST(N'1975-12-02' AS Date), N'kwilliams@yahoo.ca', CAST(N'2018-04-09' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (78, N'Баранов', N'Михаил', N'Романович', N'м', N'7(750)985-94-13 ', N'img\m5.jpg', CAST(N'1997-07-12' AS Date), N'bigmauler@outlook.com', CAST(N'2018-10-07' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (79, N'Дмитриева', N'Элина', N'Даниловна', N'ж', N'7(787)140-48-84 ', N'img\12.jpg', CAST(N'1988-12-10' AS Date), N'vmalik@live.com', CAST(N'2017-02-11' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (80, N'Федотов', N'Осип', N'Анатольевич', N'м', N'7(590)702-33-06 ', N'img\m9.jpg', CAST(N'1971-04-13' AS Date), N'breegster@hotmail.com', CAST(N'2018-07-23' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (81, N'Быкова', N'Тала', N'Георгьевна', N'ж', N'7(13)915-53-53 ', N'img\6.jpg', CAST(N'2000-02-22' AS Date), N'ganter@optonline.net', CAST(N'2016-08-13' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (82, N'Дементьев', N'Вадим', N'Ростиславович', N'м', N'7(79)330-46-15 ', N'img\m39.jpg', CAST(N'1993-07-10' AS Date), N'jacks@aol.com', CAST(N'2018-03-05' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (83, N'Евсеев', N'Макар', N'Васильевич', N'м', N'7(2141)077-85-70 ', N'img\m22.jpg', CAST(N'1977-09-13' AS Date), N'parsimony@sbcglobal.net', CAST(N'2018-12-05' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (84, N'Абрамов', N'Станислав', N'Филатович', N'м', N'7(6545)478-87-79 ', N'img\m32.jpg', CAST(N'1989-05-18' AS Date), N'solomon@att.net', CAST(N'2016-12-08' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (85, N'Артемьева', N'Лиза', N'Максимовна', N'ж', N'7(696)972-70-21 ', N'img\3.jpg', CAST(N'1996-05-17' AS Date), N'snunez@yahoo.ca', CAST(N'2018-10-07' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (86, N'Кузьмина', N'Дэнна', N'Витальевна', N'ж', N'7(9940)977-45-73 ', N'img\20.jpg', CAST(N'1993-08-24' AS Date), N'nichoj@mac.com', CAST(N'2016-03-27' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (87, N'Ефимова', N'Магда', N'Платоновна', N'ж', N'7(9261)386-15-92 ', N'img\16.jpg', CAST(N'1995-08-16' AS Date), N'rbarreira@me.com', CAST(N'2017-08-01' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (88, N'Ефимов', N'Альберт', N'Проклович', N'м', N'7(416)375-97-19 ', N'img\m6.jpg', CAST(N'1997-10-29' AS Date), N'houle@live.com', CAST(N'2018-06-21' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (89, N'Лазарева', N'Эльвина', N'Робертовна', N'ж', N'7(5564)609-81-37 ', N'img\28.jpg', CAST(N'1996-02-16' AS Date), N'ahuillet@comcast.net', CAST(N'2018-04-11' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (90, N'Воронова', N'Изабелла', N'Вячеславовна', N'ж', N'7(17)433-44-98 ', N'img\21.jpg', CAST(N'1999-09-24' AS Date), N'kildjean@sbcglobal.net', CAST(N'2017-12-21' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (91, N'Куликова', N'Эвелина', N'Вячеславовна', N'ж', N'7(0236)682-42-78 ', N'img\23.jpg', CAST(N'1997-11-14' AS Date), N'ilikered@hotmail.com', CAST(N'2018-02-01' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (92, N'Егорова', N'Амалия', N'Дамировна', N'ж', N'7(7486)408-12-26 ', N'img\13.jpg', CAST(N'1999-09-28' AS Date), N'drezet@yahoo.com', CAST(N'2016-06-30' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (93, N'Александров', N'Станислав', N'Эдуардович', N'м', N'7(18)164-05-12 ', N'img\m2.jpg', CAST(N'1981-07-04' AS Date), N'bigmauler@aol.com', CAST(N'2018-11-08' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (94, N'Цветков', N'Демьян', N'Львович', N'м', N'7(93)546-43-73 ', N'img\m4.jpg', CAST(N'1996-03-29' AS Date), N'hauma@icloud.com', CAST(N'2016-02-12' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (95, N'Устинова', N'Юнона', N'Валентиновна', N'ж', N'7(33)367-13-07', N'img\44.jpg', CAST(N'1982-08-08' AS Date), N'kempsonc@live.com', CAST(N'2017-05-28' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (96, N'Костина', N'Любава', N'Авксентьевна', N'ж', N'7(6419)959-21-87 ', N'img\41.jpg', CAST(N'1972-07-13' AS Date), N'gordonjcp@hotmail.com', CAST(N'2016-02-26' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (97, N'Смирнов', N'Мартын', N'Арсеньевич', N'м', N'7(6251)589-02-43 ', N'img\m34.jpg', CAST(N'1996-06-25' AS Date), N'haddawy@live.com', CAST(N'2017-02-07' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (98, N'Федотова', N'Сандра', N'Владленовна', N'ж', N'7(126)195-25-86 ', N'img\24.jpg', CAST(N'1985-03-29' AS Date), N'penna@verizon.net', CAST(N'2016-11-08' AS Date))
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (99, N'Журавлёв', N'Леонтий', N'Яковлевич', N'м', N'7(4403)308-56-96 ', N'img\m24.jpg', CAST(N'2000-03-02' AS Date), N'cmdrgravy@me.com', CAST(N'2018-01-15' AS Date))
GO
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [PhotoPath], [Birthday], [Email], [RegistrationDate]) VALUES (100, N'Большаков', N'Вадим', N'Данилович', N'м', N'7(386)641-13-37 ', N'img\m97.jpg', CAST(N'1970-05-15' AS Date), N'uncle@gmail.com', CAST(N'2018-08-04' AS Date))
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientService] ON 

INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (1, 48, 87, CAST(N'2019-12-22T15:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (2, 46, 41, CAST(N'2019-06-07T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (3, 42, 14, CAST(N'2019-03-04T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (4, 3, 5, CAST(N'2019-12-01T14:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (5, 24, 46, CAST(N'2019-06-26T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (6, 41, 1, CAST(N'2019-12-05T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (7, 4, 39, CAST(N'2019-11-16T11:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (8, 16, 71, CAST(N'2019-01-01T14:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (9, 25, 46, CAST(N'2019-02-01T18:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (10, 28, 4, CAST(N'2019-06-23T08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (11, 6, 32, CAST(N'2019-08-18T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (12, 37, 26, CAST(N'2019-11-27T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (13, 47, 30, CAST(N'2019-09-06T19:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (14, 25, 46, CAST(N'2019-12-31T08:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (15, 35, 27, CAST(N'2019-12-28T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (16, 17, 98, CAST(N'2019-01-29T16:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (17, 10, 22, CAST(N'2019-11-12T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (18, 36, 46, CAST(N'2019-01-10T08:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (19, 24, 92, CAST(N'2019-09-29T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (20, 46, 93, CAST(N'2019-03-23T19:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (21, 48, 98, CAST(N'2019-04-29T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (22, 15, 96, CAST(N'2019-09-04T08:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (23, 44, 52, CAST(N'2019-01-23T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (24, 49, 22, CAST(N'2019-01-16T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (25, 45, 83, CAST(N'2019-07-15T14:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (26, 40, 41, CAST(N'2019-04-04T09:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (27, 22, 90, CAST(N'2019-04-30T18:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (28, 15, 7, CAST(N'2019-05-25T17:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (29, 40, 1, CAST(N'2019-08-11T12:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (30, 24, 61, CAST(N'2019-01-09T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (31, 27, 27, CAST(N'2019-04-09T11:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (32, 22, 38, CAST(N'2019-05-22T16:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (33, 37, 15, CAST(N'2019-09-28T10:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (34, 30, 61, CAST(N'2019-01-05T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (35, 7, 77, CAST(N'2019-05-08T14:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (36, 6, 98, CAST(N'2019-11-09T13:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (37, 48, 63, CAST(N'2019-01-16T14:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (38, 26, 5, CAST(N'2019-01-11T18:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (39, 42, 63, CAST(N'2019-08-29T19:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (40, 28, 87, CAST(N'2019-12-31T19:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (41, 24, 90, CAST(N'2019-05-17T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (42, 47, 73, CAST(N'2019-10-02T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (43, 6, 47, CAST(N'2019-11-27T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (44, 45, 47, CAST(N'2019-07-10T15:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (45, 30, 67, CAST(N'2019-04-16T13:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (46, 25, 72, CAST(N'2019-11-19T15:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (47, 34, 84, CAST(N'2019-06-13T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (48, 17, 73, CAST(N'2019-12-31T18:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (49, 25, 22, CAST(N'2019-12-19T19:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (50, 26, 96, CAST(N'2019-03-16T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (51, 17, 26, CAST(N'2019-11-23T18:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (52, 16, 28, CAST(N'2019-12-14T08:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (53, 19, 31, CAST(N'2019-07-04T17:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (54, 30, 91, CAST(N'2019-02-13T18:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (55, 7, 71, CAST(N'2019-08-29T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (56, 45, 100, CAST(N'2019-01-11T12:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (57, 20, 48, CAST(N'2019-03-01T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (58, 33, 91, CAST(N'2019-02-12T19:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (59, 49, 27, CAST(N'2019-12-26T16:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (60, 37, 48, CAST(N'2019-12-22T09:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (61, 15, 83, CAST(N'2019-11-09T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (62, 2, 4, CAST(N'2019-08-27T11:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (63, 45, 44, CAST(N'2019-01-22T16:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (64, 4, 86, CAST(N'2019-07-31T18:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (65, 44, 68, CAST(N'2019-08-15T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (66, 8, 5, CAST(N'2019-02-11T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (67, 47, 22, CAST(N'2019-01-05T08:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (68, 18, 91, CAST(N'2019-06-06T19:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (69, 47, 79, CAST(N'2019-01-06T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (70, 40, 49, CAST(N'2019-03-20T10:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (71, 40, 98, CAST(N'2019-08-06T16:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (72, 3, 68, CAST(N'2019-10-17T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (73, 26, 62, CAST(N'2019-04-07T10:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (74, 11, 14, CAST(N'2019-06-28T14:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (75, 3, 38, CAST(N'2019-01-03T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (76, 32, 87, CAST(N'2019-01-22T10:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (77, 26, 58, CAST(N'2019-01-31T12:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (78, 47, 98, CAST(N'2019-07-17T08:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (79, 4, 47, CAST(N'2019-04-29T12:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (80, 43, 100, CAST(N'2019-02-18T18:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (81, 48, 52, CAST(N'2019-03-15T10:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (82, 27, 3, CAST(N'2019-09-10T18:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (83, 26, 73, CAST(N'2019-08-06T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (84, 30, 32, CAST(N'2019-08-20T19:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (85, 2, 48, CAST(N'2019-11-15T17:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (86, 24, 61, CAST(N'2019-03-03T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (87, 42, 87, CAST(N'2019-10-21T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (88, 6, 4, CAST(N'2019-10-12T08:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (89, 43, 39, CAST(N'2019-11-11T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (90, 47, 20, CAST(N'2019-01-03T14:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (91, 9, 44, CAST(N'2019-07-06T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (92, 23, 15, CAST(N'2019-03-25T18:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (93, 34, 43, CAST(N'2019-10-27T16:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (94, 7, 73, CAST(N'2019-05-15T09:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (95, 45, 72, CAST(N'2019-08-30T11:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (96, 38, 41, CAST(N'2019-02-16T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (97, 41, 90, CAST(N'2019-09-24T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (98, 23, 5, CAST(N'2019-06-09T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (99, 4, 91, CAST(N'2019-04-13T09:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[ClientService] ([ID], [ServiceID], [ClientID], [StartTime], [Comment]) VALUES (100, 30, 3, CAST(N'2019-04-05T13:20:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ClientService] OFF
GO
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'ж', N'женский')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'м', N'мужской')
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (1, N'Коррекция нарощенных ресниц', N' 45 мин.', CAST(1310.00 AS Decimal(18, 2)), 0.05, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (2, N'Подготовка к экзамену ACT', N' 50 мин.', CAST(1440.00 AS Decimal(18, 2)), 0, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (3, N'Киноклуб итальянского языка для студентов', N' 30 мин.', CAST(1760.00 AS Decimal(18, 2)), 0, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (4, N'Урок в группе французского языка для школьников', N' 6000 сек.', CAST(1970.00 AS Decimal(18, 2)), 0, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (5, N'Ультразвуковой пилинг', N' 2700 сек.', CAST(1440.00 AS Decimal(18, 2)), 0.2, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (6, N'Киноклуб немецкого языка для детей', N' 120 мин.', CAST(1670.00 AS Decimal(18, 2)), 0.05, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (7, N'Урок в группе испанского языка для взрослых', N' 1800 сек.', CAST(1730.00 AS Decimal(18, 2)), 0.05, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (8, N'Интенсивный онлайн-курс португальского языка для компаний по Skype', N' 70 мин.', CAST(1610.00 AS Decimal(18, 2)), 0.05, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (9, N'Киноклуб английского языка для студентов', N' 4800 сек.', CAST(980.00 AS Decimal(18, 2)), 0, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (10, N'Интенсивный курс с преподавателем-носителем немецкого языка для компаний', N' 120 мин.', CAST(1180.00 AS Decimal(18, 2)), 0.2, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (11, N'Подготовка к экзамену IELTS Speaking Club', N' 90 мин.', CAST(1430.00 AS Decimal(18, 2)), 0.2, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (12, N'Ремонт подвески (ходовой)', N' 3 час.', CAST(680.00 AS Decimal(18, 2)), 0.05, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (13, N'Химический пилинг', N' 1500 сек.', CAST(1880.00 AS Decimal(18, 2)), 0.15, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (14, N'Киноклуб немецкого языка для студентов', N' 50 мин.', CAST(1140.00 AS Decimal(18, 2)), 0.15, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (15, N'Интенсивный курс с преподавателем-носителем английского языка для компаний', N' 110 мин.', CAST(1670.00 AS Decimal(18, 2)), 0.1, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (16, N'Киноклуб итальянского языка для детей', N' 70 мин.', CAST(1480.00 AS Decimal(18, 2)), 0, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (17, N'Урок в группе японского языка для школьников', N' 80 мин.', CAST(1300.00 AS Decimal(18, 2)), 0.05, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (18, N'Интенсивный курс итальянского языка с русскоязычным преподавателем для компаний', N' 110 мин.', CAST(900.00 AS Decimal(18, 2)), 0, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (19, N'Индивидуальный урок французского языка с преподавателем-носителем языка', N' 2400 сек.', CAST(1410.00 AS Decimal(18, 2)), 0.2, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (20, N'Интенсивный курс с преподавателем-носителем португальского языка для компаний', N' 30 мин.', CAST(1580.00 AS Decimal(18, 2)), 0, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (21, N'Снятие и установка колес', N' 390 мин.', CAST(3130.00 AS Decimal(18, 2)), 0, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (22, N'Урок в группе английского языка для школьников', N' 6600 сек.', CAST(900.00 AS Decimal(18, 2)), 0, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (23, N'Занятие с русскоязычным репетитором японского языка', N' 2400 сек.', CAST(1260.00 AS Decimal(18, 2)), 0.1, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (24, N'Индивидуальный урок немецкого языка с русскоязычным преподавателем', N' 1800 сек.', CAST(990.00 AS Decimal(18, 2)), 0.05, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (25, N'Интенсивный онлайн-курс немецкого языка для компаний по Skype', N' 4200 сек.', CAST(1840.00 AS Decimal(18, 2)), 0.1, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (26, N'Индивидуальный онлайн-урок немецкого языка по Skype', N' 90 мин.', CAST(970.00 AS Decimal(18, 2)), 0, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (27, N'Урок в группе китайского языка для взрослых', N' 4200 сек.', CAST(1730.00 AS Decimal(18, 2)), 0.25, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (28, N'Киноклуб французского языка для взрослых', N' 5400 сек.', CAST(1770.00 AS Decimal(18, 2)), 0.1, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (29, N'Ремонт автоэлектрики', N' 450 мин.', CAST(4230.00 AS Decimal(18, 2)), 0.1, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (30, N'Урок в группе китайского языка для школьников', N' 3000 сек.', CAST(1180.00 AS Decimal(18, 2)), 0.15, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (31, N'Удаление катализатора', N' 510 мин.', CAST(1930.00 AS Decimal(18, 2)), 0.1, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (32, N'Киноклуб китайского языка для студентов', N' 100 мин.', CAST(1990.00 AS Decimal(18, 2)), 0, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (33, N'Урок в группе китайского языка для студентов', N' 2400 сек.', CAST(2000.00 AS Decimal(18, 2)), 0.2, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (34, N'Индивидуальный урок итальянского языка с русскоязычным преподавателем', N' 30 мин.', CAST(1330.00 AS Decimal(18, 2)), 0.2, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (35, N'Киноклуб китайского языка для детей', N' 100 мин.', CAST(1120.00 AS Decimal(18, 2)), 0.1, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (36, N'Подготовка к экзамену TOEFL', N' 6000 сек.', CAST(1070.00 AS Decimal(18, 2)), 0.05, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (37, N'Урок в группе итальянского языка для взрослых', N' 40 мин.', CAST(1290.00 AS Decimal(18, 2)), 0, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (38, N'Индивидуальный урок английского языка с преподавателем-носителем языка', N' 7200 сек.', CAST(1300.00 AS Decimal(18, 2)), 0, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (39, N'Миндальный пилинг', N' 2700 сек.', CAST(2430.00 AS Decimal(18, 2)), 0.15, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (40, N'Занятие с репетитором-носителем французского языка', N' 50 мин.', CAST(2040.00 AS Decimal(18, 2)), 0, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (41, N'Занятие с русскоязычным репетитором английского языка', N' 90 мин.', CAST(1950.00 AS Decimal(18, 2)), 0.15, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (42, N'Индивидуальный урок испанского языка с преподавателем-носителем языка', N' 90 мин.', CAST(1200.00 AS Decimal(18, 2)), 0.1, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (43, N'Интенсивный онлайн-курс китайского языка для компаний по Skype', N' 120 мин.', CAST(1760.00 AS Decimal(18, 2)), 0.15, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (44, N'Занятие с репетитором-носителем немецкого языка', N' 7200 сек.', CAST(1120.00 AS Decimal(18, 2)), 0, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (45, N'Киноклуб португальского языка для детей', N' 90 мин.', CAST(1710.00 AS Decimal(18, 2)), 0.15, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (46, N'Киноклуб португальского языка для студентов', N' 1800 сек.', CAST(1170.00 AS Decimal(18, 2)), 0.15, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (47, N'Киноклуб немецкого языка для взрослых', N' 100 мин.', CAST(1560.00 AS Decimal(18, 2)), 0.1, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (48, N'Урок в группе немецкого языка для школьников', N' 1800 сек.', CAST(1570.00 AS Decimal(18, 2)), 0.15, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (49, N'Урок в группе английского языка для взрослых', N' 3000 сек.', CAST(1010.00 AS Decimal(18, 2)), 0.25, NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [DurationInSeconds], [Cost], [Discount], [Description], [MainImagePath]) VALUES (50, N'Ремонт кронштейна глушителя', N' 570 мин.', CAST(1410.00 AS Decimal(18, 2)), 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Client]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Service]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
USE [master]
GO
ALTER DATABASE [MRLanguageSchool] SET  READ_WRITE 
GO
