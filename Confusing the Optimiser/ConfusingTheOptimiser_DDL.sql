USE [master]
GO
/****** Object:  Database [Optimiser]    Script Date: 2015/09/13 17:25:38 ******/
CREATE DATABASE [Optimiser]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Optimiser', FILENAME = N'C:\Databases\Optimiser.mdf' , SIZE = 25600KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Optimiser_log', FILENAME = N'C:\Databases\Optimiser_log.ldf' , SIZE = 4715200KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Optimiser] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Optimiser].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Optimiser] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Optimiser] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Optimiser] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Optimiser] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Optimiser] SET ARITHABORT OFF 
GO
ALTER DATABASE [Optimiser] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Optimiser] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Optimiser] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Optimiser] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Optimiser] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Optimiser] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Optimiser] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Optimiser] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Optimiser] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Optimiser] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Optimiser] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Optimiser] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Optimiser] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Optimiser] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Optimiser] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Optimiser] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Optimiser] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Optimiser] SET RECOVERY FULL 
GO
ALTER DATABASE [Optimiser] SET  MULTI_USER 
GO
ALTER DATABASE [Optimiser] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Optimiser] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Optimiser] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Optimiser] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Optimiser] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Optimiser', N'ON'
GO
USE [Optimiser]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2015/09/13 17:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[AccountNumber] [char](12) NULL,
	[Surname] [varchar](25) NULL,
	[FirstName] [varchar](25) NULL,
	[Status] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Makes]    Script Date: 2015/09/13 17:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Makes](
	[Make] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2015/09/13 17:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[OrderNumber] [char](25) NOT NULL,
	[OrderStatus] [varchar](10) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Total] [numeric](12, 4) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[OrderNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SecondHandCars]    Script Date: 2015/09/13 17:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SecondHandCars](
	[CarID] [int] IDENTITY(1,1) NOT NULL,
	[Make] [varchar](50) NULL,
	[ManufacturingYear] [smallint] NULL,
	[Price] [numeric](12, 4) NULL,
	[Kilometers] [numeric](12, 4) NULL,
PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TransactionHistory]    Script Date: 2015/09/13 17:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionHistory](
	[TransactionID] [int] IDENTITY(100000,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[TransactionType] [nchar](1) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [pk_TransactionHistory] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_Customer_AccountNumber]    Script Date: 2015/09/13 17:25:38 ******/
CREATE NONCLUSTERED INDEX [idx_Customer_AccountNumber] ON [dbo].[Customers]
(
	[AccountNumber] ASC
)
INCLUDE ( 	[Surname],
	[FirstName]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_Customers_SurnameFirstName]    Script Date: 2015/09/13 17:25:38 ******/
CREATE NONCLUSTERED INDEX [idx_Customers_SurnameFirstName] ON [dbo].[Customers]
(
	[Surname] ASC,
	[FirstName] ASC
)
INCLUDE ( 	[AccountNumber]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_Orders_CustomerID]    Script Date: 2015/09/13 17:25:38 ******/
CREATE NONCLUSTERED INDEX [idx_Orders_CustomerID] ON [dbo].[Orders]
(
	[CustomerID] ASC
)
INCLUDE ( 	[OrderNumber],
	[OrderStatus],
	[OrderDate]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_Orders_OrderStatus]    Script Date: 2015/09/13 17:25:38 ******/
CREATE NONCLUSTERED INDEX [idx_Orders_OrderStatus] ON [dbo].[Orders]
(
	[OrderStatus] ASC
)
INCLUDE ( 	[OrderNumber],
	[CustomerID],
	[OrderDate]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_SecondhandCars_KM]    Script Date: 2015/09/13 17:25:38 ******/
CREATE NONCLUSTERED INDEX [idx_SecondhandCars_KM] ON [dbo].[SecondHandCars]
(
	[Kilometers] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_SecondhandCars_Make]    Script Date: 2015/09/13 17:25:38 ******/
CREATE NONCLUSTERED INDEX [idx_SecondhandCars_Make] ON [dbo].[SecondHandCars]
(
	[Make] ASC
)
INCLUDE ( 	[ManufacturingYear],
	[Price],
	[Kilometers]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_SecondhandCars_Price]    Script Date: 2015/09/13 17:25:38 ******/
CREATE NONCLUSTERED INDEX [idx_SecondhandCars_Price] ON [dbo].[SecondHandCars]
(
	[Price] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_TransactionHistory_ProductID]    Script Date: 2015/09/13 17:25:38 ******/
CREATE NONCLUSTERED INDEX [idx_TransactionHistory_ProductID] ON [dbo].[TransactionHistory]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_TransactionHistory_TransactionType]    Script Date: 2015/09/13 17:25:38 ******/
CREATE NONCLUSTERED INDEX [idx_TransactionHistory_TransactionType] ON [dbo].[TransactionHistory]
(
	[TransactionType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
/****** Object:  StoredProcedure [dbo].[CarSearch]    Script Date: 2015/09/13 17:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CarSearch] (
	@Make VARCHAR(50) = NULL,
	@MinimumPrice NUMERIC(12,4) = NULL,
	@MaximumPrice NUMERIC(12,4) = NULL,
	@MinimumKM NUMERIC(12,4) = NULL,
	@MaximumKM NUMERIC(12,4) = NULL
 )
 AS
 
 IF @Make IS NULL
	SET @Make = '%';

IF @MinimumPrice IS NULL
	SET @MinimumPrice = 0;

IF @MaximumPrice IS NULL
	SET @MaximumPrice = 99999999.9999;

IF @MinimumKM IS NULL
	SET @MinimumKM = 0;

IF @MaximumKM IS NULL
	SET @MaximumKM = 99999999.9999;

SELECT Make,
       Model,
       ManufacturingYear,
       Price,
       Kilometers
	FROM dbo.SecondHandCars
	WHERE Make LIKE @Make
		AND Price BETWEEN @MinimumPrice AND @MaximumPrice
		AND Kilometers BETWEEN @MinimumKM AND @MaximumKM
	


GO
/****** Object:  StoredProcedure [dbo].[CarSearch_Dynamic]    Script Date: 2015/09/13 17:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CarSearch_Dynamic] (
	@Make VARCHAR(50) = NULL,
	@MinimumPrice NUMERIC(12,4) = NULL,
	@MaximumPrice NUMERIC(12,4) = NULL,
	@MinimumKM NUMERIC(12,4) = NULL,
	@MaximumKM NUMERIC(12,4) = NULL
 )
 AS
 
 DECLARE @sSQL NVARCHAR(2000), 
	@Where NVARCHAR(1000) = '';

SET @sSQL = 'SELECT Make,
       Model,
       ManufacturingYear,
       Price,
       Kilometers
	FROM dbo.SecondHandCars ';
 
IF @Make IS NOT NULL
	SET @Where = @Where + 'AND Make LIKE @InnerMake ';

IF @MinimumPrice IS NOT NULL
	SET @Where = @Where + 'AND Price >= @InnerMinPrice ';

IF @MaximumPrice IS NOT NULL
	SET @Where = @Where + 'AND Price <= @InnerMaxPrice ';

IF @MinimumKM IS NOT NULL
	SET @Where = @Where + 'AND Kilometers >= @InnerMinKM ';

IF @MaximumKM IS NOT NULL
	SET @Where = @Where + 'AND Kilometers <= @InnerMaxKM ';

IF LEN(@Where) > 0
	SET @sSQL = @sSQL + 'WHERE ' + RIGHT(@Where, LEN(@Where)-3);

--PRINT @sSQL
 
EXEC sp_executesql @sSQL,
	N'@InnerMake VARCHAR(50), @InnerMinPrice NUMERIC(12,4), @InnerMaxPrice NUMERIC(12,4), @InnerMinKM NUMERIC(12,4), @InnerMaxKM NUMERIC(12,4)',
	@InnerMake = @Make,
	@InnerMinPrice = @MinimumPrice,
	@InnerMaxPrice = @MaximumPrice,
	@InnerMinKM = @MinimumKM,
	@InnerMaxKM = @MaximumKM;


GO
/****** Object:  StoredProcedure [dbo].[CarSearch_Inner]    Script Date: 2015/09/13 17:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CarSearch_Inner] (
	@Make VARCHAR(50) = NULL,
	@MinimumPrice NUMERIC(12,4) = NULL,
	@MaximumPrice NUMERIC(12,4) = NULL,
	@MinimumKM NUMERIC(12,4) = NULL,
	@MaximumKM NUMERIC(12,4) = NULL
 )
 AS
 
SELECT Make,
       Model,
       ManufacturingYear,
       Price,
       Kilometers
	FROM dbo.SecondHandCars
	WHERE Make LIKE @Make
		AND Price BETWEEN @MinimumPrice AND @MaximumPrice
		AND Kilometers BETWEEN @MinimumKM AND @MaximumKM;


GO
/****** Object:  StoredProcedure [dbo].[CarSearch_Recompile]    Script Date: 2015/09/13 17:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CarSearch_Recompile] (
	@Make VARCHAR(50) = NULL,
	@MinimumPrice NUMERIC(12,4) = NULL,
	@MaximumPrice NUMERIC(12,4) = NULL,
	@MinimumKM NUMERIC(12,4) = NULL,
	@MaximumKM NUMERIC(12,4) = NULL
 )
 AS
 
 IF @Make IS NULL
	SET @Make = '%';

IF @MinimumPrice IS NULL
	SET @MinimumPrice = 0;

IF @MaximumPrice IS NULL
	SET @MaximumPrice = 99999999.9999;

IF @MinimumKM IS NULL
	SET @MinimumKM = 0;

IF @MaximumKM IS NULL
	SET @MaximumKM = 99999999.9999;

SELECT Make,
       Model,
       ManufacturingYear,
       Price,
       Kilometers
	FROM dbo.SecondHandCars
	WHERE Make LIKE @Make
		AND Price BETWEEN @MinimumPrice AND @MaximumPrice
		AND Kilometers BETWEEN @MinimumKM AND @MaximumKM
	OPTION(RECOMPILE);


GO
/****** Object:  StoredProcedure [dbo].[CarSearch_Subprocedure]    Script Date: 2015/09/13 17:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CarSearch_Subprocedure] (
	@Make VARCHAR(50) = NULL,
	@MinimumPrice NUMERIC(12,4) = NULL,
	@MaximumPrice NUMERIC(12,4) = NULL,
	@MinimumKM NUMERIC(12,4) = NULL,
	@MaximumKM NUMERIC(12,4) = NULL
 )
 AS
 
 IF @Make IS NULL
	SET @Make = '%';

IF @MinimumPrice IS NULL
	SET @MinimumPrice = 0;

IF @MaximumPrice IS NULL
	SET @MaximumPrice = 99999999.9999;

IF @MinimumKM IS NULL
	SET @MinimumKM = 0;

IF @MaximumKM IS NULL
	SET @MaximumKM = 99999999.9999;

EXEC CarSearch_Inner @Make, @MinimumPrice, @MaximumPrice, @MinimumKM, @MaximumKM


GO
/****** Object:  StoredProcedure [dbo].[CustomerSearch]    Script Date: 2015/09/13 17:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CustomerSearch] (@AccountNumber CHAR(12) = NULL, @Surname VARCHAR(25) = NULL, @FirstName VARCHAR(25) = NULL)
AS
    IF (@AccountNumber IS NULL AND @Surname IS NULL)
        RAISERROR('No search parameter specified',50000,11)


    IF (@AccountNumber IS NOT NULL)
        SELECT  AccountNumber,
                Surname,
                FirstName,
                SUM(Amount) AS Balance
        FROM    dbo.Customers
                INNER JOIN dbo.Transactions ON Transactions.CustomerID = Customers.CustomerID
        WHERE   AccountNumber = @AccountNumber
        GROUP BY AccountNumber,
                Surname,
                FirstName


    IF (@Surname IS NOT NULL AND @FirstName IS NOT NULL)
        SELECT  AccountNumber,
                Surname,
                FirstName,
                SUM(Amount) AS Balance
        FROM    dbo.Customers
                INNER JOIN dbo.Transactions ON Transactions.CustomerID = Customers.CustomerID
        WHERE   Surname = @Surname
                AND FirstName = @FirstName
        GROUP BY AccountNumber,
                Surname,
                FirstName 


GO
/****** Object:  StoredProcedure [dbo].[OrderSearch]    Script Date: 2015/09/13 17:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrderSearch]
    (
     @AccountNumber CHAR(25),
     @OrderNumber CHAR(25) = NULL,
     @OrderStatus VARCHAR(15) = NULL
    )
AS
    IF (@OrderNumber IS NULL AND @OrderStatus IS NULL)
        RAISERROR ('At least one search parameter must be specified',50000,11)


    IF (@OrderNumber IS NOT NULL)
        SELECT  c.Surname,
                c.FirstName,
                c.AccountNumber,
                o.OrderNumber,
                o.OrderStatus,
                o.OrderDate
        FROM    dbo.Customers c
                INNER JOIN dbo.Orders o ON o.CustomerID = c.CustomerID
        WHERE   c.AccountNumber = @AccountNumber
                AND o.OrderNumber = @OrderNumber;

    IF (@OrderStatus IS NOT NULL)
        SELECT  c.Surname,
                c.FirstName,
                c.AccountNumber,
                o.OrderNumber,
                o.OrderStatus,
                o.OrderDate
        FROM    dbo.Customers c
                INNER JOIN dbo.Orders o ON o.CustomerID = c.CustomerID
        WHERE   c.AccountNumber = @AccountNumber
                AND o.OrderStatus = @OrderStatus


GO
/****** Object:  StoredProcedure [dbo].[OrderSearch_Optimise]    Script Date: 2015/09/13 17:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrderSearch_Optimise]
    (
     @AccountNumber CHAR(25),
     @OrderNumber CHAR(25) = NULL,
     @OrderStatus VARCHAR(15) = NULL
    )
AS
    IF (@OrderNumber IS NULL AND @OrderStatus IS NULL)
        RAISERROR ('At least one search parameter must be specified',50000,11);


    IF (@OrderNumber IS NOT NULL)
        SELECT  c.Surname,
                c.FirstName,
                c.AccountNumber,
                o.OrderNumber,
                o.OrderStatus,
                o.OrderDate
        FROM    dbo.Customers c
                INNER JOIN dbo.Orders o ON o.CustomerID = c.CustomerID
        WHERE   c.AccountNumber = @AccountNumber
                AND o.OrderNumber = @OrderNumber
        OPTION (OPTIMIZE FOR (@OrderNumber = '56894575689'));	

    IF (@OrderStatus IS NOT NULL)
        SELECT  c.Surname,
                c.FirstName,
                c.AccountNumber,
                o.OrderNumber,
                o.OrderStatus,
                o.OrderDate
        FROM    dbo.Customers c
                INNER JOIN dbo.Orders o ON o.CustomerID = c.CustomerID
        WHERE   c.AccountNumber = @AccountNumber
                AND o.OrderStatus = @OrderStatus
        OPTION (OPTIMIZE FOR (@OrderStatus = 'Delivered'));


GO
/****** Object:  StoredProcedure [dbo].[OrderSearch_Recompile]    Script Date: 2015/09/13 17:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrderSearch_Recompile]
    (
     @AccountNumber CHAR(25),
     @OrderNumber CHAR(25) = NULL,
     @OrderStatus VARCHAR(15) = NULL
    )
AS
    IF (@OrderNumber IS NULL AND @OrderStatus IS NULL)
        RAISERROR ('At least one search parameter must be specified',50000,11);


    IF (@OrderNumber IS NOT NULL)
        SELECT  c.Surname,
                c.FirstName,
                c.AccountNumber,
                o.OrderNumber,
                o.OrderStatus,
                o.OrderDate
        FROM    dbo.Customers c
                INNER JOIN dbo.Orders o ON o.CustomerID = c.CustomerID
        WHERE   c.AccountNumber = @AccountNumber
                AND o.OrderNumber = @OrderNumber
        OPTION (RECOMPILE);

    IF (@OrderStatus IS NOT NULL)
        SELECT  c.Surname,
                c.FirstName,
                c.AccountNumber,
                o.OrderNumber,
                o.OrderStatus,
                o.OrderDate
        FROM    dbo.Customers c
                INNER JOIN dbo.Orders o ON o.CustomerID = c.CustomerID
        WHERE   c.AccountNumber = @AccountNumber
                AND o.OrderStatus = @OrderStatus
        OPTION (RECOMPILE);


GO
/****** Object:  StoredProcedure [dbo].[OrderSearch_SubProcedure]    Script Date: 2015/09/13 17:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[OrderSearch_SubProcedure]
    (
     @AccountNumber CHAR(25),
     @OrderNumber CHAR(25) = NULL,
     @OrderStatus VARCHAR(15) = NULL
    )
AS
    IF (@OrderNumber IS NULL AND @OrderStatus IS NULL)
        RAISERROR ('At least one search parameter must be specified',50000,11);

    IF (@OrderNumber IS NOT NULL)
		EXEC OrderSearchOrderNumber @AccountNumber, @OrderNumber;        

    IF (@OrderStatus IS NOT NULL)
        EXEC OrderSearchOrderStatus @AccountNumber, @OrderStatus;


GO
/****** Object:  StoredProcedure [dbo].[OrderSearchOrderNumber]    Script Date: 2015/09/13 17:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrderSearchOrderNumber] (
	 @AccountNumber CHAR(25),
     @OrderNumber CHAR(25)
)
AS
SELECT  c.Surname,
                c.FirstName,
                c.AccountNumber,
                o.OrderNumber,
                o.OrderStatus,
                o.OrderDate
        FROM    dbo.Customers c
                INNER JOIN dbo.Orders o ON o.CustomerID = c.CustomerID
        WHERE   c.AccountNumber = @AccountNumber
                AND o.OrderNumber = @OrderNumber

GO
/****** Object:  StoredProcedure [dbo].[OrderSearchOrderStatus]    Script Date: 2015/09/13 17:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[OrderSearchOrderStatus] (
	 @AccountNumber CHAR(25),
     @OrderStatus VARCHAR(15)
)
AS
SELECT  c.Surname,
                c.FirstName,
                c.AccountNumber,
                o.OrderNumber,
                o.OrderStatus,
                o.OrderDate
        FROM    dbo.Customers c
                INNER JOIN dbo.Orders o ON o.CustomerID = c.CustomerID
        WHERE   c.AccountNumber = @AccountNumber
                AND o.OrderStatus = @OrderStatus

GO
/****** Object:  StoredProcedure [dbo].[TransactionSearch]    Script Date: 2015/09/13 17:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TransactionSearch]
    @ProductID INT = NULL,
    @TransactionType NCHAR(1) = NULL ,
    @Qty INT = NULL
AS
    SELECT  
            ProductID ,
            TransactionType ,
            Quantity 
    FROM    Production.TransactionHistoryArchive
    WHERE   ( ProductID = @ProductID
              OR @ProductID IS NULL
            )
            AND ( TransactionType = @TransactionType
                  OR @TransactionType IS NULL
                )
            AND ( Quantity = @Qty
                  OR @Qty IS NULL
                )
;

GO
/****** Object:  StoredProcedure [dbo].[TransactionSearch_Dynamic]    Script Date: 2015/09/13 17:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TransactionSearch_Dynamic]
    @ProductID INT = NULL,
    @TransactionType NCHAR(1) = NULL ,
    @Qty INT = NULL
AS
    DECLARE
    @sSQL NVARCHAR(2000) ,
    @Where NVARCHAR(1000) = ''

    SET @sSQL = 'SELECT ProductID, TransactionType, Quantity
		FROM Production.TransactionHistory ';
 
    IF (@ProductID IS NOT NULL )
        SET @Where = @Where + 'AND ProductID = @InnerProduct ';

    IF (@TransactionType IS NOT NULL)
        SET @Where = @Where + 'AND TransactionType = @InnerTransactionType ';

    IF (@Qty IS NOT NULL)
        SET @Where = @Where + 'AND Quantity = @InnerQty ';
 
    IF (LEN(@Where) > 0)
        SET @sSQL = @sSQL + 'WHERE ' + RIGHT(@Where, LEN(@Where) - 3);
 
    EXEC sp_executesql @sSQL,
        N'@InnerProduct int, @InnerTransactionType nchar(1), @InnerQty int',
        @InnerProduct = @ProductID, @InnerTransactionType = @TransactionType,
        @InnerQty = @Qty;

GO
/****** Object:  StoredProcedure [dbo].[TransactionSearch_Recompile]    Script Date: 2015/09/13 17:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[TransactionSearch_Recompile]
    @ProductID INT = NULL,
    @TransactionType NCHAR(1) = NULL ,
    @Qty INT = NULL
AS
    SELECT  
            ProductID ,
            TransactionType ,
            Quantity 
    FROM    Production.TransactionHistoryArchive
    WHERE   ( ProductID = @ProductID
              OR @ProductID IS NULL
            )
            AND ( TransactionType = @TransactionType
                  OR @TransactionType IS NULL
                )
            AND ( Quantity = @Qty
                  OR @Qty IS NULL
                )
	OPTION (RECOMPILE);

GO
USE [master]
GO
ALTER DATABASE [Optimiser] SET  READ_WRITE 
GO
