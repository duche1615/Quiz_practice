USE [master]
GO
/****** Object:  Database [SWP391_DB]    Script Date: 12/15/2024 4:39:41 AM ******/
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
/****** Object:  Table [dbo].[Answer]    Script Date: 12/15/2024 4:39:41 AM ******/
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
/****** Object:  Table [dbo].[Blog]    Script Date: 12/15/2024 4:39:41 AM ******/
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
/****** Object:  Table [dbo].[Chapter]    Script Date: 12/15/2024 4:39:41 AM ******/
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
	[description] [varchar](max) NULL,
 CONSTRAINT [PK__Lesson__F88A977848BD6CBE] PRIMARY KEY CLUSTERED 
(
	[chapterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lession]    Script Date: 12/15/2024 4:39:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lession](
	[lessionId] [int] IDENTITY(1,1) NOT NULL,
	[lessionURL] [varchar](max) NULL,
	[status] [bit] NULL,
	[title] [varchar](255) NULL,
	[content] [varchar](255) NOT NULL,
	[backlink] [varchar](max) NULL,
	[notes] [varchar](255) NULL,
	[public] [bit] NULL,
	[subid] [int] NULL,
	[chapterid] [int] NULL,
 CONSTRAINT [PK__Slider__14564CBEC251D15F] PRIMARY KEY CLUSTERED 
(
	[lessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 12/15/2024 4:39:41 AM ******/
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
/****** Object:  Table [dbo].[Post_File]    Script Date: 12/15/2024 4:39:41 AM ******/
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
/****** Object:  Table [dbo].[PricePackage]    Script Date: 12/15/2024 4:39:41 AM ******/
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
/****** Object:  Table [dbo].[Question]    Script Date: 12/15/2024 4:39:41 AM ******/
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
/****** Object:  Table [dbo].[Question_Quiz]    Script Date: 12/15/2024 4:39:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question_Quiz](
	[quiz_question_id] [int] IDENTITY(1,1) NOT NULL,
	[quesId] [int] NOT NULL,
	[quizId] [int] NOT NULL,
 CONSTRAINT [PK_Question_Quiz] PRIMARY KEY CLUSTERED 
(
	[quiz_question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 12/15/2024 4:39:41 AM ******/
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
/****** Object:  Table [dbo].[Quiz_Answer_Detail]    Script Date: 12/15/2024 4:39:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz_Answer_Detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quiz_detail_id] [int] NOT NULL,
	[questionId] [int] NOT NULL,
	[selected_answer_id] [int] NOT NULL,
	[true_answer_id] [int] NOT NULL,
	[isCorrect] [bit] NOT NULL,
 CONSTRAINT [PK_Quiz_Answer_Detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz_Chapter]    Script Date: 12/15/2024 4:39:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz_Chapter](
	[quiz_chapter_id] [int] IDENTITY(1,1) NOT NULL,
	[quizid] [int] NOT NULL,
	[chapterid] [int] NOT NULL,
 CONSTRAINT [PK_Quiz_Chapter] PRIMARY KEY CLUSTERED 
(
	[quiz_chapter_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz_Detail]    Script Date: 12/15/2024 4:39:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz_Detail](
	[quiz_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[quizId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[taken_date] [datetime] NOT NULL,
	[score] [float] NOT NULL,
 CONSTRAINT [PK_Quiz_Detail] PRIMARY KEY CLUSTERED 
(
	[quiz_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration_Subject]    Script Date: 12/15/2024 4:39:41 AM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 12/15/2024 4:39:41 AM ******/
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
/****** Object:  Table [dbo].[Subject]    Script Date: 12/15/2024 4:39:41 AM ******/
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
	[thumbnail] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[subjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubjectPrice]    Script Date: 12/15/2024 4:39:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectPrice](
	[priceId] [int] NULL,
	[subjectId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 12/15/2024 4:39:41 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 12/15/2024 4:39:41 AM ******/
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
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (1, N'0', 0, 1)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (2, N'1', 1, 1)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (3, N'2', 0, 1)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (4, N'3', 0, 1)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (5, N'1', 0, 2)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (6, N'2', 1, 2)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (7, N'3', 0, 2)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (8, N'4', 0, 2)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (9, N'2', 0, 3)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (10, N'3', 1, 3)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (11, N'4', 0, 3)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (12, N'5', 0, 3)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (13, N'3', 0, 4)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (14, N'4', 1, 4)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (15, N'5', 0, 4)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (16, N'6', 0, 4)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (17, N'4', 0, 5)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (18, N'5', 1, 5)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (19, N'6', 0, 5)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (20, N'7', 0, 5)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (21, N'5', 0, 6)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (22, N'6', 1, 6)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (23, N'7', 0, 6)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (24, N'8', 0, 6)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (25, N'6', 0, 7)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (26, N'7', 1, 7)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (27, N'8', 0, 7)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (28, N'9', 0, 7)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (29, N'7', 0, 8)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (30, N'8', 1, 8)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (31, N'9', 0, 8)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (32, N'10', 0, 8)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (33, N'8', 0, 9)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (34, N'9', 1, 9)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (35, N'10', 0, 9)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (36, N'11', 0, 9)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (37, N'9', 0, 10)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (38, N'10', 1, 10)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (39, N'11', 0, 10)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (40, N'12', 0, 10)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (41, N'10', 0, 11)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (42, N'11', 1, 11)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (43, N'12', 0, 11)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (44, N'13', 0, 11)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (45, N'11', 0, 12)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (46, N'12', 1, 12)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (47, N'13', 0, 12)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (48, N'14', 0, 12)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (49, N'12', 0, 13)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (50, N'13', 1, 13)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (51, N'14', 0, 13)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (52, N'15', 0, 13)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (53, N'13', 0, 14)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (54, N'14', 1, 14)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (55, N'15', 0, 14)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (56, N'16', 0, 14)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (57, N'14', 0, 15)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (58, N'15', 1, 15)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (59, N'16', 0, 15)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (60, N'17', 0, 15)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (61, N'15', 0, 16)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (62, N'16', 1, 16)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (63, N'17', 0, 16)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (64, N'18', 0, 16)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (65, N'16', 0, 17)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (66, N'17', 1, 17)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (67, N'18', 0, 17)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (68, N'19', 0, 17)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (69, N'17', 0, 18)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (70, N'18', 1, 18)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (71, N'19', 0, 18)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (72, N'20', 0, 18)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (73, N'18', 0, 19)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (74, N'19', 1, 19)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (75, N'20', 0, 19)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (76, N'21', 0, 19)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (77, N'19', 0, 20)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (78, N'20', 1, 20)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (79, N'21', 0, 20)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (80, N'22', 0, 20)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (81, N'20', 0, 21)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (82, N'21', 1, 21)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (83, N'22', 0, 21)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (84, N'23', 0, 21)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (85, N'21', 0, 22)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (86, N'22', 1, 22)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (87, N'23', 0, 22)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (88, N'24', 0, 22)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (89, N'22', 0, 23)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (90, N'23', 1, 23)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (91, N'24', 0, 23)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (92, N'25', 0, 23)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (93, N'23', 0, 24)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (94, N'24', 1, 24)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (95, N'25', 0, 24)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (96, N'26', 0, 24)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (97, N'24', 0, 25)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (98, N'25', 1, 25)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (99, N'26', 0, 25)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (100, N'27', 0, 25)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (101, N'25', 0, 26)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (102, N'26', 1, 26)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (103, N'27', 0, 26)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (104, N'28', 0, 26)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (105, N'26', 0, 27)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (106, N'27', 1, 27)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (107, N'28', 0, 27)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (108, N'29', 0, 27)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (109, N'27', 0, 28)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (110, N'28', 1, 28)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (111, N'29', 0, 28)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (112, N'30', 0, 28)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (113, N'28', 0, 29)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (114, N'29', 1, 29)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (115, N'30', 0, 29)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (116, N'31', 0, 29)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (117, N'29', 0, 30)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (118, N'30', 1, 30)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (119, N'31', 0, 30)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (120, N'32', 0, 30)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (121, N'30', 0, 31)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (122, N'31', 1, 31)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (123, N'32', 0, 31)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (124, N'33', 0, 31)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (125, N'31', 0, 32)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (126, N'32', 1, 32)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (127, N'33', 0, 32)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (128, N'34', 0, 32)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (129, N'32', 0, 33)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (130, N'33', 1, 33)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (131, N'34', 0, 33)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (132, N'35', 0, 33)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (133, N'33', 0, 34)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (134, N'34', 1, 34)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (135, N'35', 0, 34)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (136, N'36', 0, 34)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (137, N'34', 0, 35)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (138, N'35', 1, 35)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (139, N'36', 0, 35)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (140, N'37', 0, 35)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (141, N'35', 0, 36)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (142, N'36', 1, 36)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (143, N'37', 0, 36)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (144, N'38', 0, 36)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (145, N'36', 0, 37)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (146, N'37', 1, 37)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (147, N'38', 0, 37)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (148, N'39', 0, 37)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (149, N'37', 0, 38)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (150, N'38', 1, 38)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (151, N'39', 0, 38)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (152, N'40', 0, 38)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (153, N'38', 0, 39)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (154, N'39', 1, 39)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (155, N'40', 0, 39)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (156, N'41', 0, 39)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (157, N'39', 0, 40)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (158, N'40', 1, 40)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (159, N'41', 0, 40)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (160, N'42', 0, 40)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (161, N'40', 0, 41)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (162, N'41', 1, 41)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (163, N'42', 0, 41)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (164, N'43', 0, 41)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (165, N'41', 0, 42)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (166, N'42', 1, 42)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (167, N'43', 0, 42)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (168, N'44', 0, 42)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (169, N'42', 0, 43)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (170, N'43', 1, 43)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (171, N'44', 0, 43)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (172, N'45', 0, 43)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (173, N'43', 0, 44)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (174, N'44', 1, 44)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (175, N'45', 0, 44)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (176, N'46', 0, 44)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (177, N'44', 0, 45)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (178, N'45', 1, 45)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (179, N'46', 0, 45)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (180, N'47', 0, 45)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (181, N'45', 0, 46)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (182, N'46', 1, 46)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (183, N'47', 0, 46)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (184, N'48', 0, 46)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (185, N'46', 0, 47)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (186, N'47', 1, 47)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (187, N'48', 0, 47)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (188, N'49', 0, 47)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (189, N'47', 0, 48)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (190, N'48', 1, 48)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (191, N'49', 0, 48)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (192, N'50', 0, 48)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (193, N'48', 0, 49)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (194, N'49', 1, 49)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (195, N'50', 0, 49)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (196, N'51', 0, 49)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (197, N'49', 0, 50)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (198, N'50', 1, 50)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (199, N'51', 0, 50)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (200, N'52', 0, 50)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (201, N'50', 0, 51)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (202, N'51', 1, 51)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (203, N'52', 0, 51)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (204, N'53', 0, 51)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (205, N'51', 0, 52)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (206, N'52', 1, 52)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (207, N'53', 0, 52)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (208, N'54', 0, 52)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (209, N'52', 0, 53)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (210, N'53', 1, 53)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (211, N'54', 0, 53)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (212, N'55', 0, 53)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (213, N'53', 0, 54)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (214, N'54', 1, 54)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (215, N'55', 0, 54)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (216, N'56', 0, 54)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (217, N'54', 0, 55)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (218, N'55', 1, 55)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (219, N'56', 0, 55)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (220, N'57', 0, 55)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (221, N'55', 0, 56)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (222, N'56', 1, 56)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (223, N'57', 0, 56)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (224, N'58', 0, 56)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (225, N'56', 0, 57)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (226, N'57', 1, 57)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (227, N'58', 0, 57)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (228, N'59', 0, 57)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (229, N'57', 0, 58)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (230, N'58', 1, 58)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (231, N'59', 0, 58)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (232, N'60', 0, 58)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (233, N'58', 0, 59)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (234, N'59', 1, 59)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (235, N'60', 0, 59)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (236, N'61', 0, 59)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (237, N'59', 0, 60)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (238, N'60', 1, 60)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (239, N'61', 0, 60)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (240, N'62', 0, 60)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (241, N'60', 0, 61)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (242, N'61', 1, 61)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (243, N'62', 0, 61)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (244, N'63', 0, 61)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (245, N'61', 0, 62)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (246, N'62', 1, 62)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (247, N'63', 0, 62)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (248, N'64', 0, 62)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (249, N'62', 0, 63)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (250, N'63', 1, 63)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (251, N'64', 0, 63)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (252, N'65', 0, 63)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (253, N'63', 0, 64)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (254, N'64', 1, 64)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (255, N'65', 0, 64)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (256, N'66', 0, 64)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (257, N'64', 0, 65)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (258, N'65', 1, 65)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (259, N'66', 0, 65)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (260, N'67', 0, 65)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (261, N'65', 0, 66)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (262, N'66', 1, 66)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (263, N'67', 0, 66)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (264, N'68', 0, 66)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (265, N'66', 0, 67)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (266, N'67', 1, 67)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (267, N'68', 0, 67)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (268, N'69', 0, 67)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (269, N'67', 0, 68)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (270, N'68', 1, 68)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (271, N'69', 0, 68)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (272, N'70', 0, 68)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (273, N'68', 0, 69)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (274, N'69', 1, 69)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (275, N'70', 0, 69)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (276, N'71', 0, 69)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (277, N'69', 0, 70)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (278, N'70', 1, 70)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (279, N'71', 0, 70)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (280, N'72', 0, 70)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (281, N'70', 0, 71)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (282, N'71', 1, 71)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (283, N'72', 0, 71)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (284, N'73', 0, 71)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (285, N'71', 0, 72)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (286, N'72', 1, 72)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (287, N'73', 0, 72)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (288, N'74', 0, 72)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (289, N'72', 0, 73)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (290, N'73', 1, 73)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (291, N'74', 0, 73)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (292, N'75', 0, 73)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (293, N'73', 0, 74)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (294, N'74', 1, 74)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (295, N'75', 0, 74)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (296, N'76', 0, 74)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (297, N'74', 0, 75)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (298, N'75', 1, 75)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (299, N'76', 0, 75)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (300, N'77', 0, 75)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (301, N'75', 0, 76)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (302, N'76', 1, 76)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (303, N'77', 0, 76)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (304, N'78', 0, 76)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (305, N'76', 0, 77)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (306, N'77', 1, 77)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (307, N'78', 0, 77)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (308, N'79', 0, 77)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (309, N'77', 0, 78)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (310, N'78', 1, 78)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (311, N'79', 0, 78)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (312, N'80', 0, 78)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (313, N'78', 0, 79)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (314, N'79', 1, 79)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (315, N'80', 0, 79)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (316, N'81', 0, 79)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (317, N'79', 0, 80)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (318, N'80', 1, 80)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (319, N'81', 0, 80)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (320, N'82', 0, 80)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (321, N'80', 0, 81)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (322, N'81', 1, 81)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (323, N'82', 0, 81)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (324, N'83', 0, 81)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (325, N'81', 0, 82)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (326, N'82', 1, 82)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (327, N'83', 0, 82)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (328, N'84', 0, 82)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (329, N'82', 0, 83)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (330, N'83', 1, 83)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (331, N'84', 0, 83)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (332, N'85', 0, 83)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (333, N'83', 0, 84)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (334, N'84', 1, 84)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (335, N'85', 0, 84)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (336, N'86', 0, 84)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (337, N'84', 0, 85)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (338, N'85', 1, 85)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (339, N'86', 0, 85)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (340, N'87', 0, 85)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (341, N'85', 0, 86)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (342, N'86', 1, 86)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (343, N'87', 0, 86)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (344, N'88', 0, 86)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (345, N'86', 0, 87)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (346, N'87', 1, 87)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (347, N'88', 0, 87)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (348, N'89', 0, 87)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (349, N'87', 0, 88)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (350, N'88', 1, 88)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (351, N'89', 0, 88)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (352, N'90', 0, 88)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (353, N'88', 0, 89)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (354, N'89', 1, 89)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (355, N'90', 0, 89)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (356, N'91', 0, 89)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (357, N'89', 0, 90)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (358, N'90', 1, 90)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (359, N'91', 0, 90)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (360, N'92', 0, 90)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (361, N'90', 0, 91)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (362, N'91', 1, 91)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (363, N'92', 0, 91)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (364, N'93', 0, 91)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (365, N'91', 0, 92)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (366, N'92', 1, 92)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (367, N'93', 0, 92)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (368, N'94', 0, 92)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (369, N'92', 0, 93)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (370, N'93', 1, 93)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (371, N'94', 0, 93)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (372, N'95', 0, 93)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (373, N'93', 0, 94)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (374, N'94', 1, 94)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (375, N'95', 0, 94)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (376, N'96', 0, 94)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (377, N'94', 0, 95)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (378, N'95', 1, 95)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (379, N'96', 0, 95)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (380, N'97', 0, 95)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (381, N'95', 0, 96)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (382, N'96', 1, 96)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (383, N'97', 0, 96)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (384, N'98', 0, 96)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (385, N'96', 0, 97)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (386, N'97', 1, 97)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (387, N'98', 0, 97)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (388, N'99', 0, 97)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (389, N'97', 0, 98)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (390, N'98', 1, 98)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (391, N'99', 0, 98)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (392, N'100', 0, 98)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (393, N'98', 0, 99)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (394, N'99', 1, 99)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (395, N'100', 0, 99)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (396, N'101', 0, 99)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (397, N'99', 0, 100)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (398, N'100', 1, 100)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (399, N'101', 0, 100)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (400, N'102', 0, 100)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (401, N'100', 0, 101)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (402, N'101', 1, 101)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (403, N'102', 0, 101)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (404, N'103', 0, 101)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (405, N'101', 0, 102)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (406, N'102', 1, 102)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (407, N'103', 0, 102)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (408, N'104', 0, 102)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (409, N'102', 0, 103)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (410, N'103', 1, 103)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (411, N'104', 0, 103)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (412, N'105', 0, 103)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (413, N'103', 0, 104)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (414, N'104', 1, 104)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (415, N'105', 0, 104)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (416, N'106', 0, 104)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (417, N'104', 0, 105)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (418, N'105', 1, 105)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (419, N'106', 0, 105)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (420, N'107', 0, 105)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (421, N'105', 0, 106)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (422, N'106', 1, 106)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (423, N'107', 0, 106)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (424, N'108', 0, 106)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (425, N'106', 0, 107)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (426, N'107', 1, 107)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (427, N'108', 0, 107)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (428, N'109', 0, 107)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (429, N'107', 0, 108)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (430, N'108', 1, 108)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (431, N'109', 0, 108)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (432, N'110', 0, 108)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (433, N'108', 0, 109)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (434, N'109', 1, 109)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (435, N'110', 0, 109)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (436, N'111', 0, 109)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (437, N'109', 0, 110)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (438, N'110', 1, 110)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (439, N'111', 0, 110)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (440, N'112', 0, 110)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (441, N'110', 0, 111)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (442, N'111', 1, 111)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (443, N'112', 0, 111)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (444, N'113', 0, 111)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (445, N'111', 0, 112)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (446, N'112', 1, 112)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (447, N'113', 0, 112)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (448, N'114', 0, 112)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (449, N'112', 0, 113)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (450, N'113', 1, 113)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (451, N'114', 0, 113)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (452, N'115', 0, 113)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (453, N'113', 0, 114)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (454, N'114', 1, 114)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (455, N'115', 0, 114)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (456, N'116', 0, 114)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (457, N'114', 0, 115)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (458, N'115', 1, 115)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (459, N'116', 0, 115)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (460, N'117', 0, 115)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (461, N'115', 0, 116)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (462, N'116', 1, 116)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (463, N'117', 0, 116)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (464, N'118', 0, 116)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (465, N'116', 0, 117)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (466, N'117', 1, 117)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (467, N'118', 0, 117)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (468, N'119', 0, 117)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (469, N'117', 0, 118)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (470, N'118', 1, 118)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (471, N'119', 0, 118)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (472, N'120', 0, 118)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (473, N'118', 0, 119)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (474, N'119', 1, 119)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (475, N'120', 0, 119)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (476, N'121', 0, 119)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (477, N'119', 0, 120)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (478, N'120', 1, 120)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (479, N'121', 0, 120)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (480, N'122', 0, 120)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (481, N'120', 0, 121)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (482, N'121', 1, 121)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (483, N'122', 0, 121)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (484, N'123', 0, 121)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (485, N'121', 0, 122)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (486, N'122', 1, 122)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (487, N'123', 0, 122)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (488, N'124', 0, 122)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (489, N'122', 0, 123)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (490, N'123', 1, 123)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (491, N'124', 0, 123)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (492, N'125', 0, 123)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (493, N'123', 0, 124)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (494, N'124', 1, 124)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (495, N'125', 0, 124)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (496, N'126', 0, 124)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (497, N'124', 0, 125)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (498, N'125', 1, 125)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (499, N'126', 0, 125)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (500, N'127', 0, 125)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (501, N'125', 0, 126)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (502, N'126', 1, 126)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (503, N'127', 0, 126)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (504, N'128', 0, 126)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (505, N'126', 0, 127)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (506, N'127', 1, 127)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (507, N'128', 0, 127)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (508, N'129', 0, 127)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (509, N'127', 0, 128)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (510, N'128', 1, 128)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (511, N'129', 0, 128)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (512, N'130', 0, 128)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (513, N'128', 0, 129)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (514, N'129', 1, 129)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (515, N'130', 0, 129)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (516, N'131', 0, 129)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (517, N'129', 0, 130)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (518, N'130', 1, 130)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (519, N'131', 0, 130)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (520, N'132', 0, 130)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (521, N'130', 0, 131)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (522, N'131', 1, 131)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (523, N'132', 0, 131)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (524, N'133', 0, 131)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (525, N'131', 0, 132)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (526, N'132', 1, 132)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (527, N'133', 0, 132)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (528, N'134', 0, 132)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (529, N'132', 0, 133)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (530, N'133', 1, 133)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (531, N'134', 0, 133)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (532, N'135', 0, 133)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (533, N'133', 0, 134)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (534, N'134', 1, 134)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (535, N'135', 0, 134)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (536, N'136', 0, 134)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (537, N'134', 0, 135)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (538, N'135', 1, 135)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (539, N'136', 0, 135)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (540, N'137', 0, 135)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (541, N'135', 0, 136)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (542, N'136', 1, 136)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (543, N'137', 0, 136)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (544, N'138', 0, 136)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (545, N'136', 0, 137)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (546, N'137', 1, 137)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (547, N'138', 0, 137)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (548, N'139', 0, 137)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (549, N'137', 0, 138)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (550, N'138', 1, 138)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (551, N'139', 0, 138)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (552, N'140', 0, 138)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (553, N'138', 0, 139)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (554, N'139', 1, 139)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (555, N'140', 0, 139)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (556, N'141', 0, 139)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (557, N'139', 0, 140)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (558, N'140', 1, 140)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (559, N'141', 0, 140)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (560, N'142', 0, 140)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (561, N'140', 0, 141)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (562, N'141', 1, 141)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (563, N'142', 0, 141)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (564, N'143', 0, 141)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (565, N'141', 0, 142)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (566, N'142', 1, 142)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (567, N'143', 0, 142)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (568, N'144', 0, 142)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (569, N'142', 0, 143)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (570, N'143', 1, 143)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (571, N'144', 0, 143)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (572, N'145', 0, 143)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (573, N'143', 0, 144)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (574, N'144', 1, 144)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (575, N'145', 0, 144)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (576, N'146', 0, 144)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (577, N'144', 0, 145)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (578, N'145', 1, 145)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (579, N'146', 0, 145)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (580, N'147', 0, 145)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (581, N'145', 0, 146)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (582, N'146', 1, 146)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (583, N'147', 0, 146)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (584, N'148', 0, 146)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (585, N'146', 0, 147)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (586, N'147', 1, 147)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (587, N'148', 0, 147)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (588, N'149', 0, 147)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (589, N'147', 0, 148)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (590, N'148', 1, 148)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (591, N'149', 0, 148)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (592, N'150', 0, 148)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (593, N'148', 0, 149)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (594, N'149', 1, 149)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (595, N'150', 0, 149)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (596, N'151', 0, 149)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (597, N'149', 0, 150)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (598, N'150', 1, 150)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (599, N'151', 0, 150)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (600, N'152', 0, 150)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (601, N'150', 0, 151)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (602, N'151', 1, 151)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (603, N'152', 0, 151)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (604, N'153', 0, 151)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (605, N'151', 0, 152)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (606, N'152', 1, 152)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (607, N'153', 0, 152)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (608, N'154', 0, 152)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (609, N'152', 0, 153)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (610, N'153', 1, 153)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (611, N'154', 0, 153)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (612, N'155', 0, 153)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (613, N'153', 0, 154)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (614, N'154', 1, 154)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (615, N'155', 0, 154)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (616, N'156', 0, 154)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (617, N'154', 0, 155)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (618, N'155', 1, 155)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (619, N'156', 0, 155)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (620, N'157', 0, 155)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (621, N'155', 0, 156)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (622, N'156', 1, 156)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (623, N'157', 0, 156)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (624, N'158', 0, 156)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (625, N'156', 0, 157)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (626, N'157', 1, 157)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (627, N'158', 0, 157)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (628, N'159', 0, 157)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (629, N'157', 0, 158)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (630, N'158', 1, 158)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (631, N'159', 0, 158)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (632, N'160', 0, 158)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (633, N'158', 0, 159)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (634, N'159', 1, 159)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (635, N'160', 0, 159)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (636, N'161', 0, 159)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (637, N'159', 0, 160)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (638, N'160', 1, 160)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (639, N'161', 0, 160)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (640, N'162', 0, 160)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (641, N'160', 0, 161)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (642, N'161', 1, 161)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (643, N'162', 0, 161)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (644, N'163', 0, 161)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (645, N'161', 0, 162)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (646, N'162', 1, 162)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (647, N'163', 0, 162)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (648, N'164', 0, 162)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (649, N'162', 0, 163)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (650, N'163', 1, 163)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (651, N'164', 0, 163)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (652, N'165', 0, 163)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (653, N'163', 0, 164)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (654, N'164', 1, 164)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (655, N'165', 0, 164)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (656, N'166', 0, 164)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (657, N'164', 0, 165)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (658, N'165', 1, 165)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (659, N'166', 0, 165)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (660, N'167', 0, 165)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (661, N'165', 0, 166)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (662, N'166', 1, 166)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (663, N'167', 0, 166)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (664, N'168', 0, 166)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (665, N'166', 0, 167)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (666, N'167', 1, 167)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (667, N'168', 0, 167)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (668, N'169', 0, 167)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (669, N'167', 0, 168)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (670, N'168', 1, 168)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (671, N'169', 0, 168)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (672, N'170', 0, 168)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (673, N'168', 0, 169)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (674, N'169', 1, 169)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (675, N'170', 0, 169)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (676, N'171', 0, 169)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (677, N'169', 0, 170)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (678, N'170', 1, 170)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (679, N'171', 0, 170)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (680, N'172', 0, 170)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (681, N'170', 0, 171)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (682, N'171', 1, 171)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (683, N'172', 0, 171)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (684, N'173', 0, 171)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (685, N'171', 0, 172)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (686, N'172', 1, 172)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (687, N'173', 0, 172)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (688, N'174', 0, 172)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (689, N'172', 0, 173)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (690, N'173', 1, 173)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (691, N'174', 0, 173)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (692, N'175', 0, 173)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (693, N'173', 0, 174)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (694, N'174', 1, 174)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (695, N'175', 0, 174)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (696, N'176', 0, 174)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (697, N'174', 0, 175)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (698, N'175', 1, 175)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (699, N'176', 0, 175)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (700, N'177', 0, 175)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (701, N'175', 0, 176)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (702, N'176', 1, 176)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (703, N'177', 0, 176)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (704, N'178', 0, 176)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (705, N'176', 0, 177)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (706, N'177', 1, 177)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (707, N'178', 0, 177)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (708, N'179', 0, 177)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (709, N'177', 0, 178)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (710, N'178', 1, 178)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (711, N'179', 0, 178)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (712, N'180', 0, 178)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (713, N'178', 0, 179)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (714, N'179', 1, 179)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (715, N'180', 0, 179)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (716, N'181', 0, 179)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (717, N'179', 0, 180)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (718, N'180', 1, 180)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (719, N'181', 0, 180)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (720, N'182', 0, 180)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (721, N'180', 0, 181)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (722, N'181', 1, 181)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (723, N'182', 0, 181)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (724, N'183', 0, 181)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (725, N'181', 0, 182)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (726, N'182', 1, 182)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (727, N'183', 0, 182)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (728, N'184', 0, 182)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (729, N'182', 0, 183)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (730, N'183', 1, 183)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (731, N'184', 0, 183)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (732, N'185', 0, 183)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (733, N'183', 0, 184)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (734, N'184', 1, 184)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (735, N'185', 0, 184)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (736, N'186', 0, 184)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (737, N'184', 0, 185)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (738, N'185', 1, 185)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (739, N'186', 0, 185)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (740, N'187', 0, 185)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (741, N'185', 0, 186)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (742, N'186', 1, 186)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (743, N'187', 0, 186)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (744, N'188', 0, 186)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (745, N'186', 0, 187)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (746, N'187', 1, 187)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (747, N'188', 0, 187)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (748, N'189', 0, 187)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (749, N'187', 0, 188)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (750, N'188', 1, 188)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (751, N'189', 0, 188)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (752, N'190', 0, 188)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (753, N'188', 0, 189)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (754, N'189', 1, 189)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (755, N'190', 0, 189)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (756, N'191', 0, 189)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (757, N'189', 0, 190)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (758, N'190', 1, 190)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (759, N'191', 0, 190)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (760, N'192', 0, 190)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (761, N'190', 0, 191)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (762, N'191', 1, 191)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (763, N'192', 0, 191)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (764, N'193', 0, 191)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (765, N'191', 0, 192)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (766, N'192', 1, 192)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (767, N'193', 0, 192)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (768, N'194', 0, 192)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (769, N'192', 0, 193)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (770, N'193', 1, 193)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (771, N'194', 0, 193)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (772, N'195', 0, 193)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (773, N'193', 0, 194)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (774, N'194', 1, 194)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (775, N'195', 0, 194)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (776, N'196', 0, 194)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (777, N'194', 0, 195)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (778, N'195', 1, 195)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (779, N'196', 0, 195)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (780, N'197', 0, 195)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (781, N'195', 0, 196)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (782, N'196', 1, 196)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (783, N'197', 0, 196)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (784, N'198', 0, 196)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (785, N'196', 0, 197)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (786, N'197', 1, 197)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (787, N'198', 0, 197)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (788, N'199', 0, 197)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (789, N'197', 0, 198)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (790, N'198', 1, 198)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (791, N'199', 0, 198)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (792, N'200', 0, 198)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (793, N'198', 0, 199)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (794, N'199', 1, 199)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (795, N'200', 0, 199)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (796, N'201', 0, 199)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (797, N'199', 0, 200)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (798, N'200', 1, 200)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (799, N'201', 0, 200)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (800, N'202', 0, 200)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (801, N'200', 0, 201)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (802, N'201', 1, 201)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (803, N'202', 0, 201)
GO
INSERT [dbo].[Answer] ([answerId], [content], [correct], [quesId]) VALUES (804, N'203', 0, 201)
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
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (1, N'Chapter 1', N'Matrix', 1, 1, 1, N'ok')
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (2, N'Chapter 2', N'Add, Subtract Matrix', 1, 1, 1, N'ok')
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (3, N'Chapter 3', N'Vector', 1, 1, 1, N'ok')
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (4, N'Chapter 4', N'Trees', 1, 1, 1, N'ok')
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (5, N'Chapter 5', N'Probability, Basic Overview', 1, 1, 1, N'ok')
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (6, N'Chapter 1', N'Adverb Clause of Concession', 1, 1, 2, N'ok')
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (7, N'Chapter 1', N'Traffic Rules', 1, 1, 3, N'ok')
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (8, N'Chapter 1', N'Nationalities and Languages', 1, 1, 4, N'ok')
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (9, N'Chapter 1', N'Transition Metals', 1, 1, 5, N'ok')
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (10, N'Chapter 1', N'Map of Computer Science', 1, 1, 6, N'ok')
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (11, N'Chapter 1', N'What Is Career and Technical Education (CTE)?', 1, 1, 7, N'ok')
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (12, N'Chapter 1', N'Elements of Art: Color', 1, 1, 8, N'ok')
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (13, N'Chapter 1', N'An introduction for teachers', 1, 1, 9, N'ok')
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (17, N'Chapter 6', N'abc', 1, 1, 1, N'abcbbcb')
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (18, N'test', N'test', 1, 1, 9, N'test')
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (19, N'Chapter 2', N'Content for Chapter 2', 1, 1, 2, NULL)
GO
INSERT [dbo].[Chapter] ([chapterId], [chapterName], [content], [active], [public], [subId], [description]) VALUES (20, N'Chapter 3', N'Content for Chapter 3', 1, 1, 2, N'ok')
GO
SET IDENTITY_INSERT [dbo].[Chapter] OFF
GO
SET IDENTITY_INSERT [dbo].[Lession] ON 
GO
INSERT [dbo].[Lession] ([lessionId], [lessionURL], [status], [title], [content], [backlink], [notes], [public], [subid], [chapterid]) VALUES (2, N'img/2.png', 1, N'Math Class', N'About this Specialization For a lot of higher level courses in Machine Learning and Data Science, you find you need to freshen up on the basics in mathematics - stuff you may have studied before in school or university.', NULL, N'Sale for Math', 1, 1, 17)
GO
INSERT [dbo].[Lession] ([lessionId], [lessionURL], [status], [title], [content], [backlink], [notes], [public], [subid], [chapterid]) VALUES (3, N'img/3.png', 1, N'English Class', N'This Specialization helps you improve your professional communication in English for successful business interactions. Each course focuses on a particular area of communication in English.', N'', N'Sale for English', 1, 2, 6)
GO
INSERT [dbo].[Lession] ([lessionId], [lessionURL], [status], [title], [content], [backlink], [notes], [public], [subid], [chapterid]) VALUES (4, N'img/4.png', 1, N'Health & Physical Education', N'The vital signs – heart rate, blood pressure, body temperature, respiration rate, and pain – communicate important information about the physiological status of the human body.', N'', N'Sale for Health', 1, 9, 7)
GO
INSERT [dbo].[Lession] ([lessionId], [lessionURL], [status], [title], [content], [backlink], [notes], [public], [subid], [chapterid]) VALUES (5, N'img/5.png', 1, N'History Class', N'This course is the first of a series that aims to prepare you for a role as an entry-level IT Support Specialist. In this course, you’ll be introduced to the world of Information Technology, or IT.', N'', N'Sale for Technical', 1, 7, 8)
GO
INSERT [dbo].[Lession] ([lessionId], [lessionURL], [status], [title], [content], [backlink], [notes], [public], [subid], [chapterid]) VALUES (6, N'img/6.png', 1, N'Computer Class', N'This Specialization is intended for anyone seeking to learn basic computer skills. Through 3 courses, you will study computer hardware, software, and data safety. ', N'', N'Sale for Computer', 1, 6, 9)
GO
INSERT [dbo].[Lession] ([lessionId], [lessionURL], [status], [title], [content], [backlink], [notes], [public], [subid], [chapterid]) VALUES (7, N'img/7.png', 1, N'Art Class', N'Graphic design is all around us, in a myriad of forms, both on screen and in print, yet it is always made up of images and words to create a communication goal. ', N'', N'Sale for Arts', 1, 8, 10)
GO
INSERT [dbo].[Lession] ([lessionId], [lessionURL], [status], [title], [content], [backlink], [notes], [public], [subid], [chapterid]) VALUES (8, N'test', 1, N'test', N'test', N'test', N'test', 1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Lession] OFF
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
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (1, N'What is 0 + 1 =?', 1, 1, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (2, N'What is 1 + 1 =?', 1, 1, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (3, N'What is 2 + 1 =?', 1, 1, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (4, N'What is 3 + 1 =?', 1, 1, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (5, N'What is 4 + 1 =?', 1, 1, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (6, N'What is 5 + 1 =?', 1, 1, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (7, N'What is 6 + 1 =?', 1, 1, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (8, N'What is 7 + 1 =?', 1, 1, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (9, N'What is 8 + 1 =?', 1, 1, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (10, N'What is 9 + 1 =?', 1, 1, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (11, N'What is 10 + 1 =?', 1, 2, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (12, N'What is 11 + 1 =?', 1, 2, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (13, N'What is 12 + 1 =?', 1, 2, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (14, N'What is 13 + 1 =?', 1, 2, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (15, N'What is 14 + 1 =?', 1, 2, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (16, N'What is 15 + 1 =?', 1, 2, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (17, N'What is 16 + 1 =?', 1, 2, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (18, N'What is 17 + 1 =?', 1, 2, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (19, N'What is 18 + 1 =?', 1, 2, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (20, N'What is 19 + 1 =?', 1, 2, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (21, N'What is 20 + 1 =?', 1, 3, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (22, N'What is 21 + 1 =?', 1, 3, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (23, N'What is 22 + 1 =?', 1, 3, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (24, N'What is 23 + 1 =?', 1, 3, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (25, N'What is 24 + 1 =?', 1, 3, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (26, N'What is 25 + 1 =?', 1, 3, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (27, N'What is 26 + 1 =?', 1, 3, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (28, N'What is 27 + 1 =?', 1, 3, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (29, N'What is 28 + 1 =?', 1, 3, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (30, N'What is 29 + 1 =?', 1, 3, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (31, N'What is 30 + 1 =?', 1, 4, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (32, N'What is 31 + 1 =?', 1, 4, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (33, N'What is 32 + 1 =?', 1, 4, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (34, N'What is 33 + 1 =?', 1, 4, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (35, N'What is 34 + 1 =?', 1, 4, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (36, N'What is 35 + 1 =?', 1, 4, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (37, N'What is 36 + 1 =?', 1, 4, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (38, N'What is 37 + 1 =?', 1, 4, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (39, N'What is 38 + 1 =?', 1, 4, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (40, N'What is 39 + 1 =?', 1, 4, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (41, N'What is 40 + 1 =?', 1, 5, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (42, N'What is 41 + 1 =?', 1, 5, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (43, N'What is 42 + 1 =?', 1, 5, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (44, N'What is 43 + 1 =?', 1, 5, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (45, N'What is 44 + 1 =?', 1, 5, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (46, N'What is 45 + 1 =?', 1, 5, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (47, N'What is 46 + 1 =?', 1, 5, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (48, N'What is 47 + 1 =?', 1, 5, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (49, N'What is 48 + 1 =?', 1, 5, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (50, N'What is 49 + 1 =?', 1, 5, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (51, N'What is 50 + 1 =?', 2, 6, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (52, N'What is 51 + 1 =?', 2, 6, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (53, N'What is 52 + 1 =?', 2, 6, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (54, N'What is 53 + 1 =?', 2, 6, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (55, N'What is 54 + 1 =?', 2, 6, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (56, N'What is 55 + 1 =?', 2, 6, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (57, N'What is 56 + 1 =?', 2, 6, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (58, N'What is 57 + 1 =?', 2, 6, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (59, N'What is 58 + 1 =?', 2, 6, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (60, N'What is 59 + 1 =?', 2, 6, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (61, N'What is 60 + 1 =?', 3, 7, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (62, N'What is 61 + 1 =?', 3, 7, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (63, N'What is 62 + 1 =?', 3, 7, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (64, N'What is 63 + 1 =?', 3, 7, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (65, N'What is 64 + 1 =?', 3, 7, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (66, N'What is 65 + 1 =?', 3, 7, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (67, N'What is 66 + 1 =?', 3, 7, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (68, N'What is 67 + 1 =?', 3, 7, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (69, N'What is 68 + 1 =?', 3, 7, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (70, N'What is 69 + 1 =?', 3, 7, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (71, N'What is 70 + 1 =?', 4, 8, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (72, N'What is 71 + 1 =?', 4, 8, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (73, N'What is 72 + 1 =?', 4, 8, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (74, N'What is 73 + 1 =?', 4, 8, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (75, N'What is 74 + 1 =?', 4, 8, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (76, N'What is 75 + 1 =?', 4, 8, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (77, N'What is 76 + 1 =?', 4, 8, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (78, N'What is 77 + 1 =?', 4, 8, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (79, N'What is 78 + 1 =?', 4, 8, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (80, N'What is 79 + 1 =?', 4, 8, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (81, N'What is 80 + 1 =?', 5, 9, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (82, N'What is 81 + 1 =?', 5, 9, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (83, N'What is 82 + 1 =?', 5, 9, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (84, N'What is 83 + 1 =?', 5, 9, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (85, N'What is 84 + 1 =?', 5, 9, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (86, N'What is 85 + 1 =?', 5, 9, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (87, N'What is 86 + 1 =?', 5, 9, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (88, N'What is 87 + 1 =?', 5, 9, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (89, N'What is 88 + 1 =?', 5, 9, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (90, N'What is 89 + 1 =?', 5, 9, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (91, N'What is 90 + 1 =?', 6, 10, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (92, N'What is 91 + 1 =?', 6, 10, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (93, N'What is 92 + 1 =?', 6, 10, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (94, N'What is 93 + 1 =?', 6, 10, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (95, N'What is 94 + 1 =?', 6, 10, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (96, N'What is 95 + 1 =?', 6, 10, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (97, N'What is 96 + 1 =?', 6, 10, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (98, N'What is 97 + 1 =?', 6, 10, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (99, N'What is 98 + 1 =?', 6, 10, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (100, N'What is 99 + 1 =?', 6, 10, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (101, N'What is 100 + 1 =?', 7, 11, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (102, N'What is 101 + 1 =?', 7, 11, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (103, N'What is 102 + 1 =?', 7, 11, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (104, N'What is 103 + 1 =?', 7, 11, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (105, N'What is 104 + 1 =?', 7, 11, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (106, N'What is 105 + 1 =?', 7, 11, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (107, N'What is 106 + 1 =?', 7, 11, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (108, N'What is 107 + 1 =?', 7, 11, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (109, N'What is 108 + 1 =?', 7, 11, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (110, N'What is 109 + 1 =?', 7, 11, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (111, N'What is 110 + 1 =?', 8, 12, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (112, N'What is 111 + 1 =?', 8, 12, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (113, N'What is 112 + 1 =?', 8, 12, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (114, N'What is 113 + 1 =?', 8, 12, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (115, N'What is 114 + 1 =?', 8, 12, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (116, N'What is 115 + 1 =?', 8, 12, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (117, N'What is 116 + 1 =?', 8, 12, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (118, N'What is 117 + 1 =?', 8, 12, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (119, N'What is 118 + 1 =?', 8, 12, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (120, N'What is 119 + 1 =?', 8, 12, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (121, N'What is 120 + 1 =?', 9, 13, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (122, N'What is 121 + 1 =?', 9, 13, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (123, N'What is 122 + 1 =?', 9, 13, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (124, N'What is 123 + 1 =?', 9, 13, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (125, N'What is 124 + 1 =?', 9, 13, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (126, N'What is 125 + 1 =?', 9, 13, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (127, N'What is 126 + 1 =?', 9, 13, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (128, N'What is 127 + 1 =?', 9, 13, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (129, N'What is 128 + 1 =?', 9, 13, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (130, N'What is 129 + 1 =?', 9, 13, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (131, N'What is 130 + 1 =?', 1, 17, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (132, N'What is 131 + 1 =?', 1, 17, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (133, N'What is 132 + 1 =?', 1, 17, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (134, N'What is 133 + 1 =?', 1, 17, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (135, N'What is 134 + 1 =?', 1, 17, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (136, N'What is 135 + 1 =?', 1, 17, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (137, N'What is 136 + 1 =?', 1, 17, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (138, N'What is 137 + 1 =?', 1, 17, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (139, N'What is 138 + 1 =?', 1, 17, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (140, N'What is 139 + 1 =?', 1, 17, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (141, N'What is 140 + 1 =?', 9, 18, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (142, N'What is 141 + 1 =?', 9, 18, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (143, N'What is 142 + 1 =?', 9, 18, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (144, N'What is 143 + 1 =?', 9, 18, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (145, N'What is 144 + 1 =?', 9, 18, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (146, N'What is 145 + 1 =?', 9, 18, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (147, N'What is 146 + 1 =?', 9, 18, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (148, N'What is 147 + 1 =?', 9, 18, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (149, N'What is 148 + 1 =?', 9, 18, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (150, N'What is 149 + 1 =?', 9, 18, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (151, N'What is 150 + 1 =?', 2, 19, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (152, N'What is 151 + 1 =?', 2, 19, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (153, N'What is 152 + 1 =?', 2, 19, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (154, N'What is 153 + 1 =?', 2, 19, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (155, N'What is 154 + 1 =?', 2, 19, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (156, N'What is 155 + 1 =?', 2, 19, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (157, N'What is 156 + 1 =?', 2, 19, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (158, N'What is 157 + 1 =?', 2, 19, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (159, N'What is 158 + 1 =?', 2, 19, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (160, N'What is 159 + 1 =?', 2, 19, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (161, N'What is 160 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (162, N'What is 161 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (163, N'What is 162 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (164, N'What is 163 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (165, N'What is 164 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (166, N'What is 165 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (167, N'What is 166 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (168, N'What is 167 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (169, N'What is 168 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (170, N'What is 169 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (171, N'What is 170 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (172, N'What is 171 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (173, N'What is 172 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (174, N'What is 173 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (175, N'What is 174 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (176, N'What is 175 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (177, N'What is 176 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (178, N'What is 177 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (179, N'What is 178 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (180, N'What is 179 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (181, N'What is 180 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (182, N'What is 181 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (183, N'What is 182 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (184, N'What is 183 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (185, N'What is 184 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (186, N'What is 185 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (187, N'What is 186 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (188, N'What is 187 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (189, N'What is 188 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (190, N'What is 189 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (191, N'What is 190 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (192, N'What is 191 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (193, N'What is 192 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (194, N'What is 193 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (195, N'What is 194 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (196, N'What is 195 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (197, N'What is 196 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (198, N'What is 197 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (199, N'What is 198 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (200, N'What is 199 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
INSERT [dbo].[Question] ([questionId], [content], [subjectId], [chapterId], [level], [status], [isMultipleChoice]) VALUES (201, N'What is 200 + 1 =?', 2, 20, N'Easy', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Question_Quiz] ON 
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (1, 20, 1)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (2, 4, 1)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (3, 17, 1)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (4, 2, 1)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (5, 18, 1)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (6, 160, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (7, 157, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (8, 183, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (9, 179, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (10, 169, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (11, 58, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (12, 165, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (13, 197, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (14, 57, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (15, 174, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (16, 56, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (17, 175, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (18, 51, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (19, 195, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (20, 53, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (21, 188, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (22, 182, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (23, 164, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (24, 172, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (25, 198, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (26, 186, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (27, 192, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (28, 166, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (29, 178, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (30, 52, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (31, 162, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (32, 154, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (33, 200, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (34, 163, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (35, 168, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (36, 176, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (37, 191, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (38, 158, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (39, 151, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (40, 193, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (41, 152, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (42, 59, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (43, 155, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (44, 167, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (45, 54, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (46, 185, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (47, 196, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (48, 159, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (49, 201, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (50, 199, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (51, 153, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (52, 194, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (53, 156, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (54, 171, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (55, 189, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (56, 170, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (57, 184, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (58, 173, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (59, 190, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (60, 177, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (61, 180, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (62, 55, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (63, 187, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (64, 181, 2)
GO
INSERT [dbo].[Question_Quiz] ([quiz_question_id], [quesId], [quizId]) VALUES (65, 60, 2)
GO
SET IDENTITY_INSERT [dbo].[Question_Quiz] OFF
GO
SET IDENTITY_INSERT [dbo].[Quiz] ON 
GO
INSERT [dbo].[Quiz] ([quizId], [title], [level], [start_time], [end_time], [public], [active], [pass_percent], [subId], [user_create_id], [duration], [description], [totalQues], [attempt]) VALUES (1, N'test1', N'Easy', CAST(N'2024-12-15T02:11:00.000' AS DateTime), CAST(N'2024-12-16T02:11:00.000' AS DateTime), NULL, 1, 80, 1, 3, 5, N'test1', 5, 0)
GO
INSERT [dbo].[Quiz] ([quizId], [title], [level], [start_time], [end_time], [public], [active], [pass_percent], [subId], [user_create_id], [duration], [description], [totalQues], [attempt]) VALUES (2, N'test2', N'Easy', CAST(N'2024-12-15T02:30:00.000' AS DateTime), CAST(N'2024-12-22T02:30:00.000' AS DateTime), NULL, 1, 80, 2, 3, 20, N'test2', 60, 0)
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
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (3, N'Lecturer')
GO
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (4, N'Sale')
GO
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (5, N'MARKETING')
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Subject] ON 
GO
INSERT [dbo].[Subject] ([subjectId], [subjectName], [status], [tagLine], [title], [thumbnail], [description]) VALUES (1, N'Math', 1, NULL, N'Mathematics', N'https://cf.quizizz.com/img/course-assets/title_imgs/2%20-%20Mathematics.png', N'About this Specialization For a lot of higher level courses in Machine Learning and Data Science, you find you need to freshen up on the basics in mathematics - stuff you may have studied before in school or university.')
GO
INSERT [dbo].[Subject] ([subjectId], [subjectName], [status], [tagLine], [title], [thumbnail], [description]) VALUES (2, N'English', 1, NULL, N'English and Language Arts', N'https://cf.quizizz.com/img/course-assets/title_imgs/1%20-%20English%20and%20Language%20Arts.png', N'This Specialization helps you improve your professional communication in English for successful business interactions. Each course focuses on a particular area of communication in English.')
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
INSERT [dbo].[User] ([userId], [username], [password], [status], [email], [phone], [fullname], [address], [gender], [avatar], [roleId], [created_date], [modify_date], [password_token]) VALUES (1, N'admin', N'123456', 1, N'admin123@gmail.com', N'1234567890', N'Nguyễn Văn An', N'Ha Noi', 1, N'', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2024-12-13T14:16:26.587' AS DateTime), N'')
GO
INSERT [dbo].[User] ([userId], [username], [password], [status], [email], [phone], [fullname], [address], [gender], [avatar], [roleId], [created_date], [modify_date], [password_token]) VALUES (2, N'customer', N'123456', 1, N'customer123@gmail.com', N'09123456', N'Nguyễn Văn B', N'Hà Nội', 1, N'', 2, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2024-12-02T09:45:38.713' AS DateTime), N'')
GO
INSERT [dbo].[User] ([userId], [username], [password], [status], [email], [phone], [fullname], [address], [gender], [avatar], [roleId], [created_date], [modify_date], [password_token]) VALUES (3, N'expert', N'123456', 1, N'expert123@gmail.com', N'09123456', N'Nguyễn Thị C', N'Hà Nội', 1, N'', 3, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'')
GO
INSERT [dbo].[User] ([userId], [username], [password], [status], [email], [phone], [fullname], [address], [gender], [avatar], [roleId], [created_date], [modify_date], [password_token]) VALUES (4, N'sale', N'123456', 1, N'sale123@gmail.com', N'091234567', N'Lê Thị D', N'Hà Nội', 0, N'', 4, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'')
GO
INSERT [dbo].[User] ([userId], [username], [password], [status], [email], [phone], [fullname], [address], [gender], [avatar], [roleId], [created_date], [modify_date], [password_token]) VALUES (5, N'marketing', N'123456', 1, N'marketing123@gmail.com', N'0912345678', N'Mai Van E', N'Hà Nội', 1, N'', 5, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2024-12-02T09:19:27.647' AS DateTime), N'')
GO
INSERT [dbo].[User] ([userId], [username], [password], [status], [email], [phone], [fullname], [address], [gender], [avatar], [roleId], [created_date], [modify_date], [password_token]) VALUES (6, N'test', N'123456', 0, NULL, NULL, NULL, NULL, 1, NULL, 2, CAST(N'2022-06-22T20:00:41.927' AS DateTime), CAST(N'2022-06-22T20:00:41.927' AS DateTime), N'')
GO
INSERT [dbo].[User] ([userId], [username], [password], [status], [email], [phone], [fullname], [address], [gender], [avatar], [roleId], [created_date], [modify_date], [password_token]) VALUES (7, N'test2', N'123456', 0, NULL, NULL, NULL, NULL, 1, NULL, 2, CAST(N'2022-06-22T00:00:00.000' AS DateTime), CAST(N'2022-06-22T00:00:00.000' AS DateTime), N'')
GO
INSERT [dbo].[User] ([userId], [username], [password], [status], [email], [phone], [fullname], [address], [gender], [avatar], [roleId], [created_date], [modify_date], [password_token]) VALUES (8, NULL, N'Duc123@', NULL, N'duc@gmail.com', N'0378459002', N'abc', NULL, 0, NULL, 2, CAST(N'2023-10-13T11:28:39.857' AS DateTime), CAST(N'2023-10-13T11:28:39.857' AS DateTime), NULL)
GO
INSERT [dbo].[User] ([userId], [username], [password], [status], [email], [phone], [fullname], [address], [gender], [avatar], [roleId], [created_date], [modify_date], [password_token]) VALUES (9, NULL, N'123456', NULL, N'ronaldo@gmail.com', N'0334546932', N'Nguyen Hieu', N'Hà Nội', 0, NULL, 3, CAST(N'2023-11-08T08:41:40.723' AS DateTime), CAST(N'2023-11-08T08:41:40.723' AS DateTime), NULL)
GO
INSERT [dbo].[User] ([userId], [username], [password], [status], [email], [phone], [fullname], [address], [gender], [avatar], [roleId], [created_date], [modify_date], [password_token]) VALUES (10, NULL, N'123456', 1, N'test@gmail.com', N'12', N'abc', N'123', 1, NULL, 2, CAST(N'2024-12-14T21:44:41.440' AS DateTime), CAST(N'2024-12-14T21:44:41.440' AS DateTime), NULL)
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
ALTER TABLE [dbo].[Lession]  WITH CHECK ADD  CONSTRAINT [FK_Lesstion_Chapter] FOREIGN KEY([chapterid])
REFERENCES [dbo].[Chapter] ([chapterId])
GO
ALTER TABLE [dbo].[Lession] CHECK CONSTRAINT [FK_Lesstion_Chapter]
GO
ALTER TABLE [dbo].[Lession]  WITH CHECK ADD  CONSTRAINT [FK_Lesstion_Subject] FOREIGN KEY([subid])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Lession] CHECK CONSTRAINT [FK_Lesstion_Subject]
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
