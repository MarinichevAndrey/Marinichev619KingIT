USE [master]
GO
/****** Object:  Database [Marinichev619KingIT]    Script Date: 29.01.2023 22:01:56 ******/
CREATE DATABASE [Marinichev619KingIT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Marinichev619KingIT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Marinichev619KingIT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Marinichev619KingIT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Marinichev619KingIT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Marinichev619KingIT] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Marinichev619KingIT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Marinichev619KingIT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Marinichev619KingIT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Marinichev619KingIT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Marinichev619KingIT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Marinichev619KingIT] SET ARITHABORT OFF 
GO
ALTER DATABASE [Marinichev619KingIT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Marinichev619KingIT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Marinichev619KingIT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Marinichev619KingIT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Marinichev619KingIT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Marinichev619KingIT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Marinichev619KingIT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Marinichev619KingIT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Marinichev619KingIT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Marinichev619KingIT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Marinichev619KingIT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Marinichev619KingIT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Marinichev619KingIT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Marinichev619KingIT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Marinichev619KingIT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Marinichev619KingIT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Marinichev619KingIT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Marinichev619KingIT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Marinichev619KingIT] SET  MULTI_USER 
GO
ALTER DATABASE [Marinichev619KingIT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Marinichev619KingIT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Marinichev619KingIT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Marinichev619KingIT] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Marinichev619KingIT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Marinichev619KingIT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Marinichev619KingIT', N'ON'
GO
ALTER DATABASE [Marinichev619KingIT] SET QUERY_STORE = OFF
GO
USE [Marinichev619KingIT]
GO
/****** Object:  Table [dbo].[City]    Script Date: 29.01.2023 22:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 29.01.2023 22:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Login] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[IdRole] [int] NULL,
	[Phone] [nvarchar](50) NULL,
	[IdGender] [int] NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 29.01.2023 22:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pavilion]    Script Date: 29.01.2023 22:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pavilion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdShoppingCenter] [int] NULL,
	[PovilionNum] [nvarchar](50) NULL,
	[NumberOfFloor] [int] NULL,
	[IdStatusPavilion] [int] NULL,
	[Square] [int] NULL,
	[CostPerSqm] [money] NULL,
	[ValueAddedRatio] [float] NULL,
 CONSTRAINT [PK_Pavilion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rent]    Script Date: 29.01.2023 22:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdShoppingCenter] [int] NULL,
	[IdEmployee] [int] NULL,
	[PovilionNum] [nvarchar](50) NULL,
	[IdStatusRent] [int] NULL,
	[RentStart] [date] NULL,
	[RentEnd] [date] NULL,
 CONSTRAINT [PK_Rent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rent_Rentor]    Script Date: 29.01.2023 22:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rent_Rentor](
	[IdRent] [int] NULL,
	[IdRentor] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rentor]    Script Date: 29.01.2023 22:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rentor](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Rentor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 29.01.2023 22:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCenter]    Script Date: 29.01.2023 22:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCenter](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[IdShoppingCenterStatus] [int] NULL,
	[PovilionNum] [int] NULL,
	[IdCity] [int] NULL,
	[Price] [money] NULL,
	[ValueAddedRatio] [float] NULL,
	[Floor] [int] NULL,
	[Image] [varchar](200) NULL,
 CONSTRAINT [PK_ShoppingCenter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusPavilion]    Script Date: 29.01.2023 22:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusPavilion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StatusPavilion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusRent]    Script Date: 29.01.2023 22:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusRent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_StatusRent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusShoppingCenter]    Script Date: 29.01.2023 22:01:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusShoppingCenter](
	[Id] [int] NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_StatusShoppingCenter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[City] ([Id], [Title]) VALUES (1, N'Москва')
INSERT [dbo].[City] ([Id], [Title]) VALUES (2, N'Санкт-Петербург')
INSERT [dbo].[City] ([Id], [Title]) VALUES (3, N'Новосибирск')
INSERT [dbo].[City] ([Id], [Title]) VALUES (4, N'Екатеринбург')
INSERT [dbo].[City] ([Id], [Title]) VALUES (5, N'Нижний Новгород')
INSERT [dbo].[City] ([Id], [Title]) VALUES (6, N'Казань')
INSERT [dbo].[City] ([Id], [Title]) VALUES (7, N'Челябинск')
INSERT [dbo].[City] ([Id], [Title]) VALUES (8, N'Самара')
INSERT [dbo].[City] ([Id], [Title]) VALUES (9, N'Ростов-на-Дону ')
GO
INSERT [dbo].[Employee] ([Id], [LastName], [FirstName], [Patronymic], [Login], [Password], [IdRole], [Phone], [IdGender], [Image]) VALUES (1, N'Чашин', N'Елизар', N'Михеевич', N'Elizor@gmai.com', N'yntiRS', 1, N'+7(1070)6282916', 1, NULL)
INSERT [dbo].[Employee] ([Id], [LastName], [FirstName], [Patronymic], [Login], [Password], [IdRole], [Phone], [IdGender], [Image]) VALUES (2, N'Филенкова', N'Владлена', N'Олеговна', N'Vladlena@gmai.com', N'07i7Lb', 2, N'+7(334)1460151', 2, NULL)
INSERT [dbo].[Employee] ([Id], [LastName], [FirstName], [Patronymic], [Login], [Password], [IdRole], [Phone], [IdGender], [Image]) VALUES (3, N'Ломовцев', N'Адам', N'Владимирович', N'Adam@gmai.com', N'7SP9CV', 3, N'+7(8560)5193299', 1, NULL)
INSERT [dbo].[Employee] ([Id], [LastName], [FirstName], [Patronymic], [Login], [Password], [IdRole], [Phone], [IdGender], [Image]) VALUES (4, N'Тепляков', N'Кир', N'Федосиевич', N'Kar@gmai.com', N'6QF1WB', 4, N'+7(824)8932403', 1, NULL)
INSERT [dbo].[Employee] ([Id], [LastName], [FirstName], [Patronymic], [Login], [Password], [IdRole], [Phone], [IdGender], [Image]) VALUES (5, N'Рюриков', N'Юлий', N'Глебович', N'Yli@gmai.com', N'GwffgE', 1, N'+7(6402)7013109', 1, NULL)
INSERT [dbo].[Employee] ([Id], [LastName], [FirstName], [Patronymic], [Login], [Password], [IdRole], [Phone], [IdGender], [Image]) VALUES (6, N'Беломестина', N'Василиса', N'Тимофеевна', N'Vasilisa@gmai.com', N'd7iKKV', 1, N'+7(92)9207447', 2, NULL)
INSERT [dbo].[Employee] ([Id], [LastName], [FirstName], [Patronymic], [Login], [Password], [IdRole], [Phone], [IdGender], [Image]) VALUES (7, N'Панькива', N'Галина', N'Якововна', N'Galina@gmai.com', N'8KC7wJ', 2, N'+7(405)0887389', 2, NULL)
INSERT [dbo].[Employee] ([Id], [LastName], [FirstName], [Patronymic], [Login], [Password], [IdRole], [Phone], [IdGender], [Image]) VALUES (8, N'Зарубин', N'Мирон', N'Мечиславович', N'Miron@@gmai.com', N'x58OAN', 1, N'+7(6010)1950209', 1, NULL)
INSERT [dbo].[Employee] ([Id], [LastName], [FirstName], [Patronymic], [Login], [Password], [IdRole], [Phone], [IdGender], [Image]) VALUES (9, N'Веточкина', N'Всеслава', N'Андрияновна', N'Vseslava@gmai.com', N'fhDSBf', 3, N'+7(078)4295786', 2, NULL)
INSERT [dbo].[Employee] ([Id], [LastName], [FirstName], [Patronymic], [Login], [Password], [IdRole], [Phone], [IdGender], [Image]) VALUES (10, N'Рябова', N'Виктория', N'Елизаровна', N'Victoria@gmai.com', N'9mlPQJ', 4, N'+7(6394)9040161', 2, NULL)
INSERT [dbo].[Employee] ([Id], [LastName], [FirstName], [Patronymic], [Login], [Password], [IdRole], [Phone], [IdGender], [Image]) VALUES (11, N'Федотов', N'Леон', N'Фёдорович', N'Anisa@gmai.com', N'Wh4OYm', 2, N'+7(22)3264959', 1, NULL)
INSERT [dbo].[Employee] ([Id], [LastName], [FirstName], [Patronymic], [Login], [Password], [IdRole], [Phone], [IdGender], [Image]) VALUES (12, N'Шарапов', N'Феофан', N'Кириллович', N'Feafan@@gmai.com', N'Kc1PeS', 3, N'+7(789)7623028', 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([Id], [Title]) VALUES (1, N'Мужской')
INSERT [dbo].[Gender] ([Id], [Title]) VALUES (2, N'Женский')
SET IDENTITY_INSERT [dbo].[Gender] OFF
GO
SET IDENTITY_INSERT [dbo].[Pavilion] ON 

INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (1, 3, N'88А', 1, 1, 75, 3307.7000, 0.1)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (2, 2, N'40А', 3, 2, 96, 690.0000, 1.1)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (3, 3, N'76Б', 2, 3, 199, 4938.0000, 0.9)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (4, 4, N'61А', 1, 4, 186, 2115.0000, 0.9)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (5, 10, N'58В', 4, 4, 98, 1306.0000, 1.9)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (6, 6, N'7А', 2, 2, 187, 2046.0000, 1)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (7, 7, N'13Б', 1, 2, 141, 1131.0000, 0.1)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (8, 8, N'60В', 2, 2, 94, 361.0000, 0.3)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (9, 10, N'56А', 1, 4, 148, 1163.0000, 0.6)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (10, 10, N'63Г', 2, 2, 153, 3486.0000, 0.7)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (11, 11, N'8Г', 1, 4, 122, 2451.0000, 1.5)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (12, 10, N'94В', 3, 1, 132, 4825.0000, 2)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (13, 13, N'87Г', 1, 2, 174, 793.0000, 1.5)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (14, 14, N'93В', 1, 4, 165, 4937.0000, 0.8)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (15, 15, N'10А', 3, 2, 168, 1353.0000, 1.7)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (16, 23, N'53Г', 1, 4, 99, 3924.0000, 1)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (17, 23, N'73В', 2, 1, 116, 3418.0000, 0)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (18, 18, N'89Б', 1, 1, 92, 562.0000, 0.4)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (19, 19, N'44Г', 2, 2, 67, 870.3000, 1)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (20, 20, N'65А', 2, 2, 95, 1381.0000, 1.7)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (21, 21, N'16Г', 2, 3, 150, 747.0000, 0.8)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (22, 22, N'61Б', 1, 1, 58, 1032.0000, 1.7)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (23, 23, N'34Б', 4, 2, 102, 4715.0000, 0.3)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (24, 23, N'91Г', 3, 4, 171, 1021.0000, 1.2)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (25, 25, N'70Г', 1, 2, 83, 2246.0000, 1.4)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (26, 26, N'10А', 1, 2, 187, 2067.0000, 0)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (27, 27, N'80Г', 1, 2, 117, 1049.0000, 1.3)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (28, 28, N'2Б', 1, 3, 176, 1673.0000, 1.7)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (29, 29, N'41А', 1, 1, 108, 344.0000, 0)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (30, 30, N'16Г', 2, 4, 125, 1037.0000, 1.3)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (31, 22, N'13Б', 2, 1, 162, 2775.7000, 0.4)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (32, 32, N'83Г', 2, 4, 86, 4584.0000, 0.3)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (33, 33, N'9Г', 1, 2, 131, 2477.0000, 1.5)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (34, 34, N'49Г', 1, 4, 164, 2728.0000, 0.9)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (35, 35, N'1Г', 1, 3, 157, 1963.0000, 1.6)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (36, 22, N'37А', 3, 4, 187, 3173.0000, 0.3)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (37, 22, N'38Г', 4, 4, 97, 1364.0000, 0.5)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (38, 38, N'27В', 1, 2, 96, 3134.0000, 0.1)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (39, 39, N'67Б', 1, 3, 55, 4442.0000, 0.8)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (40, 40, N'86Г', 1, 1, 58, 3707.0000, 0.5)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (41, 41, N'98А', 3, 2, 172, 4951.0000, 1.1)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (42, 42, N'11Г', 2, 4, 194, 827.0000, 0.6)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (43, 48, N'42В', 1, 1, 166, 4216.0000, 0.7)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (44, 44, N'55А', 2, 2, 127, 703.1000, 1)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (45, 48, N'6Б', 2, 1, 119, 3262.0000, 1.9)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (46, 46, N'15А', 1, 2, 90, 1569.0000, 1.3)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (47, 48, N'27Б', 3, 4, 132, 627.0000, 0.4)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (48, 48, N'65Б', 4, 3, 60, 3052.0000, 0.6)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (49, 49, N'26А', 1, 1, 95, 670.0000, 1.7)
INSERT [dbo].[Pavilion] ([Id], [IdShoppingCenter], [PovilionNum], [NumberOfFloor], [IdStatusPavilion], [Square], [CostPerSqm], [ValueAddedRatio]) VALUES (50, 49, N'53В', 3, 4, 132, 510.0000, 1.2)
SET IDENTITY_INSERT [dbo].[Pavilion] OFF
GO
SET IDENTITY_INSERT [dbo].[Rent] ON 

INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (1, 3, 2, N'88А', 1, CAST(N'2019-01-24' AS Date), CAST(N'2020-11-17' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (2, 2, 7, N'40А', 2, CAST(N'2019-11-21' AS Date), CAST(N'2020-04-18' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (3, 4, 11, N'61А', 3, CAST(N'2018-11-12' AS Date), CAST(N'2019-06-28' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (4, 10, 2, N'58В', 3, CAST(N'2018-10-18' AS Date), CAST(N'2019-09-16' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (5, 6, 7, N'7А', 2, CAST(N'2019-12-19' AS Date), CAST(N'2020-06-26' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (6, 7, 11, N'13Б', 2, CAST(N'2019-12-16' AS Date), CAST(N'2020-05-12' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (7, 8, 2, N'60В', 2, CAST(N'2019-12-06' AS Date), CAST(N'2020-10-16' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (8, 10, 11, N'56А', 3, CAST(N'2018-09-03' AS Date), CAST(N'2019-02-10' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (9, 10, 2, N'63Г', 2, CAST(N'2019-11-04' AS Date), CAST(N'2020-06-27' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (10, 11, 7, N'8Г', 3, CAST(N'2018-11-08' AS Date), CAST(N'2019-01-16' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (11, 10, 2, N'94В', 1, CAST(N'2019-06-07' AS Date), CAST(N'2020-03-18' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (12, 13, 2, N'87Г', 2, CAST(N'2019-11-15' AS Date), CAST(N'2020-06-20' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (13, 14, 11, N'93В', 3, CAST(N'2018-10-09' AS Date), CAST(N'2019-09-22' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (14, 15, 7, N'10А', 2, CAST(N'2019-11-24' AS Date), CAST(N'2020-07-17' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (15, 23, 7, N'53Г', 3, CAST(N'2018-07-20' AS Date), CAST(N'2019-06-07' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (16, 23, 11, N'73В', 1, CAST(N'2019-02-04' AS Date), CAST(N'2020-07-08' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (17, 18, 2, N'89Б', 1, CAST(N'2019-08-06' AS Date), CAST(N'2020-08-20' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (18, 22, 7, N'61Б', 1, CAST(N'2019-05-23' AS Date), CAST(N'2020-05-13' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (19, 23, 2, N'34Б', 2, CAST(N'2019-12-16' AS Date), CAST(N'2020-03-16' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (20, 23, 11, N'91Г', 3, CAST(N'2018-08-24' AS Date), CAST(N'2019-08-04' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (21, 25, 2, N'70Г', 2, CAST(N'2019-11-09' AS Date), CAST(N'2020-08-17' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (22, 15, 7, N'10А', 2, CAST(N'2019-12-02' AS Date), CAST(N'2020-07-24' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (23, 27, 11, N'80Г', 2, CAST(N'2019-11-23' AS Date), CAST(N'2020-08-06' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (24, 29, 7, N'41А', 1, CAST(N'2019-05-02' AS Date), CAST(N'2020-06-24' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (25, 7, 2, N'13Б', 2, CAST(N'2019-12-08' AS Date), CAST(N'2020-08-17' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (26, 32, 7, N'83Г', 3, CAST(N'2018-11-14' AS Date), CAST(N'2019-04-19' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (27, 33, 11, N'9Г', 2, CAST(N'2019-12-26' AS Date), CAST(N'2020-09-13' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (28, 34, 2, N'49Г', 3, CAST(N'2018-09-16' AS Date), CAST(N'2019-02-12' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (29, 22, 2, N'37А', 3, CAST(N'2018-10-18' AS Date), CAST(N'2019-06-22' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (30, 22, 2, N'38Г', 3, CAST(N'2018-06-23' AS Date), CAST(N'2019-08-26' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (31, 38, 11, N'27В', 2, CAST(N'2019-12-18' AS Date), CAST(N'2020-05-23' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (32, 40, 7, N'86Г', 1, CAST(N'2019-04-01' AS Date), CAST(N'2020-12-19' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (33, 41, 11, N'98А', 2, CAST(N'2019-11-22' AS Date), CAST(N'2020-08-15' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (34, 42, 11, N'11Г', 3, CAST(N'2018-10-08' AS Date), CAST(N'2019-07-21' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (35, 48, 2, N'42В', 1, CAST(N'2019-04-07' AS Date), CAST(N'2020-03-05' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (36, 44, 7, N'55А', 2, CAST(N'2019-11-07' AS Date), CAST(N'2020-03-08' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (37, 48, 2, N'6Б', 1, CAST(N'2019-07-15' AS Date), CAST(N'2020-04-25' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (38, 46, 2, N'15А', 2, CAST(N'2019-12-09' AS Date), CAST(N'2020-12-02' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (39, 48, 11, N'27Б', 3, CAST(N'2018-08-05' AS Date), CAST(N'2019-06-14' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (40, 49, 11, N'26А', 1, CAST(N'2019-08-19' AS Date), CAST(N'2020-09-02' AS Date))
INSERT [dbo].[Rent] ([Id], [IdShoppingCenter], [IdEmployee], [PovilionNum], [IdStatusRent], [RentStart], [RentEnd]) VALUES (41, 49, 7, N'53В', 3, CAST(N'2018-09-20' AS Date), CAST(N'2019-02-12' AS Date))
SET IDENTITY_INSERT [dbo].[Rent] OFF
GO
INSERT [dbo].[Rentor] ([Id], [Title], [Phone], [Address]) VALUES (1, N'AG Marine', N'+7(495)5261453', N'Москва, Бабаевская улица д.16')
INSERT [dbo].[Rentor] ([Id], [Title], [Phone], [Address]) VALUES (2, N'Artelle', N'+7(495)2505894', N'СанктПетербург, Амбарная улица д.25 корп.1')
INSERT [dbo].[Rentor] ([Id], [Title], [Phone], [Address]) VALUES (3, N'Atlantis', N'+7(495)4241165', N'Новосибирск, Улица Каменская д.16')
INSERT [dbo].[Rentor] ([Id], [Title], [Phone], [Address]) VALUES (4, N'Corporate Travel', N'+7(495)2453905', N'Екатеринбург, Улица Антона Валека д.56')
INSERT [dbo].[Rentor] ([Id], [Title], [Phone], [Address]) VALUES (5, N'GallaDance', N'+7(495)3167794', N'Нижний Новгород, Улица Ларина д. 34')
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Title]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([Id], [Title]) VALUES (2, N'Менеджер А')
INSERT [dbo].[Role] ([Id], [Title]) VALUES (3, N'Менеджер С')
INSERT [dbo].[Role] ([Id], [Title]) VALUES (4, N'Удален')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (1, N'Ривьера', 1, 0, 1, 8260042.0000, 0.5, 4, N'C:\Users\197734\Downloads\Image ТЦ\Ривьера
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (2, N'Авиапарк', 2, 9, 2, 3297976.0000, 0.1, 3, N'C:\Users\197734\Downloads\Image ТЦ\Авиапарк
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (3, N'Мега Белая Дача', 3, 16, 3, 9006645.0000, 1.7, 4, N'C:\Users\197734\Downloads\Image ТЦ\Мега Белая Дача
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (4, N'Рио', 4, 5, 4, 1888653.0000, 0.5, 1, N'C:\Users\197734\Downloads\Image ТЦ\Рио
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (5, N'Вегас', 1, 0, 5, 7567411.0000, 0.4, 3, N'C:\Users\197734\Downloads\Image ТЦ\Вегас
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (6, N'Лужайка', 2, 10, 6, 4603336.0000, 0.8, 2, N'C:\Users\197734\Downloads\Image ТЦ\Лужайка
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (7, N'Кунцево Плаза', 2, 8, 7, 6797653.0000, 1.1, 2, N'C:\Users\197734\Downloads\Image ТЦ\Кунцево Плаза
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (8, N'Мозаика', 2, 20, 8, 1429419.0000, 0, 4, N'C:\Users\197734\Downloads\Image ТЦ\Мозаика
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (9, N'Океания', 1, 0, 8, 5192089.0000, 1.8, 2, N'C:\Users\197734\Downloads\Image ТЦ\Океания
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (10, N'Гранд', 2, 20, 9, 2573981.0000, 0.1, 4, N'C:\Users\197734\Downloads\Image ТЦ\Гранд
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (11, N'Бутово Молл', 1, 0, 1, 5327641.0000, 1.7, 1, N'C:\Users\197734\Downloads\Image ТЦ\Бутово Молл
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (12, N'Рига Молл', 1, 0, 9, 9788316.0000, 0.7, 3, N'C:\Users\197734\Downloads\Image ТЦ\Рига Молл
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (13, N'Шоколад', 2, 12, 7, 2217279.0000, 1.1, 3, N'C:\Users\197734\Downloads\Image ТЦ\Шоколад
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (14, N'АфиМолл Сити', 4, 9, 2, 8729160.0000, 0.9, 3, N'C:\Users\197734\Downloads\Image ТЦ\АфиМолл Сити
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (15, N'Европейский', 2, 9, 1, 5690500.0000, 0.7, 3, N'C:\Users\197734\Downloads\Image ТЦ\Европейский
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (16, N'Гагаринский', 1, 0, 4, 1508807.0000, 1.6, 1, N'C:\Users\197734\Downloads\Image ТЦ\Гагаринский
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (17, N'Метрополис', 1, 0, 2, 8117913.0000, 0, 2, N'C:\Users\197734\Downloads\Image ТЦ\Метрополис
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (18, N'Мега Химки', 4, 3, 5, 3373234.0000, 0.4, 1, N'C:\Users\197734\Downloads\Image ТЦ\Мега Химки
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (19, N'Москва', 4, 12, 1, 4226505.0000, 0.3, 3, N'C:\Users\197734\Downloads\Image ТЦ\Москва
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (20, N'Вегас Кунцево', 4, 12, 1, 3878254.0000, 0.2, 4, N'C:\Users\197734\Downloads\Image ТЦ\Вегас Кунцево
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (21, N'Город Лефортово', 3, 12, 3, 1966214.0000, 1.7, 4, N'C:\Users\197734\Downloads\Image ТЦ\Город Лефортово
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (22, N'Золотой Вавилон Ростокино', 4, 16, 4, 1632702.0000, 1.8, 4, N'C:\Users\197734\Downloads\Image ТЦ\Золотой Вавилон Ростокино
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (23, N'Шереметьевский', 2, 16, 3, 2941379.0000, 1, 4, N'C:\Users\197734\Downloads\Image ТЦ\Шереметьевский
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (24, N'Ханой-Москва', 1, 0, 8, 9580221.0000, 0.3, 4, N'C:\Users\197734\Downloads\Image ТЦ\Ханой-Москва
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (25, N'Ашан Сити Капитолий', 2, 4, 4, 5309117.0000, 1.9, 1, N'C:\Users\197734\Downloads\Image ТЦ\Ашан Сити Капитолий
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (26, N'Черемушки', 4, 15, 3, 7344604.0000, 1, 3, N'C:\Users\197734\Downloads\Image ТЦ\Черемушки
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (27, N'Филион', 2, 8, 1, 5343904.0000, 0.3, 2, N'C:\Users\197734\Downloads\Image ТЦ\Филион
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (28, N'Весна', 3, 3, 5, 4687701.0000, 0.8, 1, N'C:\Users\197734\Downloads\Image ТЦ\ Весна
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (29, N'Гудзон', 4, 3, 4, 7414460.0000, 0, 1, N'C:\Users\197734\Downloads\Image ТЦ\ Гудзон
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (30, N'Калейдоскоп', 4, 10, 3, 7847659.0000, 0.7, 2, N'C:\Users\197734\Downloads\Image ТЦ\Калейдоскоп
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (31, N'Новомосковский', 1, 0, 6, 7161962.8500, 0.4, 1, N'C:\Users\197734\Downloads\Image ТЦ\Новомосковский
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (32, N'Хорошо', 4, 20, 9, 8306576.0000, 1.9, 4, N'C:\Users\197734\Downloads\Image ТЦ\Хорошо
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (33, N'Щука', 2, 5, 5, 5428485.0000, 0.4, 1, N'C:\Users\197734\Downloads\Image ТЦ\Щука
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (34, N'Атриум', 4, 4, 6, 5059779.0000, 0.2, 1, N'C:\Users\197734\Downloads\Image ТЦ\Атриум
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (35, N'Принц Плаза', 4, 8, 8, 1786688.0000, 1.5, 2, N'C:\Users\197734\Downloads\Image ТЦ\Принц Плаза
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (36, N'Облака', 1, 0, 2, 1688905.0000, 0.6, 3, N'C:\Users\197734\Downloads\Image ТЦ\Облака
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (37, N'Три Кита', 1, 0, 6, 3089700.0000, 1.7, 1, N'C:\Users\197734\Downloads\Image ТЦ\Три Кита
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (38, N'Реутов Парк', 2, 4, 9, 1995904.0000, 1.5, 1, N'C:\Users\197734\Downloads\Image ТЦ\Реутов Парк
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (39, N'ЕвроПарк', 3, 20, 3, 9391338.0000, 0.7, 4, N'C:\Users\197734\Downloads\Image ТЦ\ЕвроПарк
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (40, N'ГУМ', 4, 5, 2, 6731491.0000, 1.9, 1, N'C:\Users\197734\Downloads\Image ТЦ\ГУМ
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (41, N'Райкин Плаза', 2, 12, 2, 8498470.0000, 1.8, 3, N'C:\Users\197734\Downloads\Image ТЦ\Райкин Плаза
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (42, N'Новинский пассаж', 4, 8, 4, 3158957.0000, 1.7, 2, N'C:\Users\197734\Downloads\Image ТЦ\Новинский пассаж
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (43, N'Наш Гипермаркет', 1, 0, 9, 1088735.0000, 1.2, 4, N'C:\Users\197734\Downloads\Image ТЦ\Наш Гипермаркет
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (44, N'Красный Кит', 2, 9, 6, 1912149.0000, 1.1, 3, N'C:\Users\197734\Downloads\Image ТЦ\Красный Кит
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (45, N'Мегаполис', 1, 0, 7, 2175218.5000, 0.5, 2, N'C:\Users\197734\Downloads\Image ТЦ\Мегаполис
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (46, N'Отрада', 2, 4, 2, 6760316.0000, 0.9, 1, N'C:\Users\197734\Downloads\Image ТЦ\Отрада
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (47, N'Твой дом', 1, 0, 7, 6810865.0000, 1.7, 4, N'C:\Users\197734\Downloads\Image ТЦ\Твой дом
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (48, N'Фестиваль', 3, 16, 3, 1828013.0000, 0.2, 4, N'C:\Users\197734\Downloads\Image ТЦ\Фестиваль
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (49, N'Времена Года', 4, 15, 4, 2650484.0000, 1.7, 3, N'C:\Users\197734\Downloads\Image ТЦ\Времена Года
')
INSERT [dbo].[ShoppingCenter] ([Id], [Title], [IdShoppingCenterStatus], [PovilionNum], [IdCity], [Price], [ValueAddedRatio], [Floor], [Image]) VALUES (50, N' Армада', 1, 0, 9, 9172489.0000, 0.9, 1, N'C:\Users\197734\Downloads\Image ТЦ\ Армада
')
GO
SET IDENTITY_INSERT [dbo].[StatusPavilion] ON 

INSERT [dbo].[StatusPavilion] ([Id], [Status]) VALUES (1, N'Свободен')
INSERT [dbo].[StatusPavilion] ([Id], [Status]) VALUES (2, N'Забронировано')
INSERT [dbo].[StatusPavilion] ([Id], [Status]) VALUES (3, N'Удален')
INSERT [dbo].[StatusPavilion] ([Id], [Status]) VALUES (4, N'Арендован')
SET IDENTITY_INSERT [dbo].[StatusPavilion] OFF
GO
SET IDENTITY_INSERT [dbo].[StatusRent] ON 

INSERT [dbo].[StatusRent] ([Id], [Status]) VALUES (1, N'Открыт')
INSERT [dbo].[StatusRent] ([Id], [Status]) VALUES (2, N'Ожидание')
INSERT [dbo].[StatusRent] ([Id], [Status]) VALUES (3, N'Закрыт')
SET IDENTITY_INSERT [dbo].[StatusRent] OFF
GO
INSERT [dbo].[StatusShoppingCenter] ([Id], [Status]) VALUES (1, N'План')
INSERT [dbo].[StatusShoppingCenter] ([Id], [Status]) VALUES (2, N'Строительство')
INSERT [dbo].[StatusShoppingCenter] ([Id], [Status]) VALUES (3, N'Удален')
INSERT [dbo].[StatusShoppingCenter] ([Id], [Status]) VALUES (4, N'Реализация')
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Gender] FOREIGN KEY([IdGender])
REFERENCES [dbo].[Gender] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Gender]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Role]
GO
ALTER TABLE [dbo].[Pavilion]  WITH CHECK ADD  CONSTRAINT [FK_Pavilion_ShoppingCenter] FOREIGN KEY([IdShoppingCenter])
REFERENCES [dbo].[ShoppingCenter] ([Id])
GO
ALTER TABLE [dbo].[Pavilion] CHECK CONSTRAINT [FK_Pavilion_ShoppingCenter]
GO
ALTER TABLE [dbo].[Pavilion]  WITH CHECK ADD  CONSTRAINT [FK_Pavilion_StatusPavilion] FOREIGN KEY([IdStatusPavilion])
REFERENCES [dbo].[StatusPavilion] ([Id])
GO
ALTER TABLE [dbo].[Pavilion] CHECK CONSTRAINT [FK_Pavilion_StatusPavilion]
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD  CONSTRAINT [FK_Rent_Employee] FOREIGN KEY([IdEmployee])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Rent] CHECK CONSTRAINT [FK_Rent_Employee]
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD  CONSTRAINT [FK_Rent_ShoppingCenter] FOREIGN KEY([IdShoppingCenter])
REFERENCES [dbo].[ShoppingCenter] ([Id])
GO
ALTER TABLE [dbo].[Rent] CHECK CONSTRAINT [FK_Rent_ShoppingCenter]
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD  CONSTRAINT [FK_Rent_StatusRent] FOREIGN KEY([IdStatusRent])
REFERENCES [dbo].[StatusRent] ([Id])
GO
ALTER TABLE [dbo].[Rent] CHECK CONSTRAINT [FK_Rent_StatusRent]
GO
ALTER TABLE [dbo].[Rent_Rentor]  WITH CHECK ADD  CONSTRAINT [FK_Rent_Rentor_Rent] FOREIGN KEY([IdRent])
REFERENCES [dbo].[Rent] ([Id])
GO
ALTER TABLE [dbo].[Rent_Rentor] CHECK CONSTRAINT [FK_Rent_Rentor_Rent]
GO
ALTER TABLE [dbo].[Rent_Rentor]  WITH CHECK ADD  CONSTRAINT [FK_Rent_Rentor_Rentor] FOREIGN KEY([IdRentor])
REFERENCES [dbo].[Rentor] ([Id])
GO
ALTER TABLE [dbo].[Rent_Rentor] CHECK CONSTRAINT [FK_Rent_Rentor_Rentor]
GO
ALTER TABLE [dbo].[ShoppingCenter]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCenter_City] FOREIGN KEY([IdCity])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[ShoppingCenter] CHECK CONSTRAINT [FK_ShoppingCenter_City]
GO
ALTER TABLE [dbo].[ShoppingCenter]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCenter_StatusShoppingCenter] FOREIGN KEY([IdShoppingCenterStatus])
REFERENCES [dbo].[StatusShoppingCenter] ([Id])
GO
ALTER TABLE [dbo].[ShoppingCenter] CHECK CONSTRAINT [FK_ShoppingCenter_StatusShoppingCenter]
GO
USE [master]
GO
ALTER DATABASE [Marinichev619KingIT] SET  READ_WRITE 
GO
