SELECT Count(*)
FROM (SELECT DISTINCT Customer, Date FROM Sale) AS Distinct_customers