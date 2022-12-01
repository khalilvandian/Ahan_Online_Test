SELECT SUM(A.Profit) AS TotalProfit, SUM(A.Profit) / SUM(A.TotalPurchase) * 100 AS TotalProfitRatio
FROM 
(SELECT DISTINCT SalesID, TotalPurchase, TotalPurchase * COALESCE(ProfitRatio, 0.1) AS Profit
FROM Sale_Temp A
LEFT OUTER JOIN Sales_Profit B
ON A.Product = B.Product) AS A