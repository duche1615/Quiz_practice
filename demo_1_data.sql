USE [QuizPractice]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([CategoryId], [Name], [Description]) VALUES (1, N'Mathematics', N'Questions related to algebra, geometry, calculus, and other math topics.')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name], [Description]) VALUES (2, N'Science', N'Questions covering physics, chemistry, biology, and general science.')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name], [Description]) VALUES (3, N'History', N'Questions about historical events, figures, and periods.')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name], [Description]) VALUES (4, N'Geography', N'Questions on physical and political geography, maps, and locations.')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name], [Description]) VALUES (5, N'Literature', N'Questions on literary works, authors, and literary terms.')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name], [Description]) VALUES (6, N'Languages', N'Questions on grammar, vocabulary, and language usage.')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name], [Description]) VALUES (7, N'Art', N'Questions about art history, techniques, and famous artworks.')
GO
INSERT [dbo].[Categories] ([CategoryId], [Name], [Description]) VALUES (8, N'Physical Education', N'Questions on sports, fitness, and health education.')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Subjects] ON 
GO
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Description], [UpdatedDate], [CategoryId]) VALUES (1, N'Algebra', N'Questions related to algebraic expressions, equations, and functions.', CAST(N'2024-11-28T04:40:44.7766667' AS DateTime2), 1)
GO
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Description], [UpdatedDate], [CategoryId]) VALUES (2, N'Physics', N'Questions covering mechanics, thermodynamics, and electromagnetism.', CAST(N'2024-11-28T04:40:44.7766667' AS DateTime2), 2)
GO
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Description], [UpdatedDate], [CategoryId]) VALUES (3, N'World History', N'Questions about significant historical events and figures.', CAST(N'2024-11-28T04:40:44.7766667' AS DateTime2), 3)
GO
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Description], [UpdatedDate], [CategoryId]) VALUES (4, N'Geography', N'Questions on physical and political geography, maps, and locations.', CAST(N'2024-11-28T04:40:44.7766667' AS DateTime2), 4)
GO
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Description], [UpdatedDate], [CategoryId]) VALUES (5, N'English Literature', N'Questions on literary works, authors, and literary terms.', CAST(N'2024-11-28T04:40:44.7766667' AS DateTime2), 5)
GO
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Description], [UpdatedDate], [CategoryId]) VALUES (6, N'French', N'Questions on French grammar, vocabulary, and language usage.', CAST(N'2024-11-28T04:40:44.7766667' AS DateTime2), 6)
GO
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Description], [UpdatedDate], [CategoryId]) VALUES (7, N'Art History', N'Questions about art history, techniques, and famous artworks.', CAST(N'2024-11-28T04:40:44.7766667' AS DateTime2), 7)
GO
INSERT [dbo].[Subjects] ([SubjectId], [Name], [Description], [UpdatedDate], [CategoryId]) VALUES (8, N'Health Education', N'Questions on sports, fitness, and health education.', CAST(N'2024-11-28T04:40:44.7766667' AS DateTime2), 8)
GO
SET IDENTITY_INSERT [dbo].[Subjects] OFF
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241127085417_InitialCreate', N'6.0.36')
GO
