USE [master]
GO
/****** Object:  Database [CompanyDB_V2]    Script Date: 17.12.2024 16:57:31 ******/
CREATE DATABASE [CompanyDB_V2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CompanyDB_V2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CompanyDB_V2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CompanyDB_V2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CompanyDB_V2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CompanyDB_V2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CompanyDB_V2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CompanyDB_V2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CompanyDB_V2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CompanyDB_V2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CompanyDB_V2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CompanyDB_V2] SET ARITHABORT OFF 
GO
ALTER DATABASE [CompanyDB_V2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CompanyDB_V2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CompanyDB_V2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CompanyDB_V2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CompanyDB_V2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CompanyDB_V2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CompanyDB_V2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CompanyDB_V2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CompanyDB_V2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CompanyDB_V2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CompanyDB_V2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CompanyDB_V2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CompanyDB_V2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CompanyDB_V2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CompanyDB_V2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CompanyDB_V2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CompanyDB_V2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CompanyDB_V2] SET RECOVERY FULL 
GO
ALTER DATABASE [CompanyDB_V2] SET  MULTI_USER 
GO
ALTER DATABASE [CompanyDB_V2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CompanyDB_V2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CompanyDB_V2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CompanyDB_V2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CompanyDB_V2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CompanyDB_V2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CompanyDB_V2', N'ON'
GO
ALTER DATABASE [CompanyDB_V2] SET QUERY_STORE = ON
GO
ALTER DATABASE [CompanyDB_V2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CompanyDB_V2]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 17.12.2024 16:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FaultsTypes]    Script Date: 17.12.2024 16:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FaultsTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NULL,
 CONSTRAINT [PK_FaultsTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requests]    Script Date: 17.12.2024 16:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[EquipmentID] [int] NULL,
	[FaultTypeID] [int] NULL,
	[ProblemDescription] [varchar](500) NULL,
	[UserID] [int] NULL,
	[StatusID] [int] NULL,
	[DeadLine] [datetime] NULL,
	[DaysSpent] [int] NULL,
	[EmployeeID] [int] NULL,
 CONSTRAINT [PK_Requests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 17.12.2024 16:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 17.12.2024 16:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Last_Name] [varchar](500) NULL,
	[First_Name] [varchar](500) NULL,
	[Patronymic] [varchar](500) NULL,
	[Role_ID] [int] NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 17.12.2024 16:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17.12.2024 16:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](150) NULL,
	[Last_Name] [varchar](150) NULL,
	[First_Name] [varchar](150) NULL,
	[Patronymic] [varchar](150) NULL,
	[Password] [varchar](150) NULL,
	[Role_ID] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Equipment] ON 

INSERT [dbo].[Equipment] ([ID], [Name]) VALUES (1, N'Оборудование 1')
INSERT [dbo].[Equipment] ([ID], [Name]) VALUES (2, N'Оборудование 2')
INSERT [dbo].[Equipment] ([ID], [Name]) VALUES (3, N'Оборудование 3')
INSERT [dbo].[Equipment] ([ID], [Name]) VALUES (4, N'Оборудование 4')
INSERT [dbo].[Equipment] ([ID], [Name]) VALUES (5, N'Оборудование 5')
SET IDENTITY_INSERT [dbo].[Equipment] OFF
GO
SET IDENTITY_INSERT [dbo].[FaultsTypes] ON 

INSERT [dbo].[FaultsTypes] ([ID], [Name]) VALUES (1, N'Неисправность 1')
INSERT [dbo].[FaultsTypes] ([ID], [Name]) VALUES (2, N'Неисправность 2')
INSERT [dbo].[FaultsTypes] ([ID], [Name]) VALUES (3, N'Неисправность 3')
INSERT [dbo].[FaultsTypes] ([ID], [Name]) VALUES (4, N'Неисправность 4')
INSERT [dbo].[FaultsTypes] ([ID], [Name]) VALUES (5, N'Неисправность 5')
SET IDENTITY_INSERT [dbo].[FaultsTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Requests] ON 

