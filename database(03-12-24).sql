USE [master]
GO
/****** Object:  Database [SWP391_DB]    Script Date: 12/3/2024 2:12:32 PM ******/
CREATE DATABASE [SWP391_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP391_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SWP391_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWP391_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SWP391_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SWP391_DB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP391_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP391_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP391_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP391_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP391_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP391_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP391_DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SWP391_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP391_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP391_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP391_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP391_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP391_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP391_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP391_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP391_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWP391_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP391_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP391_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP391_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP391_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP391_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP391_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP391_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWP391_DB] SET  MULTI_USER 
GO
ALTER DATABASE [SWP391_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP391_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP391_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP391_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP391_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP391_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SWP391_DB] SET QUERY_STORE = ON
GO
ALTER DATABASE [SWP391_DB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SWP391_DB]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 12/3/2024 2:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[answerId] [int] IDENTITY(1,1) NOT NULL,
	[content] [varchar](255) NULL,
	[correct] [bit] NULL,
	[quesId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[answerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 12/3/2024 2:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[blogId] [int] IDENTITY(1,1) NOT NULL,
	[blogName] [nvarchar](255) NULL,
	[blogDate] [date] NULL,
	[blogDetail] [nvarchar](max) NULL,
	[img] [nvarchar](250) NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[blogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chapter]    Script Date: 12/3/2024 2:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chapter](
	[chapterId] [int] IDENTITY(1,1) NOT NULL,
	[chapterName] [varchar](255) NULL,
	[content] [varchar](255) NULL,
	[active] [bit] NULL,
	[public] [bit] NULL,
	[subId] [int] NULL,
	[description] [varchar](255) NULL,
 CONSTRAINT [PK__Lesson__F88A977848BD6CBE] PRIMARY KEY CLUSTERED 
(
	[chapterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lesstion]    Script Date: 12/3/2024 2:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesstion](
	[lesstionId] [int] IDENTITY(1,1) NOT NULL,
	[lesstion_url] [varchar](255) NULL,
	[status] [bit] NULL,
	[title] [varchar](255) NULL,
	[content] [varchar](255) NOT NULL,
	[backlink] [varchar](255) NULL,
	[notes] [varchar](255) NULL,
	[public] [bit] NULL,
	[subid] [int] NULL,
	[chapterid] [int] NULL,
 CONSTRAINT [PK__Slider__14564CBEC251D15F] PRIMARY KEY CLUSTERED 
(
	[lesstionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 12/3/2024 2:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[postId] [int] IDENTITY(1,1) NOT NULL,
	[thumbnail] [varchar](255) NULL,
	[userId] [int] NULL,
	[categoryBlogId] [int] NULL,
	[content] [varchar](max) NULL,
	[created_date] [date] NULL,
	[edit_date] [date] NULL,
	[status] [bit] NULL,
	[brifInfor] [varchar](255) NULL,
	[title] [varchar](255) NULL,
	[postFileId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[postId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post_File]    Script Date: 12/3/2024 2:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post_File](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[typeId] [varchar](255) NULL,
	[filePost] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PricePackage]    Script Date: 12/3/2024 2:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PricePackage](
	[priceId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[acessDuration] [int] NULL,
	[price] [float] NULL,
	[status] [bit] NULL,
	[description] [nvarchar](255) NULL,
 CONSTRAINT [PK_PricePackage] PRIMARY KEY CLUSTERED 
(
	[priceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 12/3/2024 2:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[questionId] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](255) NULL,
	[subjectId] [int] NULL,
	[chapterId] [int] NULL,
	[level] [nvarchar](255) NULL,
	[status] [bit] NULL,
	[isMultipleChoice] [bit] NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[questionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question_Quiz]    Script Date: 12/3/2024 2:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question_Quiz](
	[quesId] [int] NOT NULL,
	[quizId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 12/3/2024 2:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[quizId] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](255) NULL,
	[level] [varchar](255) NULL,
	[start_time] [datetime] NULL,
	[end_time] [datetime] NULL,
	[public] [bit] NULL,
	[active] [bit] NULL,
	[pass_percent] [float] NULL,
	[subId] [int] NULL,
	[user_create_id] [int] NULL,
	[quesId] [int] NULL,
	[duration] [int] NULL,
	[description] [varchar](max) NULL,
	[totalQues] [int] NULL,
	[attempt] [int] NOT NULL,
 CONSTRAINT [PK__Quiz__CFF54C3DA9C6BBCC] PRIMARY KEY CLUSTERED 
(
	[quizId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz_Answer_Detail]    Script Date: 12/3/2024 2:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz_Answer_Detail](
	[quiz_detail_id] [int] NOT NULL,
	[questionId] [int] NOT NULL,
	[selected_answer_id] [int] NOT NULL,
	[true_answer_id] [int] NOT NULL,
	[isCorrect] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz_Chapter]    Script Date: 12/3/2024 2:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz_Chapter](
	[quizid] [int] NOT NULL,
	[chapterid] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz_Detail]    Script Date: 12/3/2024 2:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz_Detail](
	[quiz_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[quizId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[taken_date] [datetime] NOT NULL,
	[score] [int] NOT NULL,
 CONSTRAINT [PK_Quiz_Detail] PRIMARY KEY CLUSTERED 
(
	[quiz_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration_Subject]    Script Date: 12/3/2024 2:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration_Subject](
	[regisId] [int] IDENTITY(1,1) NOT NULL,
	[regis_Date] [date] NULL,
	[status] [bit] NULL,
	[subId] [int] NULL,
	[priceId] [int] NULL,
	[userId] [int] NULL,
 CONSTRAINT [PK__Registra__61789DEF44A52D08] PRIMARY KEY CLUSTERED 
(
	[regisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/3/2024 2:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 12/3/2024 2:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subjectId] [int] IDENTITY(1,1) NOT NULL,
	[subjectName] [nvarchar](255) NULL,
	[status] [bit] NULL,
	[tagLine] [int] NULL,
	[title] [nvarchar](255) NULL,
	[thumbnail] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[subjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubjectPrice]    Script Date: 12/3/2024 2:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectPrice](
	[priceId] [int] NULL,
	[subjectId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 12/3/2024 2:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[typeId] [varchar](255) NOT NULL,
	[typeName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[typeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/3/2024 2:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NULL,
	[password] [nvarchar](150) NULL,
	[status] [bit] NULL,
	[email] [nvarchar](100) NULL,
	[phone] [nvarchar](100) NULL,
	[fullname] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
	[gender] [bit] NULL,
	[avatar] [nvarchar](max) NULL,
	[roleId] [int] NULL,
	[created_date] [datetime] NULL,
	[modify_date] [datetime] NULL,
	[password_token] [nvarchar](45) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Answer] ON 
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (1, N'soon', 0, 8)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (2, N'excitedly', 0, 8)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (3, N'carefully', 1, 8)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (4, N'Yesterday', 1, 9)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (5, N'Wisely', 0, 9)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (6, N'Here', 0, 9)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (7, N'happily', 0, 10)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (8, N'outside', 1, 10)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (9, N'later', 0, 10)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (10, N'neatly', 0, 11)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (11, N'excitedly', 0, 11)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (12, N'upstairs', 1, 11)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (13, N'later', 0, 11)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (14, N'3', 0, 1)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (15, N'2', 0, 1)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (16, N'1', 1, 1)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (17, N'4', 0, 1)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (18, N'Buddhism', 0, 2)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (19, N'Gnosticism', 0, 2)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (20, N'All of the above', 1, 2)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (21, N'Christianity', 0, 2)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (22, N'Through the white rabbit', 0, 3)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (23, N'Through a cell phone at work', 0, 3)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (24, N'Through his home computer', 1, 3)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (25, N'Through an analog phone booth', 0, 3)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (26, N'Cypher', 0, 4)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (27, N'The Oracle', 0, 4)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (28, N'Agent Smith', 1, 4)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (29, N'Commander Lock', 0, 4)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (30, N'She enters the Matrix and defeats Agent Smith', 0, 5)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (31, N'She gives Neo CPR on the Nebuchadnezzar', 0, 5)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (32, N'She kisses him', 1, 5)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (33, N'She asks Morpheus for help', 0, 5)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (34, N'He removes the bullet from her body', 0, 6)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (35, N'He patches her into the Agents’ network', 0, 6)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (36, N'He reaches into her body and massages her heart', 1, 6)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (37, N'Trinity doesn’t really die', 0, 6)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (38, N'“Wisdom Is Silence”', 0, 7)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (39, N'“All Is Vanity”', 0, 7)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (40, N'“Know Thyself”', 1, 7)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (41, N'“Father, Son, and Holy Ghost”', 0, 7)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (42, N'Mul1', 1, 12)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (43, N'Mul2', 0, 12)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (44, N'Mul3', 0, 12)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (45, N'Mul4', 0, 12)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (46, N'Mul5', 1, 12)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (47, N'Through an analog phone booth', 0, 14)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (48, N'Through his home computer', 0, 14)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (49, N'All of the above', 1, 14)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (50, N'Christianity', 0, 14)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (51, N'Through an analog phone booth', 0, 15)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (52, N'Through his home computer', 0, 15)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (53, N'All of the above', 1, 15)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (54, N'Christianity', 0, 15)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (55, N'Through an analog phone booth', 0, 16)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (56, N'Through his home computer', 0, 16)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (57, N'All of the above', 1, 16)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (58, N'Christianity', 0, 16)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (59, N'Through an analog phone booth', 0, 17)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (60, N'Through his home computer', 0, 17)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (61, N'All of the above', 1, 17)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (62, N'Christianity', 0, 17)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (63, N'Through an analog phone booth', 0, 18)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (64, N'Through his home computer', 0, 18)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (65, N'All of the above', 1, 18)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (66, N'Christianity', 0, 18)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (67, N'Through an analog phone booth', 0, 19)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (68, N'Through his home computer', 0, 19)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (69, N'All of the above', 1, 19)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (70, N'Christianity', 0, 19)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (71, N'Through an analog phone booth', 0, 20)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (72, N'Through his home computer', 0, 20)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (73, N'All of the above', 1, 20)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (74, N'Christianity', 0, 20)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (75, N'Through an analog phone booth', 0, 21)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (76, N'Through his home computer', 0, 21)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (77, N'All of the above', 1, 21)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (78, N'Christianity', 0, 21)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (79, N'Through an analog phone booth', 0, 22)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (80, N'Through his home computer', 0, 22)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (81, N'All of the above', 1, 22)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (82, N'Christianity', 0, 22)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (83, N'Through an analog phone booth', 0, 23)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (84, N'Through his home computer', 0, 23)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (85, N'All of the above', 1, 23)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (86, N'Christianity', 0, 23)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (87, N'Through an analog phone booth', 0, 24)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (88, N'Through his home computer', 0, 24)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (89, N'All of the above', 1, 24)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (90, N'Christianity', 0, 24)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (91, N'Through an analog phone booth', 0, 25)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (92, N'Through his home computer', 0, 25)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (93, N'All of the above', 1, 25)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (94, N'Christianity', 0, 25)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (95, N'Through an analog phone booth', 0, 26)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (96, N'Through his home computer', 0, 26)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (97, N'All of the above', 1, 26)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (98, N'Christianity', 0, 26)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (99, N'Through an analog phone booth', 0, 27)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (100, N'Through his home computer', 0, 27)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (101, N'All of the above', 1, 27)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (102, N'Christianity', 0, 27)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (103, N'Through an analog phone booth', 0, 28)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (104, N'Through his home computer', 0, 28)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (105, N'All of the above', 1, 28)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (106, N'Christianity', 0, 28)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (107, N'Through an analog phone booth', 0, 29)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (108, N'Through his home computer', 0, 29)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (109, N'All of the above', 1, 29)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (110, N'Christianity', 0, 29)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (111, N'Through an analog phone booth', 0, 30)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (112, N'Through his home computer', 0, 30)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (113, N'All of the above', 1, 30)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (114, N'Christianity', 0, 30)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (115, N'Through an analog phone booth', 0, 31)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (116, N'Through his home computer', 0, 31)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (117, N'All of the above', 1, 31)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (118, N'Christianity', 0, 31)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (119, N'Through an analog phone booth', 0, 32)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (120, N'Through his home computer', 0, 32)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (121, N'All of the above', 1, 32)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (122, N'Christianity', 0, 32)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (123, N'Through an analog phone booth', 0, 33)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (124, N'Through his home computer', 0, 33)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (125, N'All of the above', 1, 33)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (126, N'Christianity', 0, 33)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (127, N'Through an analog phone booth', 0, 34)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (128, N'Through his home computer', 0, 34)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (129, N'All of the above', 1, 34)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (130, N'Christianity', 0, 34)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (131, N'Through an analog phone booth', 0, 35)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (132, N'Through his home computer', 0, 35)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (133, N'All of the above', 1, 35)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (134, N'Christianity', 0, 35)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (135, N'Through an analog phone booth', 0, 36)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (136, N'Through his home computer', 0, 36)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (137, N'All of the above', 1, 36)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (138, N'Christianity', 0, 36)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (139, N'Through an analog phone booth', 0, 37)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (140, N'Through his home computer', 0, 37)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (141, N'All of the above', 1, 37)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (142, N'Christianity', 0, 37)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (143, N'Through an analog phone booth', 0, 38)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (144, N'Through his home computer', 0, 38)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (145, N'All of the above', 1, 38)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (146, N'Christianity', 0, 38)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (147, N'Through an analog phone booth', 0, 39)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (148, N'Through his home computer', 0, 39)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (149, N'All of the above', 1, 39)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (150, N'Christianity', 0, 39)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (151, N'Through an analog phone booth', 0, 40)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (152, N'Through his home computer', 0, 40)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (153, N'All of the above', 1, 40)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (154, N'Christianity', 0, 40)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (155, N'Through an analog phone booth', 0, 41)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (156, N'Through his home computer', 0, 41)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (157, N'All of the above', 1, 41)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (158, N'Christianity', 0, 41)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (159, N'Through an analog phone booth', 0, 42)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (160, N'Through his home computer', 0, 42)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (161, N'All of the above', 1, 42)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (162, N'Christianity', 0, 42)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (163, N'Through an analog phone booth', 0, 43)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (164, N'Through his home computer', 0, 43)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (165, N'All of the above', 1, 43)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (166, N'Christianity', 0, 43)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (167, N'Through an analog phone booth', 0, 44)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (168, N'Through his home computer', 0, 44)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (169, N'All of the above', 1, 44)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (170, N'Christianity', 0, 44)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (171, N'Through an analog phone booth', 0, 45)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (172, N'Through his home computer', 0, 45)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (173, N'All of the above', 1, 45)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (174, N'Christianity', 0, 45)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (175, N'Through an analog phone booth', 0, 46)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (176, N'Through his home computer', 0, 46)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (177, N'All of the above', 1, 46)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (178, N'Christianity', 0, 46)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (179, N'Through an analog phone booth', 0, 47)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (180, N'Through his home computer', 0, 47)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (181, N'All of the above', 1, 47)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (182, N'Christianity', 0, 47)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (183, N'Through an analog phone booth', 0, 48)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (184, N'Through his home computer', 0, 48)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (185, N'All of the above', 1, 48)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (186, N'Christianity', 0, 48)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (187, N'Through an analog phone booth', 0, 49)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (188, N'Through his home computer', 0, 49)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (189, N'All of the above', 1, 49)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (190, N'Christianity', 0, 49)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (191, N'Through an analog phone booth', 0, 50)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (192, N'Through his home computer', 0, 50)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (193, N'All of the above', 1, 50)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (194, N'Christianity', 0, 50)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (195, N'Through an analog phone booth', 0, 51)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (196, N'Through his home computer', 0, 51)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (197, N'All of the above', 1, 51)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (198, N'Christianity', 0, 51)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (199, N'Through an analog phone booth', 0, 52)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (200, N'Through his home computer', 0, 52)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (201, N'All of the above', 1, 52)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (202, N'Christianity', 0, 52)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (203, N'Through an analog phone booth', 0, 53)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (204, N'Through his home computer', 0, 53)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (205, N'All of the above', 1, 53)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (206, N'Christianity', 0, 53)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (207, N'Through an analog phone booth', 0, 54)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (208, N'Through his home computer', 0, 54)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (209, N'All of the above', 1, 54)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (210, N'Christianity', 0, 54)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (211, N'Through an analog phone booth', 0, 55)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (212, N'Through his home computer', 0, 55)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (213, N'All of the above', 1, 55)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (214, N'Christianity', 0, 55)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (215, N'Through an analog phone booth', 0, 56)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (216, N'Through his home computer', 0, 56)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (217, N'All of the above', 1, 56)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (218, N'Christianity', 0, 56)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (219, N'Through an analog phone booth', 0, 57)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (220, N'Through his home computer', 0, 57)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (221, N'All of the above', 1, 57)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (222, N'Christianity', 0, 57)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (223, N'Through an analog phone booth', 0, 58)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (224, N'Through his home computer', 0, 58)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (225, N'All of the above', 1, 58)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (226, N'Christianity', 0, 58)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (227, N'Through an analog phone booth', 0, 59)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (228, N'Through his home computer', 0, 59)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (229, N'All of the above', 1, 59)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (230, N'Christianity', 0, 59)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (231, N'Through an analog phone booth', 0, 60)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (232, N'Through his home computer', 0, 60)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (233, N'All of the above', 1, 60)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (234, N'Christianity', 0, 60)
GO
SET IDENTITY_INSERT [dbo].[Answer] OFF
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 
GO
INSERT [dbo].[Blog] ([blogId], [blogName], [blogDate], [blogDetail], [img]) VALUES (1, N'Mathematics', CAST(N'2023-09-21' AS Date), N'About this Specialization For a lot of higher level courses in Machine Learning and Data Science, you find you need to freshen up on the basics in mathematics - stuff you may have studied before in school or university.', N'https://teky.edu.vn/blog/wp-content/uploads/2020/12/tai-sao-phai-hoc-toan.jpg')
GO
INSERT [dbo].[Blog] ([blogId], [blogName], [blogDate], [blogDetail], [img]) VALUES (2, N'English ', CAST(N'2023-09-21' AS Date), N'This Specialization helps you improve your professional communication in English for successful business interactions. Each course focuses on a particular area of communication in English.', N'https://www.baolongan.vn/image/news/2021/20210225/images/%E1%BB%A9ng-d%E1%BB%A5ng-h%E1%BB%8Dc-ti%E1%BA%BFng-anh-1.jpg')
GO
INSERT [dbo].[Blog] ([blogId], [blogName], [blogDate], [blogDetail], [img]) VALUES (3, N'
Social Studies', CAST(N'2023-09-21' AS Date), N'In this course, you will learn how social workers in the United States engage in creating change and supporting the resilience of individuals, families and communities in this new era.', N'https://icsvietnam.com/wp-content/uploads/2021/10/acellus-social-studies-grade-4.jpg')
GO
INSERT [dbo].[Blog] ([blogId], [blogName], [blogDate], [blogDetail], [img]) VALUES (4, N' World Languages World Languages', CAST(N'2023-09-21' AS Date), N'Through this course, you can understand Korean more deeply and get advanced Korean language skills. This course is for advanced Korean learners who are interested in Korean language and culture.', N'https://static.ybox.vn/2017/7/10/e37588c0-6523-11e7-a229-cac091044fd5.png')
GO
INSERT [dbo].[Blog] ([blogId], [blogName], [blogDate], [blogDetail], [img]) VALUES (5, N'
Science', CAST(N'2023-09-21' AS Date), N'The course aims to explain the scientific principles and techniques behind the work of forensic scientists and will be illustrated with numerous case studies from Singapore and around the world.', N'https://waki.vn/wp-content/uploads/2019/09/tranh-treo-lop-day-them-tranh-treo-phong-hoc-85-768x768.jpg')
GO
INSERT [dbo].[Blog] ([blogId], [blogName], [blogDate], [blogDetail], [img]) VALUES (6, N'Computer Science and Skills', CAST(N'2023-09-21' AS Date), N'This Specialization is intended for anyone seeking to learn basic computer skills. Through 3 courses, you will study computer hardware, software, and data safety.', N'https://codelearn.io/Upload/Blog/nganh-khoa-hoc-may-tinh-hoc-gi-va-lam-gi-63735649002.0205.jpg')
GO
INSERT [dbo].[Blog] ([blogId], [blogName], [blogDate], [blogDetail], [img]) VALUES (7, N'Career and Technical Education', CAST(N'2023-09-21' AS Date), N' This course is the first of a series that aims to prepare you for a role as an entry-level IT Support Specialist. In this course, you’ll be introduced to the world of Information Technology, or IT.', N'https://pointarenaschools.org/wp-content/uploads/2016/11/cte-768x779.png')
GO
INSERT [dbo].[Blog] ([blogId], [blogName], [blogDate], [blogDetail], [img]) VALUES (8, N'Creative Arts', CAST(N'2023-09-21' AS Date), N'Graphic design is all around us, in a myriad of forms, both on screen and in print, yet it is always made up of images and words to create a communication goal.
', N'https://sace.edu.vn/wp-content/uploads/2021/07/Untitled-design-4-e1626838605485.png')
GO
INSERT [dbo].[Blog] ([blogId], [blogName], [blogDate], [blogDetail], [img]) VALUES (9, N'Health and Physical Education', CAST(N'2023-09-21' AS Date), N'The vital signs – heart rate, blood pressure, body temperature, respiration rate, and pain – communicate important information about the physiological status of the human body.', N'https://www.shutterstock.com/image-photo/pe-teacher-smiling-wearing-leggings-260nw-1505260688.jpg')
GO
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[Chapter] ON 
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (1, N'Chapter 1', N'Matrix', 1, NULL, 1, N'ok')
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (2, N'Chapter 1.1', N'Add, Subtract Matrix', 1, NULL, 1, N'ok')
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (3, N'Chapter 2', N'Vector', 1, NULL, 1, N'ok')
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (4, N'Chapter 2.1', N'Trees', 1, NULL, 1, N'ok')
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (5, N'Chapter 2.2', N'Probability, Basic Overview', 1, NULL, 1, N'ok')
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (6, N'Chapter 1', N'Adverb Clause of Concession', 1, NULL, 2, N'ok')
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (7, N'Chapter 1', N'Traffic Rules', 1, NULL, 3, N'ok')
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (8, N'Chapter 1', N'Nationalities and Languages', 1, NULL, 4, N'ok')
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (9, N'Chapter 1', N'Transition Metals', 1, NULL, 5, N'ok')
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (10, N'Chapter 1', N'Map of Computer Science', 1, NULL, 6, N'ok')
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (11, N'Chapter 1', N'What Is Career and Technical Education (CTE)?', 1, NULL, 7, N'ok')
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (12, N'Chapter 1', N'Elements of Art: Color', 1, NULL, 8, N'ok')
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (13, N'Chapter 1', N'An introduction for teachers', 1, NULL, 9, N'ok')
GO
SET IDENTITY_INSERT [dbo].[Chapter] OFF
GO
SET IDENTITY_INSERT [dbo].[Lesstion] ON 
GO
INSERT [dbo].[Lesstion] ([lesstionId], [lesstion_url], [status], [title], [content], [backlink], [notes], [public], [subid], [chapterid]) VALUES (2, N'img/2.png', 1, N'Math Class', N'About this Specialization For a lot of higher level courses in Machine Learning and Data Science, you find you need to freshen up on the basics in mathematics - stuff you may have studied before in school or university.', N'', N'Sale for Math', 1, 1, NULL)
GO
INSERT [dbo].[Lesstion] ([lesstionId], [lesstion_url], [status], [title], [content], [backlink], [notes], [public], [subid], [chapterid]) VALUES (3, N'img/3.png', 1, N'English Class', N'This Specialization helps you improve your professional communication in English for successful business interactions. Each course focuses on a particular area of communication in English.', N'', N'Sale for English', 1, 2, NULL)
GO
INSERT [dbo].[Lesstion] ([lesstionId], [lesstion_url], [status], [title], [content], [backlink], [notes], [public], [subid], [chapterid]) VALUES (4, N'img/4.png', 1, N'Health & Physical Education', N'The vital signs – heart rate, blood pressure, body temperature, respiration rate, and pain – communicate important information about the physiological status of the human body.', N'', N'Sale for Health', 1, 9, NULL)
GO
INSERT [dbo].[Lesstion] ([lesstionId], [lesstion_url], [status], [title], [content], [backlink], [notes], [public], [subid], [chapterid]) VALUES (5, N'img/5.png', 1, N'History Class', N'This course is the first of a series that aims to prepare you for a role as an entry-level IT Support Specialist. In this course, you’ll be introduced to the world of Information Technology, or IT.', N'', N'Sale for Technical', 1, 7, NULL)
GO
INSERT [dbo].[Lesstion] ([lesstionId], [lesstion_url], [status], [title], [content], [backlink], [notes], [public], [subid], [chapterid]) VALUES (6, N'img/6.png', 1, N'Computer Class', N'This Specialization is intended for anyone seeking to learn basic computer skills. Through 3 courses, you will study computer hardware, software, and data safety. ', N'', N'Sale for Computer', 1, 6, NULL)
GO
INSERT [dbo].[Lesstion] ([lesstionId], [lesstion_url], [status], [title], [content], [backlink], [notes], [public], [subid], [chapterid]) VALUES (7, N'img/7.png', 1, N'Art Class', N'Graphic design is all around us, in a myriad of forms, both on screen and in print, yet it is always made up of images and words to create a communication goal. ', N'', N'Sale for Arts', 1, 8, NULL)
GO
SET IDENTITY_INSERT [dbo].[Lesstion] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 
GO
INSERT [dbo].[Post] ([postId], [thumbnail], [userId], [categoryBlogId], [content], [created_date], [edit_date], [status], [brifInfor], [title], [postFileId]) VALUES (1, N'https://ik.imagekit.io/tgx/wp-content/uploads/2018/11/get-featured-image-wordpress-1024x536.png', 1, 1, N'Colossal pyramids, imposing temples, golden treasures, enigmatic hieroglyphs, powerful pharaohs, strange gods, and mysterious mummies are features of Ancient Egyptian culture that have fascinated people over the millennia.  The Bible refers to its gods, rulers, and pyramids. Neighboring cultures in the ancient Near East and Mediterranean wrote about its god-like kings and its seemingly endless supply of gold.  The Greeks and Romans describe aspects of Egypts culture and history.<br> As the 19th century began, the Napoleonic campaign in Egypt highlighted the wonders of this ancient land, and public interest soared.  Not long after, Champollion deciphered Egypts hieroglyphs and paved the way for other scholars to reveal that Egyptian texts dealt with medicine, dentistry, veterinary practices, mathematics, literature, and Usering, and many other topics. Then, early in the 20th century, Howard Carter discovered the tomb of Tutankhamun and its fabulous contents. Exhibitions of this treasure a few decades later resulted in the worlds first blockbuster, and its revival in the 21st century has kept interest alive.<br> Join Dr. David Silverman, Professor of Egyptology at Penn, Curator in Charge of the Egyptian Section of the Penn Museum, and curator of the Tutankhamun exhibitions  on a guided tour of the mysteries and wonders of this ancient land.  He has developed this online course and set it in the galleries of the world famous Penn Museum.  He uses many original Egyptian artifacts to illustrate his lectures as he guides students as they make their own discovery of this fascinating culture.', CAST(N'2022-06-02' AS Date), CAST(N'2022-07-05' AS Date), 1, N'Math Phan so', N'Math Practice', 1)
GO
INSERT [dbo].[Post] ([postId], [thumbnail], [userId], [categoryBlogId], [content], [created_date], [edit_date], [status], [brifInfor], [title], [postFileId]) VALUES (2, N'https://cdn3.wpbeginner.com/wp-content/uploads/2020/04/featuredimageswp-og.png', 2, 2, N'Physical indicates connected with, pertaining to, the animal or human body as a material organism: physical strength, exercise. Bodily means belonging to, concerned with, the human body', CAST(N'2021-08-09' AS Date), CAST(N'2021-07-10' AS Date), 1, N'Portugal', N'Physical', 2)
GO
INSERT [dbo].[Post] ([postId], [thumbnail], [userId], [categoryBlogId], [content], [created_date], [edit_date], [status], [brifInfor], [title], [postFileId]) VALUES (3, N'https://cdn3.wpbeginner.com/wp-content/uploads/2020/04/featuredimageswp-og.png', 3, 3, N'Computer software is programming code executed on a computer processor. The code can be machine-level code, or code written for an operating system.', CAST(N'2021-11-06' AS Date), CAST(N'2022-05-24' AS Date), 1, N'Computer', N'Computer', 3)
GO
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Post_File] ON 
GO
INSERT [dbo].[Post_File] ([id], [name], [typeId], [filePost]) VALUES (1, N'Practice Math last week', N'P1', N'https://quizizz.com/join/quiz/6274f38387588c001d98c6ac/start?studentShare=true')
GO
INSERT [dbo].[Post_File] ([id], [name], [typeId], [filePost]) VALUES (2, N'Theory chia het', N'P2', N'https://quizizz.com/join/quiz/62899740d87d08001dc5467f/start?studentShare=true')
GO
INSERT [dbo].[Post_File] ([id], [name], [typeId], [filePost]) VALUES (3, N'The first Conditional Sentence ', N'P1', N'https://quizizz.com/join/quiz/624ff423ba2320001e9bd949/start?studentShare=true')
GO
SET IDENTITY_INSERT [dbo].[Post_File] OFF
GO
SET IDENTITY_INSERT [dbo].[PricePackage] ON 
GO
INSERT [dbo].[PricePackage] ([priceId], [name], [acessDuration], [price], [status], [description]) VALUES (1, N'3 month access package', 3, 3600, 1, N'')
GO
INSERT [dbo].[PricePackage] ([priceId], [name], [acessDuration], [price], [status], [description]) VALUES (2, N'6 month access package', 6, 5000, 1, N'')
GO
INSERT [dbo].[PricePackage] ([priceId], [name], [acessDuration], [price], [status], [description]) VALUES (3, N'Unlimited access package', 0, 10000, 1, N'')
GO
SET IDENTITY_INSERT [dbo].[PricePackage] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (1, N'How many steps are there to construct the IFE matrix?', 1, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (2, N'Which religion is referenced in The Matrix trilogy?', 1, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (3, N'How does the Nebuchadnezzar initially contact Neo?', 1, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (4, N' Who persistently refers to Neo as Mr. Anderson?', 1, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (5, N'What proverb is written in Latin over the Oracle’s kitchen door?', 1, 2, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (6, N'Why do Morpheus, Trinity, and Neo initially visit the Merovingian?', 1, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (7, N'Which crew member’s body does Agent Smith infiltrate?', 1, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (8, N'Which adverb best completes the sentence?She __ laid the baby in the crib.**the adverb needs to tell how', 1, 6, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (9, N'Which adverb best completes the sentence?_____, I baked brownies.**The adverb needs to tell when.', 1, 6, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (10, N'Which adverb best completes the sentence?Derek took his wagon __.**The adverb needs to tell where.', 1, 6, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (11, N'Which adverb tells where?', 1, 6, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (12, N'TestMutiple', 1, 6, N'medium', 1, 1)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (13, N'Which adverb tells where?', 2, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (14, N'Which adverb tells where?', 2, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (15, N'Which crew member’s body does Agent Smith infiltrate?', 2, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (16, N'How many steps are there to construct the IFE matrix?', 3, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (17, N'Which religion is referenced in The Matrix trilogy?', 3, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (18, N'How does the Nebuchadnezzar initially contact Neo?', 3, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (19, N' Who persistently refers to Neo as Mr. Anderson?', 3, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (20, N'What proverb is written in Latin over the Oracle’s kitchen door?', 3, 2, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (21, N'What proverb is written in Latin over the Oracle’s kitchen door?', 3, 2, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (22, N'Why do Morpheus, Trinity, and Neo initially visit the Merovingian?', 3, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (23, N'Which crew member’s body does Agent Smith infiltrate?', 3, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (24, N'Which adverb best completes the sentence?She __ laid the baby in the crib.**the adverb needs to tell how', 3, 6, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (25, N'Which adverb best completes the sentence?_____, I baked brownies.**The adverb needs to tell when.', 3, 6, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (26, N'Which adverb best completes the sentence?Derek took his wagon __.**The adverb needs to tell where.', 3, 6, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (27, N'Which adverb tells where?', 3, 3, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (28, N'TestMutiple', 3, 3, N'medium', 1, 1)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (29, N'Which adverb tells where?', 3, 3, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (30, N'Which adverb tells where?', 3, 2, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (31, N'Which crew member’s body does Agent Smith infiltrate?', 3, 2, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (32, N'How many steps are there to construct the IFE matrix?', 4, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (33, N'Which religion is referenced in The Matrix trilogy?', 4, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (34, N'How does the Nebuchadnezzar initially contact Neo?', 4, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (35, N' Who persistently refers to Neo as Mr. Anderson?', 4, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (36, N'What proverb is written in Latin over the Oracle’s kitchen door?', 4, 2, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (37, N'Why do Morpheus, Trinity, and Neo initially visit the Merovingian?', 4, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (38, N'Which crew member’s body does Agent Smith infiltrate?', 4, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (39, N'Which adverb best completes the sentence?She __ laid the baby in the crib.**the adverb needs to tell how', 4, 6, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (40, N'Which adverb best completes the sentence?_____, I baked brownies.**The adverb needs to tell when.', 4, 6, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (41, N'Which adverb best completes the sentence?Derek took his wagon __.**The adverb needs to tell where.', 4, 6, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (42, N'Which adverb tells where?', 4, 3, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (43, N'TestMutiple', 4, 3, N'medium', 1, 1)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (44, N'Which adverb tells where?', 4, 3, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (45, N'Which adverb tells where?', 4, 2, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (46, N'Which crew member’s body does Agent Smith infiltrate?', 4, 2, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (47, N'How many steps are there to construct the IFE matrix?', 5, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (48, N'Which religion is referenced in The Matrix trilogy?', 5, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (49, N'How does the Nebuchadnezzar initially contact Neo?', 5, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (50, N' Who persistently refers to Neo as Mr. Anderson?', 5, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (51, N'What proverb is written in Latin over the Oracle’s kitchen door?', 5, 2, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (52, N'Why do Morpheus, Trinity, and Neo initially visit the Merovingian?', 5, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (53, N'Which crew member’s body does Agent Smith infiltrate?', 5, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (54, N'Which adverb best completes the sentence?She __ laid the baby in the crib.**the adverb needs to tell how', 5, 6, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (55, N'Which adverb best completes the sentence?_____, I baked brownies.**The adverb needs to tell when.', 5, 6, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (56, N'Which adverb best completes the sentence?Derek took his wagon __.**The adverb needs to tell where.', 5, 6, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (57, N'Which adverb tells where?', 5, 3, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (58, N'TestMutiple', 5, 3, N'medium', 1, 1)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (59, N'Which adverb tells where?', 5, 3, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (60, N'Which adverb tells where?', 5, 2, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (61, N'Which crew member’s body does Agent Smith infiltrate?', 5, 2, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (62, N'How many steps are there to construct the IFE matrix?', 6, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (63, N'Which religion is referenced in The Matrix trilogy?', 6, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (64, N'How does the Nebuchadnezzar initially contact Neo?', 6, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (65, N' Who persistently refers to Neo as Mr. Anderson?', 6, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (66, N'What proverb is written in Latin over the Oracle’s kitchen door?', 6, 2, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (67, N'Why do Morpheus, Trinity, and Neo initially visit the Merovingian?', 6, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (68, N'Which crew member’s body does Agent Smith infiltrate?', 6, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (69, N'Which adverb best completes the sentence?She __ laid the baby in the crib.**the adverb needs to tell how', 6, 6, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (70, N'Which adverb best completes the sentence?_____, I baked brownies.**The adverb needs to tell when.', 6, 6, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (71, N'Which adverb best completes the sentence?Derek took his wagon __.**The adverb needs to tell where.', 6, 6, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (72, N'Which adverb tells where?', 6, 3, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (73, N'TestMutiple', 6, 3, N'medium', 1, 1)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (74, N'Which adverb tells where?', 6, 3, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (75, N'Which adverb tells where?', 6, 2, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (76, N'Which crew member’s body does Agent Smith infiltrate?', 6, 2, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (77, N'How many steps are there to construct the IFE matrix?', 7, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (78, N'Which religion is referenced in The Matrix trilogy?', 7, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (79, N'How does the Nebuchadnezzar initially contact Neo?', 7, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (80, N' Who persistently refers to Neo as Mr. Anderson?', 7, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (81, N'What proverb is written in Latin over the Oracle’s kitchen door?', 7, 2, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (82, N'Why do Morpheus, Trinity, and Neo initially visit the Merovingian?', 7, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (83, N'Which crew member’s body does Agent Smith infiltrate?', 7, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (84, N'Which adverb best completes the sentence?She __ laid the baby in the crib.**the adverb needs to tell how', 7, 6, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (85, N'Which adverb best completes the sentence?_____, I baked brownies.**The adverb needs to tell when.', 7, 6, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (86, N'Which adverb best completes the sentence?Derek took his wagon __.**The adverb needs to tell where.', 7, 6, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (87, N'Which adverb tells where?', 7, 3, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (88, N'TestMutiple', 7, 3, N'medium', 1, 1)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (89, N'Which adverb tells where?', 7, 3, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (90, N'Which adverb tells where?', 7, 2, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (91, N'Which crew member’s body does Agent Smith infiltrate?', 7, 2, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (92, N'How many steps are there to construct the IFE matrix?', 8, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (93, N'Which religion is referenced in The Matrix trilogy?', 8, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (94, N'How does the Nebuchadnezzar initially contact Neo?', 8, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (95, N' Who persistently refers to Neo as Mr. Anderson?', 8, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (96, N'What proverb is written in Latin over the Oracle’s kitchen door?', 8, 2, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (97, N'Why do Morpheus, Trinity, and Neo initially visit the Merovingian?', 8, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (98, N'Which crew member’s body does Agent Smith infiltrate?', 8, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (99, N'Which adverb best completes the sentence?She __ laid the baby in the crib.**the adverb needs to tell how', 8, 6, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (100, N'Which adverb best completes the sentence?_____, I baked brownies.**The adverb needs to tell when.', 8, 6, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (101, N'Which adverb best completes the sentence?Derek took his wagon __.**The adverb needs to tell where.', 8, 6, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (102, N'Which adverb tells where?', 8, 3, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (103, N'TestMutiple', 8, 3, N'medium', 1, 1)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (104, N'Which adverb tells where?', 8, 3, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (105, N'Which adverb tells where?', 8, 2, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (106, N'Which crew member’s body does Agent Smith infiltrate?', 8, 2, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (107, N'How many steps are there to construct the IFE matrix?', 9, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (108, N'Which religion is referenced in The Matrix trilogy?', 9, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (109, N'How does the Nebuchadnezzar initially contact Neo?', 9, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (110, N' Who persistently refers to Neo as Mr. Anderson?', 9, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (111, N'What proverb is written in Latin over the Oracle’s kitchen door?', 9, 2, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (112, N'Why do Morpheus, Trinity, and Neo initially visit the Merovingian?', 9, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (113, N'Which crew member’s body does Agent Smith infiltrate?', 9, 1, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (114, N'Which adverb best completes the sentence?She __ laid the baby in the crib.**the adverb needs to tell how', 9, 6, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (115, N'Which adverb best completes the sentence?_____, I baked brownies.**The adverb needs to tell when.', 9, 6, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (116, N'Which adverb best completes the sentence?Derek took his wagon __.**The adverb needs to tell where.', 9, 6, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (117, N'Which adverb tells where?', 9, 3, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (118, N'TestMutiple', 9, 3, N'medium', 1, 1)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (119, N'Which adverb tells where?', 9, 3, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (120, N'Which adverb tells where?', 9, 2, N'medium', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (121, N'Which crew member’s body does Agent Smith infiltrate?', 9, 2, N'medium', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Quiz] ON 
GO
INSERT [dbo].[Quiz] ([quizId], [title], [level], [start_time], [end_time], [public], [active], [pass_percent], [subId], [user_create_id], [quesId], [duration], [description], [totalQues], [attempt]) VALUES (1, N'Math Matrix', N'Easy', CAST(N'1900-01-01T00:30:00.000' AS DateTime), CAST(N'1900-01-01T00:15:00.000' AS DateTime), NULL, 1, 80, 1, 1, 1, 20, N'ok', 10, 4)
GO
INSERT [dbo].[Quiz] ([quizId], [title], [level], [start_time], [end_time], [public], [active], [pass_percent], [subId], [user_create_id], [quesId], [duration], [description], [totalQues], [attempt]) VALUES (2, N'Vector', N'Medium', CAST(N'1900-01-01T00:30:00.000' AS DateTime), CAST(N'1900-01-01T00:15:00.000' AS DateTime), NULL, 1, 80, 1, 1, 1, 20, N'ok', 10, 5)
GO
INSERT [dbo].[Quiz] ([quizId], [title], [level], [start_time], [end_time], [public], [active], [pass_percent], [subId], [user_create_id], [quesId], [duration], [description], [totalQues], [attempt]) VALUES (3, N'English Tense', N'Medium', CAST(N'1900-01-01T00:30:00.000' AS DateTime), CAST(N'1900-01-01T00:15:00.000' AS DateTime), NULL, 1, 80, 2, 1, 1, 20, N'ok', 10, 1)
GO
INSERT [dbo].[Quiz] ([quizId], [title], [level], [start_time], [end_time], [public], [active], [pass_percent], [subId], [user_create_id], [quesId], [duration], [description], [totalQues], [attempt]) VALUES (4, N'Social', N'Medium', CAST(N'1900-01-01T00:30:00.000' AS DateTime), CAST(N'1900-01-01T00:50:00.000' AS DateTime), NULL, 1, 8, 3, 1, 1, 20, N'ok', 10, 2)
GO
INSERT [dbo].[Quiz] ([quizId], [title], [level], [start_time], [end_time], [public], [active], [pass_percent], [subId], [user_create_id], [quesId], [duration], [description], [totalQues], [attempt]) VALUES (5, N'Progess test', N'Medium', CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, NULL, 1, 80, 2, 4, 1, 20, N'ok', 10, 1)
GO
INSERT [dbo].[Quiz] ([quizId], [title], [level], [start_time], [end_time], [public], [active], [pass_percent], [subId], [user_create_id], [quesId], [duration], [description], [totalQues], [attempt]) VALUES (6, N'Factors', N'Medium', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:15:00.000' AS DateTime), NULL, 1, 80, 5, 1, 1, 20, N'ok', 10, 2)
GO
INSERT [dbo].[Quiz] ([quizId], [title], [level], [start_time], [end_time], [public], [active], [pass_percent], [subId], [user_create_id], [quesId], [duration], [description], [totalQues], [attempt]) VALUES (7, N'Great Wall of China - Junior 1', N'Medium', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:22:00.000' AS DateTime), NULL, 1, 80, 6, 1, 1, 20, N'ok', 10, 2)
GO
INSERT [dbo].[Quiz] ([quizId], [title], [level], [start_time], [end_time], [public], [active], [pass_percent], [subId], [user_create_id], [quesId], [duration], [description], [totalQues], [attempt]) VALUES (8, N'Wonders of the Past', N'Medium', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:33:00.000' AS DateTime), NULL, 1, 80, 7, 1, 1, 20, N'ok', 10, 2)
GO
INSERT [dbo].[Quiz] ([quizId], [title], [level], [start_time], [end_time], [public], [active], [pass_percent], [subId], [user_create_id], [quesId], [duration], [description], [totalQues], [attempt]) VALUES (9, N'Animals Art', N'Medium', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:33:00.000' AS DateTime), NULL, 1, 80, 8, 1, 1, 20, N'ok', 10, 2)
GO
INSERT [dbo].[Quiz] ([quizId], [title], [level], [start_time], [end_time], [public], [active], [pass_percent], [subId], [user_create_id], [quesId], [duration], [description], [totalQues], [attempt]) VALUES (10, N'Body Health', N'Medium', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:33:00.000' AS DateTime), NULL, 1, 80, 9, 1, 1, 20, N'ok', 10, 2)
GO
INSERT [dbo].[Quiz] ([quizId], [title], [level], [start_time], [end_time], [public], [active], [pass_percent], [subId], [user_create_id], [quesId], [duration], [description], [totalQues], [attempt]) VALUES (11, N'Fact Check Ice Breaker: Two truths ...', N'meduum', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:15:00.000' AS DateTime), NULL, 1, 0, 6, 1, 1, 20, N'ok', 10, 2)
GO
INSERT [dbo].[Quiz] ([quizId], [title], [level], [start_time], [end_time], [public], [active], [pass_percent], [subId], [user_create_id], [quesId], [duration], [description], [totalQues], [attempt]) VALUES (12, N'Check for understanding during clas...', N'medium', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:30:00.000' AS DateTime), NULL, 1, 0, 7, 1, 1, 20, N'ok', 10, 2)
GO
INSERT [dbo].[Quiz] ([quizId], [title], [level], [start_time], [end_time], [public], [active], [pass_percent], [subId], [user_create_id], [quesId], [duration], [description], [totalQues], [attempt]) VALUES (13, N'Introduction Database and Database ...', N'Medium', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:15:00.000' AS DateTime), NULL, 1, 0, 8, 1, 1, 20, N'ok', 10, 2)
GO
INSERT [dbo].[Quiz] ([quizId], [title], [level], [start_time], [end_time], [public], [active], [pass_percent], [subId], [user_create_id], [quesId], [duration], [description], [totalQues], [attempt]) VALUES (14, N'Safe Sanctuary', N'Medium', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:16:00.000' AS DateTime), NULL, 1, 0, 9, 1, 1, 20, N'ok', 10, 2)
GO
SET IDENTITY_INSERT [dbo].[Quiz] OFF
GO
SET IDENTITY_INSERT [dbo].[Registration_Subject] ON 
GO
INSERT [dbo].[Registration_Subject] ([regisId], [regis_Date], [status], [subId], [priceId], [userId]) VALUES (1, CAST(N'2022-06-22' AS Date), 1, 1, 1, 6)
GO
INSERT [dbo].[Registration_Subject] ([regisId], [regis_Date], [status], [subId], [priceId], [userId]) VALUES (2, CAST(N'2022-05-22' AS Date), 1, 2, 2, 6)
GO
INSERT [dbo].[Registration_Subject] ([regisId], [regis_Date], [status], [subId], [priceId], [userId]) VALUES (3, CAST(N'2022-05-23' AS Date), 1, 3, 2, 6)
GO
INSERT [dbo].[Registration_Subject] ([regisId], [regis_Date], [status], [subId], [priceId], [userId]) VALUES (4, CAST(N'2022-05-24' AS Date), 1, 3, 1, 7)
GO
INSERT [dbo].[Registration_Subject] ([regisId], [regis_Date], [status], [subId], [priceId], [userId]) VALUES (5, CAST(N'2022-06-21' AS Date), 1, 4, 2, 7)
GO
INSERT [dbo].[Registration_Subject] ([regisId], [regis_Date], [status], [subId], [priceId], [userId]) VALUES (6, CAST(N'2023-10-13' AS Date), 1, 1, 1, 2)
GO
INSERT [dbo].[Registration_Subject] ([regisId], [regis_Date], [status], [subId], [priceId], [userId]) VALUES (7, CAST(N'2023-10-20' AS Date), 1, 1, 1, 1)
GO
INSERT [dbo].[Registration_Subject] ([regisId], [regis_Date], [status], [subId], [priceId], [userId]) VALUES (8, CAST(N'2023-10-20' AS Date), 1, 1, 1, 1)
GO
INSERT [dbo].[Registration_Subject] ([regisId], [regis_Date], [status], [subId], [priceId], [userId]) VALUES (9, CAST(N'2023-10-20' AS Date), 1, 1, 1, 2)
GO
INSERT [dbo].[Registration_Subject] ([regisId], [regis_Date], [status], [subId], [priceId], [userId]) VALUES (10, CAST(N'2023-10-20' AS Date), 1, 2, 1, 2)
GO
INSERT [dbo].[Registration_Subject] ([regisId], [regis_Date], [status], [subId], [priceId], [userId]) VALUES (11, CAST(N'2023-11-07' AS Date), 1, 1, 1, 1)
GO
INSERT [dbo].[Registration_Subject] ([regisId], [regis_Date], [status], [subId], [priceId], [userId]) VALUES (12, CAST(N'2023-11-08' AS Date), 1, 1, 1, 1)
GO
INSERT [dbo].[Registration_Subject] ([regisId], [regis_Date], [status], [subId], [priceId], [userId]) VALUES (13, CAST(N'2023-11-08' AS Date), 1, 1, 1, 2)
GO
INSERT [dbo].[Registration_Subject] ([regisId], [regis_Date], [status], [subId], [priceId], [userId]) VALUES (14, CAST(N'2023-11-08' AS Date), 1, 2, 1, 2)
GO
SET IDENTITY_INSERT [dbo].[Registration_Subject] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 
GO
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (2, N'Learner')
GO
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (3, N'Lecture')
GO
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (4, N'Sale')
GO
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (5, N'MARKETING')
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Subject] ON 
GO
INSERT [dbo].[Subject] ([subjectId], [subjectName], [status], [tagLine], [title], [thumbnail], [description]) VALUES (1, N'Math', 1, 20, N'Mathematics', N'https://cf.quizizz.com/img/course-assets/title_imgs/2%20-%20Mathematics.png', N'About this Specialization For a lot of higher level courses in Machine Learning and Data Science, you find you need to freshen up on the basics in mathematics - stuff you may have studied before in school or university.')
GO
INSERT [dbo].[Subject] ([subjectId], [subjectName], [status], [tagLine], [title], [thumbnail], [description]) VALUES (2, N'English', 1, 20, N'English and Language Arts', N'https://cf.quizizz.com/img/course-assets/title_imgs/1%20-%20English%20and%20Language%20Arts.png', N'This Specialization helps you improve your professional communication in English for successful business interactions. Each course focuses on a particular area of communication in English.')
GO
INSERT [dbo].[Subject] ([subjectId], [subjectName], [status], [tagLine], [title], [thumbnail], [description]) VALUES (3, N'Social Studies', 1, 20, N'Social Studies', N'https://cf.quizizz.com/img/course-assets/title_imgs/3%20-%20Social%20Studies.png', N'In this course, you will learn how social workers in the United States engage in creating change and supporting the resilience of individuals, families and communities in this new era.')
GO
INSERT [dbo].[Subject] ([subjectId], [subjectName], [status], [tagLine], [title], [thumbnail], [description]) VALUES (4, N'World Languages', 1, 20, N'World Languages', N'https://cf.quizizz.com/img/course-assets/title_imgs/5-%20World%20Languages.png', N'Through this course, you can understand Korean more deeply and get advanced Korean language skills. This course is for advanced Korean learners who are interested in Korean language and culture.')
GO
INSERT [dbo].[Subject] ([subjectId], [subjectName], [status], [tagLine], [title], [thumbnail], [description]) VALUES (5, N'Science', 1, 20, N'Science', N'https://cf.quizizz.com/img/course-assets/title_imgs/4%20-%20Science.png', N'The course aims to explain the scientific principles and techniques behind the work of forensic scientists and will be illustrated with numerous case studies from Singapore and around the world.')
GO
INSERT [dbo].[Subject] ([subjectId], [subjectName], [status], [tagLine], [title], [thumbnail], [description]) VALUES (6, N'Computer Science and Skills', 1, 20, N'Computer Science and Skills', N'https://cf.quizizz.com/img/course-assets/title_imgs/8%20-%20Computer%20Science.png', N'This Specialization is intended for anyone seeking to learn basic computer skills. Through 3 courses, you will study computer hardware, software, and data safety.')
GO
INSERT [dbo].[Subject] ([subjectId], [subjectName], [status], [tagLine], [title], [thumbnail], [description]) VALUES (7, N'Career and Technical Education', 1, 20, N'Career and Technical Education', N'https://cf.quizizz.com/img/course-assets/title_imgs/lifeskills_s.png', N'This course is the first of a series that aims to prepare you for a role as an entry-level IT Support Specialist. In this course, you’ll be introduced to the world of Information Technology, or IT.')
GO
INSERT [dbo].[Subject] ([subjectId], [subjectName], [status], [tagLine], [title], [thumbnail], [description]) VALUES (8, N'Creative Arts', 1, 20, N'Creative Arts', N'https://cf.quizizz.com/img/course-assets/title_imgs/6%20-%20Creative%20Arts.png', N'Graphic design is all around us, in a myriad of forms, both on screen and in print, yet it is always made up of images and words to create a communication goal.')
GO
INSERT [dbo].[Subject] ([subjectId], [subjectName], [status], [tagLine], [title], [thumbnail], [description]) VALUES (9, N'Health and Physical Education', 1, 20, N'Health and Physical Education', N'https://cf.quizizz.com/img/course-assets/title_imgs/7-%20PE%26Health.png', N'The vital signs – heart rate, blood pressure, body temperature, respiration rate, and pain – communicate important information about the physiological status of the human body.')
GO
SET IDENTITY_INSERT [dbo].[Subject] OFF
GO
INSERT [dbo].[SubjectPrice] ([priceId], [subjectId]) VALUES (3, 4)
GO
INSERT [dbo].[SubjectPrice] ([priceId], [subjectId]) VALUES (2, 2)
GO
INSERT [dbo].[SubjectPrice] ([priceId], [subjectId]) VALUES (1, 8)
GO
INSERT [dbo].[SubjectPrice] ([priceId], [subjectId]) VALUES (1, 3)
GO
INSERT [dbo].[SubjectPrice] ([priceId], [subjectId]) VALUES (3, 6)
GO
INSERT [dbo].[SubjectPrice] ([priceId], [subjectId]) VALUES (2, 1)
GO
INSERT [dbo].[SubjectPrice] ([priceId], [subjectId]) VALUES (2, 7)
GO
INSERT [dbo].[SubjectPrice] ([priceId], [subjectId]) VALUES (3, 5)
GO
INSERT [dbo].[SubjectPrice] ([priceId], [subjectId]) VALUES (1, 9)
GO
INSERT [dbo].[Type] ([typeId], [typeName]) VALUES (N'd1', N'Domain')
GO
INSERT [dbo].[Type] ([typeId], [typeName]) VALUES (N'd2', N'Group')
GO
INSERT [dbo].[Type] ([typeId], [typeName]) VALUES (N'l1', N'Subject Topic')
GO
INSERT [dbo].[Type] ([typeId], [typeName]) VALUES (N'l2', N'Lesson')
GO
INSERT [dbo].[Type] ([typeId], [typeName]) VALUES (N'l3', N'Quiz')
GO
INSERT [dbo].[Type] ([typeId], [typeName]) VALUES (N'P1', N'Question')
GO
INSERT [dbo].[Type] ([typeId], [typeName]) VALUES (N'P2', N'Lesson')
GO
INSERT [dbo].[Type] ([typeId], [typeName]) VALUES (N'P3', N'Practice')
GO
INSERT [dbo].[Type] ([typeId], [typeName]) VALUES (N'Q1', N'Practice')
GO
INSERT [dbo].[Type] ([typeId], [typeName]) VALUES (N'Q2', N'Exam')
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([userId], [username], [password], [status], [email], [phone], [fullname], [address], [gender], [avatar], [roleId], [created_date], [modify_date], [password_token]) VALUES (1, N'admin', N'123456', 1, N'admin123@gmail.com', N'09123456', N'Nguyễn Văn An', N'Hà Nội', 1, N'', 2, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2024-12-02T14:02:51.493' AS DateTime), N'')
GO
INSERT [dbo].[User] ([userId], [username], [password], [status], [email], [phone], [fullname], [address], [gender], [avatar], [roleId], [created_date], [modify_date], [password_token]) VALUES (2, N'customer', N'123456', 1, N'customer123@gmail.com', N'09123456', N'Nguyễn Văn B', N'Hà Nội', 1, N'', 2, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2024-12-02T09:45:38.713' AS DateTime), N'')
GO
INSERT [dbo].[User] ([userId], [username], [password], [status], [email], [phone], [fullname], [address], [gender], [avatar], [roleId], [created_date], [modify_date], [password_token]) VALUES (3, N'expert', N'123456', 1, N'expert123@gmail.com', N'09123456', N'Nguyễn Thị C', N'Hà Nội', 1, N'', 3, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'')
GO
INSERT [dbo].[User] ([userId], [username], [password], [status], [email], [phone], [fullname], [address], [gender], [avatar], [roleId], [created_date], [modify_date], [password_token]) VALUES (4, N'sale', N'123456', 1, N'sale123@gmail.com', N'091234567', N'Lê Thị D', N'Hà Nội', 0, N'', 4, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'')
GO
INSERT [dbo].[User] ([userId], [username], [password], [status], [email], [phone], [fullname], [address], [gender], [avatar], [roleId], [created_date], [modify_date], [password_token]) VALUES (5, N'marketing', N'123456', 1, N'marketing123@gmail.com', N'0912345678', N'Mai Van E', N'Hà Nội', 1, N'', 5, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2024-12-02T09:19:27.647' AS DateTime), N'')
GO
INSERT [dbo].[User] ([userId], [username], [password], [status], [email], [phone], [fullname], [address], [gender], [avatar], [roleId], [created_date], [modify_date], [password_token]) VALUES (6, N'test', N'123456', 1, NULL, NULL, NULL, NULL, 1, NULL, 2, CAST(N'2022-06-22T20:00:41.927' AS DateTime), CAST(N'2022-06-22T20:00:41.927' AS DateTime), N'')
GO
INSERT [dbo].[User] ([userId], [username], [password], [status], [email], [phone], [fullname], [address], [gender], [avatar], [roleId], [created_date], [modify_date], [password_token]) VALUES (7, N'test2', N'123456', 1, NULL, NULL, NULL, NULL, 1, NULL, 2, CAST(N'2022-06-22T00:00:00.000' AS DateTime), CAST(N'2022-06-22T00:00:00.000' AS DateTime), N'')
GO
INSERT [dbo].[User] ([userId], [username], [password], [status], [email], [phone], [fullname], [address], [gender], [avatar], [roleId], [created_date], [modify_date], [password_token]) VALUES (8, NULL, N'Duc123@', NULL, N'duc@gmail.com', N'0378459002', N'abc', NULL, 0, NULL, 2, CAST(N'2023-10-13T11:28:39.857' AS DateTime), CAST(N'2023-10-13T11:28:39.857' AS DateTime), NULL)
GO
INSERT [dbo].[User] ([userId], [username], [password], [status], [email], [phone], [fullname], [address], [gender], [avatar], [roleId], [created_date], [modify_date], [password_token]) VALUES (9, NULL, N'123456', NULL, N'ronaldo@gmail.com', N'0334546932', N'Nguyen Hieu', N'Hà Nội', 0, NULL, 3, CAST(N'2023-11-08T08:41:40.723' AS DateTime), CAST(N'2023-11-08T08:41:40.723' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Post] ADD  CONSTRAINT [DF_Post_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Registration_Subject] ADD  CONSTRAINT [DF_Registration_Subject_regis_Date]  DEFAULT (getdate()) FOR [regis_Date]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_modify_date]  DEFAULT (getdate()) FOR [modify_date]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([quesId])
REFERENCES [dbo].[Question] ([questionId])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question]
GO
ALTER TABLE [dbo].[Chapter]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_Subject] FOREIGN KEY([subId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Chapter] CHECK CONSTRAINT [FK_Lesson_Subject]
GO
ALTER TABLE [dbo].[Lesstion]  WITH CHECK ADD  CONSTRAINT [FK_Lesstion_Chapter] FOREIGN KEY([chapterid])
REFERENCES [dbo].[Chapter] ([chapterId])
GO
ALTER TABLE [dbo].[Lesstion] CHECK CONSTRAINT [FK_Lesstion_Chapter]
GO
ALTER TABLE [dbo].[Lesstion]  WITH CHECK ADD  CONSTRAINT [FK_Lesstion_Subject] FOREIGN KEY([subid])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Lesstion] CHECK CONSTRAINT [FK_Lesstion_Subject]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Blog] FOREIGN KEY([categoryBlogId])
REFERENCES [dbo].[Blog] ([blogId])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Blog]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Post_File] FOREIGN KEY([postFileId])
REFERENCES [dbo].[Post_File] ([id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Post_File]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_User]
GO
ALTER TABLE [dbo].[Post_File]  WITH CHECK ADD  CONSTRAINT [FK_Post_File_Type] FOREIGN KEY([typeId])
REFERENCES [dbo].[Type] ([typeId])
GO
ALTER TABLE [dbo].[Post_File] CHECK CONSTRAINT [FK_Post_File_Type]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Lesson] FOREIGN KEY([chapterId])
REFERENCES [dbo].[Chapter] ([chapterId])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Lesson]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Subject] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Subject]
GO
ALTER TABLE [dbo].[Question_Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Question_Quiz_Question] FOREIGN KEY([quesId])
REFERENCES [dbo].[Question] ([questionId])
GO
ALTER TABLE [dbo].[Question_Quiz] CHECK CONSTRAINT [FK_Question_Quiz_Question]
GO
ALTER TABLE [dbo].[Question_Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Question_Quiz_Quiz] FOREIGN KEY([quizId])
REFERENCES [dbo].[Quiz] ([quizId])
GO
ALTER TABLE [dbo].[Question_Quiz] CHECK CONSTRAINT [FK_Question_Quiz_Quiz]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_Subject] FOREIGN KEY([subId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FK_Quiz_Subject]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_User] FOREIGN KEY([user_create_id])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FK_Quiz_User]
GO
ALTER TABLE [dbo].[Quiz_Answer_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_Question_Detail_Quiz_Detail] FOREIGN KEY([quiz_detail_id])
REFERENCES [dbo].[Quiz_Detail] ([quiz_detail_id])
GO
ALTER TABLE [dbo].[Quiz_Answer_Detail] CHECK CONSTRAINT [FK_Quiz_Question_Detail_Quiz_Detail]
GO
ALTER TABLE [dbo].[Quiz_Chapter]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_Chapter_Chapter] FOREIGN KEY([chapterid])
REFERENCES [dbo].[Chapter] ([chapterId])
GO
ALTER TABLE [dbo].[Quiz_Chapter] CHECK CONSTRAINT [FK_Quiz_Chapter_Chapter]
GO
ALTER TABLE [dbo].[Quiz_Chapter]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_Chapter_Quiz] FOREIGN KEY([quizid])
REFERENCES [dbo].[Quiz] ([quizId])
GO
ALTER TABLE [dbo].[Quiz_Chapter] CHECK CONSTRAINT [FK_Quiz_Chapter_Quiz]
GO
ALTER TABLE [dbo].[Quiz_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_Detail_Quiz] FOREIGN KEY([quizId])
REFERENCES [dbo].[Quiz] ([quizId])
GO
ALTER TABLE [dbo].[Quiz_Detail] CHECK CONSTRAINT [FK_Quiz_Detail_Quiz]
GO
ALTER TABLE [dbo].[Registration_Subject]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Subject_PricePackage] FOREIGN KEY([priceId])
REFERENCES [dbo].[PricePackage] ([priceId])
GO
ALTER TABLE [dbo].[Registration_Subject] CHECK CONSTRAINT [FK_Registration_Subject_PricePackage]
GO
ALTER TABLE [dbo].[Registration_Subject]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Subject_Subject] FOREIGN KEY([subId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Registration_Subject] CHECK CONSTRAINT [FK_Registration_Subject_Subject]
GO
ALTER TABLE [dbo].[Registration_Subject]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Subject_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[Registration_Subject] CHECK CONSTRAINT [FK_Registration_Subject_User]
GO
ALTER TABLE [dbo].[SubjectPrice]  WITH CHECK ADD  CONSTRAINT [FK_SubjectPrice_PricePackage] FOREIGN KEY([priceId])
REFERENCES [dbo].[PricePackage] ([priceId])
GO
ALTER TABLE [dbo].[SubjectPrice] CHECK CONSTRAINT [FK_SubjectPrice_PricePackage]
GO
ALTER TABLE [dbo].[SubjectPrice]  WITH CHECK ADD  CONSTRAINT [FK_SubjectPrice_Subject] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[SubjectPrice] CHECK CONSTRAINT [FK_SubjectPrice_Subject]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([roleId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [SWP391_DB] SET  READ_WRITE 
GO
