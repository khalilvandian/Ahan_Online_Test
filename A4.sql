SELECT Customer, COUNT(SalesID) AS SaleCount, SUM(TotalPurchase) AS CustomerTotalPurchase, SUM(Quantity) AS TotalItemCount
FROM [Ahan_Online_Test].[dbo].[Sale_Temp]
WHERE Customer IN (
	SELECT DISTINCT Customer
	FROM [Ahan_Online_Test].[dbo].[Sale_Temp]
	Where TotalPurchase > 1500
)
GROUP BY Customer