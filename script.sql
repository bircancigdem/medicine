USE [master]
GO
/****** Object:  Database [İlaçProspektüsü]    Script Date: 9.06.2021 19:05:13 ******/
CREATE DATABASE [İlaçProspektüsü]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'İlacım', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\İlacım.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'İlacım_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\İlacım_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [İlaçProspektüsü] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [İlaçProspektüsü].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [İlaçProspektüsü] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [İlaçProspektüsü] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [İlaçProspektüsü] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [İlaçProspektüsü] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [İlaçProspektüsü] SET ARITHABORT OFF 
GO
ALTER DATABASE [İlaçProspektüsü] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [İlaçProspektüsü] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [İlaçProspektüsü] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [İlaçProspektüsü] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [İlaçProspektüsü] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [İlaçProspektüsü] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [İlaçProspektüsü] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [İlaçProspektüsü] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [İlaçProspektüsü] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [İlaçProspektüsü] SET  DISABLE_BROKER 
GO
ALTER DATABASE [İlaçProspektüsü] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [İlaçProspektüsü] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [İlaçProspektüsü] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [İlaçProspektüsü] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [İlaçProspektüsü] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [İlaçProspektüsü] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [İlaçProspektüsü] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [İlaçProspektüsü] SET RECOVERY FULL 
GO
ALTER DATABASE [İlaçProspektüsü] SET  MULTI_USER 
GO
ALTER DATABASE [İlaçProspektüsü] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [İlaçProspektüsü] SET DB_CHAINING OFF 
GO
ALTER DATABASE [İlaçProspektüsü] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [İlaçProspektüsü] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [İlaçProspektüsü] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'İlaçProspektüsü', N'ON'
GO
ALTER DATABASE [İlaçProspektüsü] SET QUERY_STORE = OFF
GO
USE [İlaçProspektüsü]
GO
/****** Object:  Table [dbo].[Alfabe]    Script Date: 9.06.2021 19:05:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alfabe](
	[id] [smallint] NOT NULL,
	[harf] [nchar](10) NULL,
 CONSTRAINT [PK_Alfabe] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Firmalar]    Script Date: 9.06.2021 19:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Firmalar](
	[id] [int] NOT NULL,
	[firmaAdı] [nvarchar](50) NULL,
	[firmabilgi] [nvarchar](max) NULL,
 CONSTRAINT [PK_Firmalar] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[İlaçBilgileri]    Script Date: 9.06.2021 19:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[İlaçBilgileri](
	[id] [int] NOT NULL,
	[ilaçAdı] [nvarchar](50) NULL,
	[resim] [nvarchar](max) NULL,
	[nedir] [nvarchar](max) NULL,
	[etkenMadde] [nvarchar](max) NULL,
	[ilaçFiyatı] [nvarchar](50) NULL,
	[firmaID] [int] NULL,
	[başHarfID] [smallint] NULL,
	[kategori] [nvarchar](50) NULL,
 CONSTRAINT [PK_İlaçBilgileri] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NasılKullanılır]    Script Date: 9.06.2021 19:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NasılKullanılır](
	[kID] [int] NOT NULL,
	[kullanımAçıklama] [nvarchar](max) NULL,
	[uygulamaYolu] [nvarchar](max) NULL,
	[yetişkinler] [nvarchar](max) NULL,
	[yaşlılar] [nvarchar](max) NULL,
	[çocuklar] [nvarchar](max) NULL,
	[özelKullanımDurumları] [nvarchar](max) NULL,
	[fazlaDoz] [nvarchar](max) NULL,
	[kullanımUnutulursa] [nvarchar](max) NULL,
	[ilaçID] [int] NULL,
 CONSTRAINT [PK_NasılKullanılır] PRIMARY KEY CLUSTERED 
(
	[kID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YanEtkiler]    Script Date: 9.06.2021 19:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YanEtkiler](
	[yID] [int] NOT NULL,
	[yanEtkiAçıklama] [nvarchar](max) NULL,
	[yaygın] [nvarchar](max) NULL,
	[yaygınOlmayan] [nvarchar](max) NULL,
	[seyrek] [nvarchar](max) NULL,
	[ilaçID] [int] NULL,
 CONSTRAINT [PK_YanEtkiler] PRIMARY KEY CLUSTERED 
(
	[yID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[İlaçBilgileri]  WITH CHECK ADD  CONSTRAINT [FK_İlaçBilgileri_Alfabe] FOREIGN KEY([başHarfID])
REFERENCES [dbo].[Alfabe] ([id])
GO
ALTER TABLE [dbo].[İlaçBilgileri] CHECK CONSTRAINT [FK_İlaçBilgileri_Alfabe]
GO
ALTER TABLE [dbo].[İlaçBilgileri]  WITH CHECK ADD  CONSTRAINT [FK_İlaçBilgileri_Firmalar] FOREIGN KEY([firmaID])
REFERENCES [dbo].[Firmalar] ([id])
GO
ALTER TABLE [dbo].[İlaçBilgileri] CHECK CONSTRAINT [FK_İlaçBilgileri_Firmalar]
GO
ALTER TABLE [dbo].[NasılKullanılır]  WITH CHECK ADD  CONSTRAINT [FK_NasılKullanılır_İlaçBilgileri] FOREIGN KEY([ilaçID])
REFERENCES [dbo].[İlaçBilgileri] ([id])
GO
ALTER TABLE [dbo].[NasılKullanılır] CHECK CONSTRAINT [FK_NasılKullanılır_İlaçBilgileri]
GO
ALTER TABLE [dbo].[YanEtkiler]  WITH CHECK ADD  CONSTRAINT [FK_YanEtkiler_İlaçBilgileri] FOREIGN KEY([ilaçID])
REFERENCES [dbo].[İlaçBilgileri] ([id])
GO
ALTER TABLE [dbo].[YanEtkiler] CHECK CONSTRAINT [FK_YanEtkiler_İlaçBilgileri]
GO
USE [master]
GO
ALTER DATABASE [İlaçProspektüsü] SET  READ_WRITE 
GO
