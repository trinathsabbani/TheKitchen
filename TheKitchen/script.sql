USE [master]
GO
/****** Object:  Database [Kitchen]    Script Date: 14-09-2019 22:55:50 ******/
CREATE DATABASE [Kitchen]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Kitchen', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Kitchen.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Kitchen_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Kitchen_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Kitchen] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Kitchen].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Kitchen] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Kitchen] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Kitchen] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Kitchen] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Kitchen] SET ARITHABORT OFF 
GO
ALTER DATABASE [Kitchen] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Kitchen] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Kitchen] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Kitchen] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Kitchen] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Kitchen] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Kitchen] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Kitchen] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Kitchen] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Kitchen] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Kitchen] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Kitchen] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Kitchen] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Kitchen] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Kitchen] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Kitchen] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Kitchen] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Kitchen] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Kitchen] SET RECOVERY FULL 
GO
ALTER DATABASE [Kitchen] SET  MULTI_USER 
GO
ALTER DATABASE [Kitchen] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Kitchen] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Kitchen] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Kitchen] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Kitchen', N'ON'
GO
USE [Kitchen]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Display]    Script Date: 14-09-2019 22:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sp_Display]
@CategoryId int
as 
begin
select Description,Ingredients,Specialnotes,price from tbl_Kitchen where CategoryId=@categoryId
end
GO
/****** Object:  StoredProcedure [dbo].[SP_Login]    Script Date: 14-09-2019 22:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_Login]
@username varchar(100),
@password varchar(100)
as
begin
declare @count int
declare @returncode int

select @count =count(username) from tbl_Login where username =@username and password =@password

if(@count>0)
begin
set @returncode = 1
end
else
begin
set @returncode=-1
end
select @returncode as returnvalue
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Price]    Script Date: 14-09-2019 22:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_Price]
@id int
as
begin
select id, price from tbl_Kitchen where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Select]    Script Date: 14-09-2019 22:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sp_Select]
@catid int
as
begin
select id,Description from tbl_Kitchen where CategoryId=@catid 
end
GO
/****** Object:  StoredProcedure [dbo].[spRegisterUser]    Script Date: 14-09-2019 22:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spRegisterUser]  
@UserName nvarchar(100),  
@Password nvarchar (200),  
@Email nvarchar (200)  
as  
Begin  
 Declare @Count int  
 Declare @ReturnCode int  
   
 Select @Count = COUNT(UserName)   
 from tbl_Login where UserName = @UserName  
 If @Count > 0  
 Begin  
  Set @ReturnCode = -1  
 End  
 Else  
 Begin  
  Set @ReturnCode = 1  
  --Change: Column list specified while inserting
  Insert into tbl_Login([UserName], [Password], [Email]) 
  values  (@UserName, @Password, @Email)  
 End  
 Select @ReturnCode as ReturnValue  
End  

GO
/****** Object:  Table [dbo].[tbl_Category]    Script Date: 14-09-2019 22:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Category](
	[Id] [int] NOT NULL,
	[Category] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Kitchen]    Script Date: 14-09-2019 22:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Kitchen](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NULL,
	[Ingredients] [varchar](100) NULL,
	[Specialnotes] [varchar](300) NULL,
	[CategoryId] [int] NULL,
	[Price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Login]    Script Date: 14-09-2019 22:55:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Login](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](100) NULL,
	[Password] [varchar](200) NULL,
	[Email] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[tbl_Kitchen]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[tbl_Category] ([Id])
GO
USE [master]
GO
ALTER DATABASE [Kitchen] SET  READ_WRITE 
GO
