USE [master]
GO
/****** Object:  Database [Diagnostic Center Bill System]    Script Date: 9/5/2017 1:55:06 PM ******/
CREATE DATABASE [Diagnostic Center Bill System]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Diagnostic Center Bill System', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Diagnostic Center Bill System.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Diagnostic Center Bill System_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Diagnostic Center Bill System_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Diagnostic Center Bill System] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Diagnostic Center Bill System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Diagnostic Center Bill System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Diagnostic Center Bill System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Diagnostic Center Bill System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Diagnostic Center Bill System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Diagnostic Center Bill System] SET ARITHABORT OFF 
GO
ALTER DATABASE [Diagnostic Center Bill System] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Diagnostic Center Bill System] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Diagnostic Center Bill System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Diagnostic Center Bill System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Diagnostic Center Bill System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Diagnostic Center Bill System] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Diagnostic Center Bill System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Diagnostic Center Bill System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Diagnostic Center Bill System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Diagnostic Center Bill System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Diagnostic Center Bill System] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Diagnostic Center Bill System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Diagnostic Center Bill System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Diagnostic Center Bill System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Diagnostic Center Bill System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Diagnostic Center Bill System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Diagnostic Center Bill System] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Diagnostic Center Bill System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Diagnostic Center Bill System] SET RECOVERY FULL 
GO
ALTER DATABASE [Diagnostic Center Bill System] SET  MULTI_USER 
GO
ALTER DATABASE [Diagnostic Center Bill System] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Diagnostic Center Bill System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Diagnostic Center Bill System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Diagnostic Center Bill System] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [Diagnostic Center Bill System]
GO
/****** Object:  Table [dbo].[t_testgridview]    Script Date: 9/5/2017 1:55:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_testgridview](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MobileNogridview] [varchar](50) NULL,
	[TestName] [varchar](150) NULL,
	[Fee] [varchar](50) NULL,
 CONSTRAINT [PK_t_testgridview] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_TestReqEntry]    Script Date: 9/5/2017 1:55:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_TestReqEntry](
	[BillNo] [int] IDENTITY(100,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[DateofBirth] [varchar](50) NOT NULL,
	[MobileNo] [varchar](50) NOT NULL,
	[Date] [date] NOT NULL,
	[TotalFee] [numeric](18, 0) NULL,
	[PaidAmount] [numeric](18, 0) NOT NULL,
	[DueAmount] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_t_TestReqEntry] PRIMARY KEY CLUSTERED 
(
	[MobileNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_Tests]    Script Date: 9/5/2017 1:55:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_Tests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Fee] [numeric](18, 0) NOT NULL,
	[TypeNameId] [int] NOT NULL,
 CONSTRAINT [PK_t_Tests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_Types]    Script Date: 9/5/2017 1:55:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_Types](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
 CONSTRAINT [PK_t_Types] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[TestAndType]    Script Date: 9/5/2017 1:55:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[TestAndType] 
AS
select  ts.Name TestName,ts.Fee Fee,tp.Name TypeName,ts.TypeNameId,tp.Id TypeId
from t_Tests ts Inner join t_Types tp
on ts.TypeNameId=tp.Id 



GO
/****** Object:  View [dbo].[asp]    Script Date: 9/5/2017 1:55:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[asp]
AS
SELECT        dbo.t_testgridview.id, dbo.t_testgridview.MobileNogridview, dbo.t_testgridview.TestName, dbo.t_testgridview.Fee, dbo.t_TestReqEntry.BillNo, dbo.t_TestReqEntry.Name, dbo.t_TestReqEntry.DateofBirth, 
                         dbo.t_TestReqEntry.MobileNo, dbo.t_TestReqEntry.Date, dbo.t_TestReqEntry.TotalFee, dbo.t_TestReqEntry.PaidAmount, dbo.t_TestReqEntry.DueAmount
FROM            dbo.t_testgridview INNER JOIN
                         dbo.t_TestReqEntry ON dbo.t_testgridview.MobileNogridview = dbo.t_TestReqEntry.MobileNo



GO
/****** Object:  View [dbo].[typewisetable]    Script Date: 9/5/2017 1:55:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[typewisetable] as


select TestAndType.TypeName,TestAndType.TestName,TestAndType.Fee,asp.Date
from TestAndType inner join asp on TestAndType.Fee=asp.Fee

GO
SET IDENTITY_INSERT [dbo].[t_testgridview] ON 

INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (1100, N'1500', N'S. Creatinine', N'350')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (1101, N'1500', N'Hand X-ray', N'200')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (1102, N'3434', N'RBS', N'150')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (1103, N'3434', N'S. Creatinine', N'350')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (1104, N'3434', N'RBS', N'150')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (1105, N'3434', N'RBS', N'150')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (1106, N'3434', N'RBS', N'150')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (1107, N'55642', N'RBS', N'150')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (1108, N'55642', N'Feet X-ray', N'300')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (1109, N'55642', N'Lower Abdomen', N'550')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (1110, N'55642', N'ECG', N'150')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (1111, N'55642', N'Echo', N'1000')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (1112, N'33', N'S. Creatinine', N'350')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (1113, N'33', N'Hand X-ray', N'200')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (1114, N'01673106468', N'RBS', N'150')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (1115, N'01673106468', N'ECG', N'150')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (1116, N'01673106468', N'Echo', N'1000')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (2035, N'01910778228', N'S. Creatinine', N'350')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (2036, N'01910778228', N'Lower Abdomen', N'550')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (2037, N'01910778228', N'ECG', N'150')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (2038, N'01910778228', N'Hand X-ray', N'200')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (2039, N'12124', N'S. Creatinine', N'350')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (2040, N'12124', N'Hand X-ray', N'200')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (2041, N'12124', N'Lower Abdomen', N'550')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (2042, N'12124', N'ECG', N'150')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (2043, N'12124', N'Echo', N'1000')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (2044, N'6688', N'RBS', N'150')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (2045, N'6688', N'LS Spine', N'1100')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (2046, N'6688', N'Feet X-ray', N'300')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (2047, N'01762709943', N'Urin Test', N'500')
INSERT [dbo].[t_testgridview] ([id], [MobileNogridview], [TestName], [Fee]) VALUES (2048, N'01762709943', N'ECG', N'150')
SET IDENTITY_INSERT [dbo].[t_testgridview] OFF
SET IDENTITY_INSERT [dbo].[t_TestReqEntry] ON 

INSERT [dbo].[t_TestReqEntry] ([BillNo], [Name], [DateofBirth], [MobileNo], [Date], [TotalFee], [PaidAmount], [DueAmount]) VALUES (125, N'osan', N'1993-01-08', N'01673106468', CAST(0xB53B0B00 AS Date), CAST(1300 AS Numeric(18, 0)), CAST(1300 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)))
INSERT [dbo].[t_TestReqEntry] ([BillNo], [Name], [DateofBirth], [MobileNo], [Date], [TotalFee], [PaidAmount], [DueAmount]) VALUES (1107, N'kamol', N'2017-09-05', N'01762709943', CAST(0x403D0B00 AS Date), CAST(650 AS Numeric(18, 0)), CAST(650 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)))
INSERT [dbo].[t_TestReqEntry] ([BillNo], [Name], [DateofBirth], [MobileNo], [Date], [TotalFee], [PaidAmount], [DueAmount]) VALUES (1104, N'shaon', N'2016-08-12', N'01910778228', CAST(0xB53B0B00 AS Date), CAST(1250 AS Numeric(18, 0)), CAST(1250 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)))
INSERT [dbo].[t_TestReqEntry] ([BillNo], [Name], [DateofBirth], [MobileNo], [Date], [TotalFee], [PaidAmount], [DueAmount]) VALUES (1105, N'Name', N'2016-08-17', N'12124', CAST(0xB53B0B00 AS Date), CAST(2250 AS Numeric(18, 0)), CAST(400 AS Numeric(18, 0)), CAST(1850 AS Numeric(18, 0)))
INSERT [dbo].[t_TestReqEntry] ([BillNo], [Name], [DateofBirth], [MobileNo], [Date], [TotalFee], [PaidAmount], [DueAmount]) VALUES (1106, N'kkmodi', N'2016-08-02', N'6688', CAST(0xB63B0B00 AS Date), CAST(1550 AS Numeric(18, 0)), CAST(500 AS Numeric(18, 0)), CAST(1050 AS Numeric(18, 0)))
SET IDENTITY_INSERT [dbo].[t_TestReqEntry] OFF
SET IDENTITY_INSERT [dbo].[t_Tests] ON 

INSERT [dbo].[t_Tests] ([Id], [Name], [Fee], [TypeNameId]) VALUES (20, N'Complete Blood count (Total Count-Differential Count-ESR, Hb %)', CAST(400 AS Numeric(18, 0)), 10)
INSERT [dbo].[t_Tests] ([Id], [Name], [Fee], [TypeNameId]) VALUES (21, N'RBS', CAST(150 AS Numeric(18, 0)), 10)
INSERT [dbo].[t_Tests] ([Id], [Name], [Fee], [TypeNameId]) VALUES (22, N'S. Creatinine', CAST(350 AS Numeric(18, 0)), 10)
INSERT [dbo].[t_Tests] ([Id], [Name], [Fee], [TypeNameId]) VALUES (23, N'Lipid profile', CAST(450 AS Numeric(18, 0)), 10)
INSERT [dbo].[t_Tests] ([Id], [Name], [Fee], [TypeNameId]) VALUES (24, N'Hand X-ray', CAST(200 AS Numeric(18, 0)), 11)
INSERT [dbo].[t_Tests] ([Id], [Name], [Fee], [TypeNameId]) VALUES (25, N'Feet X-ray', CAST(300 AS Numeric(18, 0)), 11)
INSERT [dbo].[t_Tests] ([Id], [Name], [Fee], [TypeNameId]) VALUES (26, N'LS Spine', CAST(1100 AS Numeric(18, 0)), 11)
INSERT [dbo].[t_Tests] ([Id], [Name], [Fee], [TypeNameId]) VALUES (27, N'Lower Abdomen', CAST(550 AS Numeric(18, 0)), 12)
INSERT [dbo].[t_Tests] ([Id], [Name], [Fee], [TypeNameId]) VALUES (28, N'Whole Abdomen', CAST(800 AS Numeric(18, 0)), 12)
INSERT [dbo].[t_Tests] ([Id], [Name], [Fee], [TypeNameId]) VALUES (29, N'Pregnancy profile', CAST(550 AS Numeric(18, 0)), 12)
INSERT [dbo].[t_Tests] ([Id], [Name], [Fee], [TypeNameId]) VALUES (30, N'ECG', CAST(150 AS Numeric(18, 0)), 13)
INSERT [dbo].[t_Tests] ([Id], [Name], [Fee], [TypeNameId]) VALUES (31, N'Echo', CAST(1000 AS Numeric(18, 0)), 14)
INSERT [dbo].[t_Tests] ([Id], [Name], [Fee], [TypeNameId]) VALUES (32, N'Urin Test', CAST(500 AS Numeric(18, 0)), 15)
SET IDENTITY_INSERT [dbo].[t_Tests] OFF
SET IDENTITY_INSERT [dbo].[t_Types] ON 

INSERT [dbo].[t_Types] ([Id], [Name]) VALUES (10, N'Blood')
INSERT [dbo].[t_Types] ([Id], [Name]) VALUES (11, N'X-Ray')
INSERT [dbo].[t_Types] ([Id], [Name]) VALUES (12, N'USG')
INSERT [dbo].[t_Types] ([Id], [Name]) VALUES (13, N'ECG')
INSERT [dbo].[t_Types] ([Id], [Name]) VALUES (14, N'Echo')
INSERT [dbo].[t_Types] ([Id], [Name]) VALUES (15, N'Urin')
SET IDENTITY_INSERT [dbo].[t_Types] OFF
ALTER TABLE [dbo].[t_testgridview]  WITH CHECK ADD  CONSTRAINT [FK_t_testgridview_t_testgridview] FOREIGN KEY([id])
REFERENCES [dbo].[t_testgridview] ([id])
GO
ALTER TABLE [dbo].[t_testgridview] CHECK CONSTRAINT [FK_t_testgridview_t_testgridview]
GO
ALTER TABLE [dbo].[t_Tests]  WITH CHECK ADD  CONSTRAINT [FK_t_Tests_t_Tests] FOREIGN KEY([TypeNameId])
REFERENCES [dbo].[t_Types] ([Id])
GO
ALTER TABLE [dbo].[t_Tests] CHECK CONSTRAINT [FK_t_Tests_t_Tests]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[0] 2[4] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "t_testgridview"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 225
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t_TestReqEntry"
            Begin Extent = 
               Top = 6
               Left = 263
               Bottom = 136
               Right = 433
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'asp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'asp'
GO
USE [master]
GO
ALTER DATABASE [Diagnostic Center Bill System] SET  READ_WRITE 
GO
