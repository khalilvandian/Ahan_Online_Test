SELECT Product, SUM(TotalPurchase) AS CustomerTotalPurchase
FROM Sale_temp
GROUP BY Product