INSERT [dbo].[Requests] ([ID], [Date], [EquipmentID], [FaultTypeID], [ProblemDescription], [UserID], [StatusID], [DeadLine], [DaysSpent], [EmployeeID]) VALUES (1, CAST(N'2024-11-12T00:00:00.000' AS DateTime), 1, 1, N'Проблема с оборудованием 1', 1, 1, CAST(N'2025-01-01T00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[Requests] ([ID], [Date], [EquipmentID], [FaultTypeID], [ProblemDescription], [UserID], [StatusID], [DeadLine], [DaysSpent], [EmployeeID]) VALUES (2, CAST(N'2024-11-12T00:00:00.000' AS DateTime), 2, 2, N'Проблема с оборудованием 2', 2, 1, CAST(N'2024-11-15T00:00:00.000' AS DateTime), 2, 2)
INSERT [dbo].[Requests] ([ID], [Date], [EquipmentID], [FaultTypeID], [ProblemDescription], [UserID], [StatusID], [DeadLine], [DaysSpent], [EmployeeID]) VALUES (3, CAST(N'2024-11-12T00:00:00.000' AS DateTime), 3, 3, N'Проблема с оборудованием 3', 3, 2, CAST(N'2024-11-29T00:00:00.000' AS DateTime), 4, 2)
INSERT [dbo].[Requests] ([ID], [Date], [EquipmentID], [FaultTypeID], [ProblemDescription], [UserID], [StatusID], [DeadLine], [DaysSpent], [EmployeeID]) VALUES (4, CAST(N'2024-11-12T00:00:00.000' AS DateTime), 4, 4, N'Проблема с оборудованием 4', 4, 3, CAST(N'2024-11-15T00:00:00.000' AS DateTime), 2, 4)
INSERT [dbo].[Requests] ([ID], [Date], [EquipmentID], [FaultTypeID], [ProblemDescription], [UserID], [StatusID], [DeadLine], [DaysSpent], [EmployeeID]) VALUES (5, CAST(N'2024-11-12T00:00:00.000' AS DateTime), 5, 5, N'Проблема с оборудованием 5', 5, 4, CAST(N'2024-11-15T00:00:00.000' AS DateTime), 3, 5)
INSERT [dbo].[Requests] ([ID], [Date], [EquipmentID], [FaultTypeID], [ProblemDescription], [UserID], [StatusID], [DeadLine], [DaysSpent], [EmployeeID]) VALUES (6, CAST(N'2024-11-12T00:00:00.000' AS DateTime), 1, 1, N'Проблема с оборудованием 1', 6, 1, CAST(N'2024-11-15T00:00:00.000' AS DateTime), 4, NULL)
INSERT [dbo].[Requests] ([ID], [Date], [EquipmentID], [FaultTypeID], [ProblemDescription], [UserID], [StatusID], [DeadLine], [DaysSpent], [EmployeeID]) VALUES (7, CAST(N'2024-11-12T00:00:00.000' AS DateTime), 2, 2, N'Проблема с оборудованием 2', 7, 2, CAST(N'2024-11-15T00:00:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Requests] ([ID], [Date], [EquipmentID], [FaultTypeID], [ProblemDescription], [UserID], [StatusID], [DeadLine], [DaysSpent], [EmployeeID]) VALUES (8, CAST(N'2024-11-12T00:00:00.000' AS DateTime), 3, 3, N'Проблема с оборудованием 3', 8, 3, CAST(N'2024-11-15T00:00:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Requests] ([ID], [Date], [EquipmentID], [FaultTypeID], [ProblemDescription], [UserID], [StatusID], [DeadLine], [DaysSpent], [EmployeeID]) VALUES (9, CAST(N'2024-11-12T00:00:00.000' AS DateTime), 4, 4, N'Проблема с оборудованием 4', 9, 4, CAST(N'2024-11-15T00:00:00.000' AS DateTime), 5, NULL)
INSERT [dbo].[Requests] ([ID], [Date], [EquipmentID], [FaultTypeID], [ProblemDescription], [UserID], [StatusID], [DeadLine], [DaysSpent], [EmployeeID]) VALUES (10, CAST(N'2024-11-12T00:00:00.000' AS DateTime), 5, 5, N'Проблема с оборудованием 5', 10, 4, CAST(N'2024-11-15T00:00:00.000' AS DateTime), 5, NULL)
INSERT [dbo].[Requests] ([ID], [Date], [EquipmentID], [FaultTypeID], [ProblemDescription], [UserID], [StatusID], [DeadLine], [DaysSpent], [EmployeeID]) VALUES (11, CAST(N'2024-12-13T14:28:30.007' AS DateTime), 5, 1, N'regewrgewrg', 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Requests] ([ID], [Date], [EquipmentID], [FaultTypeID], [ProblemDescription], [UserID], [StatusID], [DeadLine], [DaysSpent], [EmployeeID]) VALUES (12, CAST(N'2024-12-13T14:28:30.007' AS DateTime), 3, 3, N'норм', 1, 4, CAST(N'2024-12-25T00:00:00.000' AS DateTime), 2, 2)
SET IDENTITY_INSERT [dbo].[Requests] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([ID], [Name]) VALUES (1, N'Пользователь')
INSERT [dbo].[Roles] ([ID], [Name]) VALUES (2, N'Администратор')
INSERT [dbo].[Roles] ([ID], [Name]) VALUES (3, N'Менеджер')
INSERT [dbo].[Roles] ([ID], [Name]) VALUES (4, N'Слесарь')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([ID], [Last_Name], [First_Name], [Patronymic], [Role_ID]) VALUES (2, N'Сидров', N'Пётр', N'Петрович', 4)
INSERT [dbo].[Staff] ([ID], [Last_Name], [First_Name], [Patronymic], [Role_ID]) VALUES (4, N'Антонов', N'Антон', N'Антонович', 4)
INSERT [dbo].[Staff] ([ID], [Last_Name], [First_Name], [Patronymic], [Role_ID]) VALUES (5, N'Иванов', N'Иван', N'Иванович', 4)
SET IDENTITY_INSERT [dbo].[Staff] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([ID], [Name]) VALUES (1, N'В ожидании')
INSERT [dbo].[Status] ([ID], [Name]) VALUES (2, N'Отклонено')
INSERT [dbo].[Status] ([ID], [Name]) VALUES (3, N'В работе')
INSERT [dbo].[Status] ([ID], [Name]) VALUES (4, N'Завершено')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [Login], [Last_Name], [First_Name], [Patronymic], [Password], [Role_ID]) VALUES (1, N'user1', N'Иванов', N'Иван', N'Иванович', N'password1', 1)
INSERT [dbo].[Users] ([ID], [Login], [Last_Name], [First_Name], [Patronymic], [Password], [Role_ID]) VALUES (2, N'user2', N'Петров', N'Петр', N'Петрович', N'password2', 1)
INSERT [dbo].[Users] ([ID], [Login], [Last_Name], [First_Name], [Patronymic], [Password], [Role_ID]) VALUES (3, N'user3', N'Сидоров', N'Сидор', N'Сидорович', N'password3', 1)
INSERT [dbo].[Users] ([ID], [Login], [Last_Name], [First_Name], [Patronymic], [Password], [Role_ID]) VALUES (4, N'admin1', N'Смирнов', N'Смирн', N'Смирнович', N'adminpass1', 2)
INSERT [dbo].[Users] ([ID], [Login], [Last_Name], [First_Name], [Patronymic], [Password], [Role_ID]) VALUES (5, N'admin2', N'Кузнецов', N'Кузьма', N'Кузьмич', N'adminpass2', 2)
INSERT [dbo].[Users] ([ID], [Login], [Last_Name], [First_Name], [Patronymic], [Password], [Role_ID]) VALUES (6, N'user4', N'Попов', N'Поп', N'Попович', N'password4', 1)
INSERT [dbo].[Users] ([ID], [Login], [Last_Name], [First_Name], [Patronymic], [Password], [Role_ID]) VALUES (7, N'user5', N'Васильев', N'Василий', N'Васильевич', N'password5', 1)
INSERT [dbo].[Users] ([ID], [Login], [Last_Name], [First_Name], [Patronymic], [Password], [Role_ID]) VALUES (8, N'user6', N'Зайцев', N'Заяц', N'Зайцевич', N'password6', 1)
INSERT [dbo].[Users] ([ID], [Login], [Last_Name], [First_Name], [Patronymic], [Password], [Role_ID]) VALUES (9, N'user7', N'Соловьев', N'Соловей', N'Соловьевич', N'password7', 1)
INSERT [dbo].[Users] ([ID], [Login], [Last_Name], [First_Name], [Patronymic], [Password], [Role_ID]) VALUES (10, N'user8', N'Морозов', N'Мороз', N'Морозович', N'password8', 1)
INSERT [dbo].[Users] ([ID], [Login], [Last_Name], [First_Name], [Patronymic], [Password], [Role_ID]) VALUES (11, N'123', N'123', N'123', N'123', N'123', 3)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Equipment] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[Equipment] ([ID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Equipment]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_FaultsTypes] FOREIGN KEY([FaultTypeID])
REFERENCES [dbo].[FaultsTypes] ([ID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_FaultsTypes]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Staff] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Staff] ([ID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Staff]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Status]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Users]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Roles] FOREIGN KEY([Role_ID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Roles]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([Role_ID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [CompanyDB_V2] SET  READ_WRITE 
GO
