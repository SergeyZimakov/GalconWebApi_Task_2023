USE [master]
GO
/****** Object:  Database [Assignment_Galcon_Sergey]    Script Date: 05.02.2023 12:14:25 ******/
CREATE DATABASE [Assignment_Galcon_Sergey]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment_Galcon_Sergey', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment_Galcon_Sergey.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment_Galcon_Sergey_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment_Galcon_Sergey_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment_Galcon_Sergey].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET QUERY_STORE = OFF
GO
USE [Assignment_Galcon_Sergey]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 05.02.2023 12:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[O_ID] [int] IDENTITY(1,1) NOT NULL,
	[O_U_ID] [int] NULL,
	[O_Date] [datetime] NULL,
	[O_TotalPrice] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[O_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Role]    Script Date: 05.02.2023 12:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Role](
	[UR_ID] [int] NOT NULL,
	[UR_Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_User_Role] PRIMARY KEY CLUSTERED 
(
	[UR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05.02.2023 12:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[U_ID] [int] IDENTITY(1,1) NOT NULL,
	[U_UR_ID] [int] NOT NULL,
	[U_UserName] [nvarchar](50) NOT NULL,
	[U_FirstName] [nvarchar](50) NOT NULL,
	[U_LastName] [nvarchar](50) NOT NULL,
	[U_Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[U_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([O_ID], [O_U_ID], [O_Date], [O_TotalPrice]) VALUES (1, 1, CAST(N'2023-01-02T15:53:00.000' AS DateTime), CAST(50.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[Orders] ([O_ID], [O_U_ID], [O_Date], [O_TotalPrice]) VALUES (2, 1, CAST(N'2023-01-04T13:00:00.000' AS DateTime), CAST(150.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Orders] ([O_ID], [O_U_ID], [O_Date], [O_TotalPrice]) VALUES (3, 1, CAST(N'2023-01-07T08:23:00.000' AS DateTime), CAST(100.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[Orders] ([O_ID], [O_U_ID], [O_Date], [O_TotalPrice]) VALUES (4, 1, CAST(N'2023-01-15T15:00:00.000' AS DateTime), CAST(200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Orders] ([O_ID], [O_U_ID], [O_Date], [O_TotalPrice]) VALUES (5, 2, CAST(N'2023-01-22T15:30:00.000' AS DateTime), CAST(100.20 AS Decimal(10, 2)))
GO
INSERT [dbo].[Orders] ([O_ID], [O_U_ID], [O_Date], [O_TotalPrice]) VALUES (6, 2, CAST(N'2023-01-23T15:00:00.000' AS DateTime), CAST(100.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[Orders] ([O_ID], [O_U_ID], [O_Date], [O_TotalPrice]) VALUES (7, 2, CAST(N'2023-01-24T15:00:00.000' AS DateTime), CAST(120.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Orders] ([O_ID], [O_U_ID], [O_Date], [O_TotalPrice]) VALUES (8, 2, CAST(N'2023-01-28T15:00:00.000' AS DateTime), CAST(140.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Orders] ([O_ID], [O_U_ID], [O_Date], [O_TotalPrice]) VALUES (9, 2, CAST(N'2023-01-30T15:00:00.000' AS DateTime), CAST(100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Orders] ([O_ID], [O_U_ID], [O_Date], [O_TotalPrice]) VALUES (10, 3, CAST(N'2023-01-02T08:00:00.000' AS DateTime), CAST(80.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Orders] ([O_ID], [O_U_ID], [O_Date], [O_TotalPrice]) VALUES (11, 3, CAST(N'2023-01-02T16:00:00.000' AS DateTime), CAST(70.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Orders] ([O_ID], [O_U_ID], [O_Date], [O_TotalPrice]) VALUES (12, 3, CAST(N'2023-01-05T15:00:00.000' AS DateTime), CAST(90.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[Orders] ([O_ID], [O_U_ID], [O_Date], [O_TotalPrice]) VALUES (13, 3, CAST(N'2023-01-09T15:00:00.000' AS DateTime), CAST(50.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Orders] ([O_ID], [O_U_ID], [O_Date], [O_TotalPrice]) VALUES (14, 3, CAST(N'2023-01-10T15:00:00.000' AS DateTime), CAST(100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Orders] ([O_ID], [O_U_ID], [O_Date], [O_TotalPrice]) VALUES (15, 3, CAST(N'2023-01-12T15:00:00.000' AS DateTime), CAST(100.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[Orders] ([O_ID], [O_U_ID], [O_Date], [O_TotalPrice]) VALUES (16, 3, CAST(N'2023-01-17T15:00:00.000' AS DateTime), CAST(200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Orders] ([O_ID], [O_U_ID], [O_Date], [O_TotalPrice]) VALUES (17, 3, CAST(N'2023-01-20T15:00:00.000' AS DateTime), CAST(300.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Orders] ([O_ID], [O_U_ID], [O_Date], [O_TotalPrice]) VALUES (18, 3, CAST(N'2023-01-23T15:00:00.000' AS DateTime), CAST(20.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Orders] ([O_ID], [O_U_ID], [O_Date], [O_TotalPrice]) VALUES (19, 3, CAST(N'2023-01-28T15:00:00.000' AS DateTime), CAST(100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Orders] ([O_ID], [O_U_ID], [O_Date], [O_TotalPrice]) VALUES (20, 3, CAST(N'2023-01-31T15:00:00.000' AS DateTime), CAST(70.50 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[User_Role] ([UR_ID], [UR_Name]) VALUES (1, N'Admin')
GO
INSERT [dbo].[User_Role] ([UR_ID], [UR_Name]) VALUES (2, N'User')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([U_ID], [U_UR_ID], [U_UserName], [U_FirstName], [U_LastName], [U_Password]) VALUES (1, 1, N'Admin', N'John', N'Wright', N'admin')
GO
INSERT [dbo].[Users] ([U_ID], [U_UR_ID], [U_UserName], [U_FirstName], [U_LastName], [U_Password]) VALUES (2, 2, N'User1', N'Moshe', N'Perez', N'user1')
GO
INSERT [dbo].[Users] ([U_ID], [U_UR_ID], [U_UserName], [U_FirstName], [U_LastName], [U_Password]) VALUES (3, 2, N'User2', N'Moti', N'Cohen', N'user2')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_To_Users] FOREIGN KEY([O_U_ID])
REFERENCES [dbo].[Users] ([U_ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_To_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_To_UserRole] FOREIGN KEY([U_UR_ID])
REFERENCES [dbo].[User_Role] ([UR_ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_To_UserRole]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetOrdersByUser]    Script Date: 05.02.2023 12:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Sergey Zimakov>
-- Description:	<Get orders by user id>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetOrdersByUser]
	-- The parameters for the stored procedure
	@UserID		int
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT O_ID as OrderID, O_U_ID as UserID, O_Date as OrderDate, O_TotalPrice as TotalPrice
	FROM Orders
	WHERE O_U_ID = CASE WHEN @UserID <> -1 THEN @UserID ELSE O_U_ID END
	ORDER BY O_Date ASC, O_U_ID ASC

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetUserByUserNameAndPassword]    Script Date: 05.02.2023 12:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Sergey Zimakov>
-- Description:	<Get user by user name and password>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetUserByUserNameAndPassword]
	-- The parameters for the stored procedure
	@UserName	varchar(50),
	@Password	varchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT U_ID as UserID, U_UserName as UserName, U_FirstName as FirstName, U_LastName as LastName,
		UR_Name as [Role]
	FROM Users
		INNER JOIN User_Role ON UR_ID = U_UR_ID
	WHERE UPPER(U_UserName) = UPPER(@UserName)
		AND U_Password = @Password
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetUsersByRoleName]    Script Date: 05.02.2023 12:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Sergey Zimakov>
-- Description:	<Get users by role name(admin/user)>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetUsersByRoleName] 
	-- The parameters for the stored procedure
	@RoleName	varchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT U_ID as UserID, U_UserName as UserName, U_FirstName as FirstName, U_LastName as LastName,
		UR_Name as [Role]
	FROM Users
		INNER JOIN User_Role ON UR_ID = U_UR_ID
	WHERE UPPER(UR_Name) = UPPER(@RoleName)
	ORDER BY UR_ID ASC, U_ID ASC
END
GO
USE [master]
GO
ALTER DATABASE [Assignment_Galcon_Sergey] SET  READ_WRITE 
GO
