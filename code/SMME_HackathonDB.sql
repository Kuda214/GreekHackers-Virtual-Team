USE [SMME_Hackathon2022]
GO
/****** Object:  Table [dbo].[VAT]    Script Date: 2022/06/25 12:31:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VAT]') AND type in (N'U'))
DROP TABLE [dbo].[VAT]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 2022/06/25 12:31:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRole]') AND type in (N'U'))
DROP TABLE [dbo].[UserRole]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2022/06/25 12:31:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
DROP TABLE [dbo].[User]
GO
/****** Object:  Table [dbo].[Title]    Script Date: 2022/06/25 12:31:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Title]') AND type in (N'U'))
DROP TABLE [dbo].[Title]
GO
/****** Object:  Table [dbo].[SupplierOrder]    Script Date: 2022/06/25 12:31:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SupplierOrder]') AND type in (N'U'))
DROP TABLE [dbo].[SupplierOrder]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 2022/06/25 12:31:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Supplier]') AND type in (N'U'))
DROP TABLE [dbo].[Supplier]
GO
/****** Object:  Table [dbo].[Quotation]    Script Date: 2022/06/25 12:31:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Quotation]') AND type in (N'U'))
DROP TABLE [dbo].[Quotation]
GO
/****** Object:  Table [dbo].[Meeting_Minutes]    Script Date: 2022/06/25 12:31:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Meeting_Minutes]') AND type in (N'U'))
DROP TABLE [dbo].[Meeting_Minutes]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 2022/06/25 12:31:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Invoice]') AND type in (N'U'))
DROP TABLE [dbo].[Invoice]
GO
/****** Object:  Table [dbo].[GeneralDocument]    Script Date: 2022/06/25 12:31:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GeneralDocument]') AND type in (N'U'))
DROP TABLE [dbo].[GeneralDocument]
GO
/****** Object:  Table [dbo].[FinancialDocument]    Script Date: 2022/06/25 12:31:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FinancialDocument]') AND type in (N'U'))
DROP TABLE [dbo].[FinancialDocument]
GO
/****** Object:  Table [dbo].[Employee_Type]    Script Date: 2022/06/25 12:31:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee_Type]') AND type in (N'U'))
DROP TABLE [dbo].[Employee_Type]
GO
/****** Object:  Table [dbo].[Employee_Status]    Script Date: 2022/06/25 12:31:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee_Status]') AND type in (N'U'))
DROP TABLE [dbo].[Employee_Status]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2022/06/25 12:31:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
DROP TABLE [dbo].[Employee]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2022/06/25 12:31:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
DROP TABLE [dbo].[Customer]
GO
/****** Object:  Table [dbo].[CompanyReport]    Script Date: 2022/06/25 12:31:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CompanyReport]') AND type in (N'U'))
DROP TABLE [dbo].[CompanyReport]
GO
/****** Object:  Table [dbo].[Company_Account]    Script Date: 2022/06/25 12:31:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Company_Account]') AND type in (N'U'))
DROP TABLE [dbo].[Company_Account]
GO
/****** Object:  Table [dbo].[Company_Account]    Script Date: 2022/06/25 12:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company_Account](
	[CompanyAccountID] [int] IDENTITY(1,1) NOT NULL,
	[Company_EmailAddress] [varchar](50) NULL,
	[CompanyPassword] [nvarchar](max) NULL,
 CONSTRAINT [PK_Company_Account] PRIMARY KEY CLUSTERED 
(
	[CompanyAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyReport]    Script Date: 2022/06/25 12:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyReport](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[ReportTitle] [varchar](50) NULL,
	[ReportDescription] [varchar](150) NULL,
	[ImageName] [varchar](max) NULL,
	[ImagePath] [nvarchar](max) NULL,
	[CompanyAccountID] [int] NULL,
 CONSTRAINT [PK_CompanyReport] PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2022/06/25 12:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_Name] [varchar](50) NULL,
	[Customer_Surname] [varchar](50) NULL,
	[Customer_Email] [varchar](max) NULL,
	[Customer_Cellphone] [varchar](15) NULL,
	[Gender] [varchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2022/06/25 12:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Employee_ID] [int] IDENTITY(1,1) NOT NULL,
	[Emp_FirstName] [varchar](50) NULL,
	[Emp_SecondName] [varchar](50) NULL,
	[Emp_Surname] [varchar](50) NULL,
	[Emp_EmailAddress] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[Ethnicity] [varchar](50) NULL,
	[Emp_PhysicalAddress] [varchar](300) NULL,
	[Emp_TypeID] [int] NULL,
	[DateEmployed] [date] NULL,
	[Emp_StatusID] [int] NULL,
	[Image_Of_ID_Name] [varchar](max) NULL,
	[Image_Of_ID_Path] [nvarchar](max) NULL,
	[BankStatement_Image] [varchar](max) NULL,
	[BankStatement_ImagePath] [nvarchar](max) NULL,
	[TitleID] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_Status]    Script Date: 2022/06/25 12:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Status](
	[Emp_StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Employee_Status] [varchar](50) NULL,
 CONSTRAINT [PK_Employee_Status] PRIMARY KEY CLUSTERED 
(
	[Emp_StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_Type]    Script Date: 2022/06/25 12:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Type](
	[Emp_TypeID] [int] IDENTITY(1,1) NOT NULL,
	[Employee_Type_Description] [varchar](50) NULL,
 CONSTRAINT [PK_Employee_Type] PRIMARY KEY CLUSTERED 
(
	[Emp_TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinancialDocument]    Script Date: 2022/06/25 12:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinancialDocument](
	[FinanceID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentTitle] [varchar](50) NULL,
	[DocumentDescription] [varchar](150) NULL,
	[ImageName] [varchar](max) NULL,
	[ImagePath] [nvarchar](max) NULL,
	[CompanyAccountID] [nchar](10) NULL,
 CONSTRAINT [PK_FinancialDocument] PRIMARY KEY CLUSTERED 
(
	[FinanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GeneralDocument]    Script Date: 2022/06/25 12:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeneralDocument](
	[GeneralDocumentsID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentTitle] [varchar](50) NULL,
	[DocumentDescription] [varchar](150) NULL,
	[ImageName] [varchar](max) NULL,
	[ImagePath] [nvarchar](max) NULL,
	[CompanyAccountID] [int] NULL,
 CONSTRAINT [PK_GeneralDocument] PRIMARY KEY CLUSTERED 
(
	[GeneralDocumentsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 2022/06/25 12:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NULL,
	[Unit_Cost] [decimal](18, 2) NULL,
	[Quantity] [int] NULL,
	[Amount] [decimal](18, 2) NULL,
	[Sub_Total] [nchar](10) NULL,
	[Tax_Amount] [decimal](18, 2) NULL,
	[Total_Amount] [decimal](18, 2) NULL,
	[ImageName] [varchar](max) NULL,
	[ImagePath] [nvarchar](max) NULL,
	[CompanyAccountID] [int] NULL,
	[CompanyName] [varchar](50) NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meeting_Minutes]    Script Date: 2022/06/25 12:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meeting_Minutes](
	[Meeting_MinutesID] [int] IDENTITY(1,1) NOT NULL,
	[Date_Taken] [date] NULL,
	[Meeting_Agenda] [varchar](50) NULL,
	[Meeting_Description] [varchar](150) NULL,
	[ImageName] [varchar](max) NULL,
	[ImagePath] [nvarchar](max) NULL,
	[CompanyAccountID] [int] NULL,
 CONSTRAINT [PK_Meeting_Minutes] PRIMARY KEY CLUSTERED 
(
	[Meeting_MinutesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quotation]    Script Date: 2022/06/25 12:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quotation](
	[QuotationID] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](50) NULL,
	[ItemDescription] [varchar](350) NULL,
	[Quantity] [int] NULL,
	[Unit_Price] [decimal](18, 2) NULL,
	[Total_Price] [decimal](18, 2) NULL,
	[Date_Created] [date] NULL,
	[ImageName] [varchar](max) NULL,
	[ImagePath] [nvarchar](max) NULL,
	[CompanyName] [varchar](50) NULL,
	[CompanyAccountID] [int] NULL,
 CONSTRAINT [PK_Quotation] PRIMARY KEY CLUSTERED 
(
	[QuotationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 2022/06/25 12:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Supplier_ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NULL,
	[EmailAddress] [varchar](50) NULL,
	[Cellphone] [varchar](15) NULL,
	[PhysicalAddress] [varchar](350) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Supplier_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierOrder]    Script Date: 2022/06/25 12:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierOrder](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [date] NULL,
	[InvoiceAmount] [decimal](18, 2) NULL,
	[ItemName] [varchar](50) NULL,
	[ItemDescription] [varchar](150) NULL,
	[Quantity] [int] NULL,
	[ImageName] [varchar](max) NULL,
	[ImagePath] [nvarchar](max) NULL,
	[CompanyAccountID] [int] NULL,
	[SupplierID] [int] NULL,
	[CustomerID] [int] NULL,
 CONSTRAINT [PK_SupplierOrder] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Title]    Script Date: 2022/06/25 12:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Title](
	[TitleID] [int] IDENTITY(1,1) NOT NULL,
	[Title_Description] [varchar](15) NULL,
 CONSTRAINT [PK_Title] PRIMARY KEY CLUSTERED 
(
	[TitleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2022/06/25 12:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[Email_Address] [varchar](50) NULL,
	[Password] [varchar](max) NULL,
	[UserRole_ID] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 2022/06/25 12:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserRole_ID] [int] IDENTITY(1,1) NOT NULL,
	[UserRole_Description] [varchar](50) NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserRole_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VAT]    Script Date: 2022/06/25 12:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VAT](
	[VAT_ID] [int] NOT NULL,
	[VAT_Percentage] [decimal](4, 2) NULL,
	[Date] [date] NULL
) ON [PRIMARY]
GO
