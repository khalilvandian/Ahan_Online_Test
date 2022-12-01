CREATE DATABASE Ahan_Online_Test
GO 

CREATE TABLE Ahan_Online_Test.dbo.Organisational_Chart (
[Id] float,
[name] nvarchar(255),
[manager] nvarchar(255),
[Manager Id] float
)
GO

CREATE TABLE Ahan_Online_Test.dbo.Sale (
[SalesID] float,
[OrderID] nvarchar(255),
[Customer] nvarchar(255),
[Product] nvarchar(255),
[Date] float,
[Quantity] float,
[UnitPrice] float
)
GO

CREATE TABLE Ahan_Online_Test.dbo.Sales_Profit (
[Product] nvarchar(255),
[ProfitRatio] float
)
GO

BULK INSERT Ahan_Online_Test.dbo.Organisational_Chart
FROM 'D:\Projects\Ahan Online\Organizational_Chart.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK,
	KEEPNULLS
)

BULK INSERT Ahan_Online_Test.dbo.Sale
FROM 'D:\Projects\Ahan Online\Sale.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)

BULK INSERT Ahan_Online_Test.dbo.Sales_Profit
FROM 'D:\Projects\Ahan Online\Sales_Profit.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n',   
    TABLOCK
)

SELECT *, UnitPrice * Quantity AS TotalPurchase INTO Sale_Temp
FROM [Ahan_Online_Test].[dbo].[Sale]