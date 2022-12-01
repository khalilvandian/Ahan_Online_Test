IF OBJECT_ID(N'tempdb..#A') IS NOT NULL
BEGIN
DROP TABLE #A
DROP TABLE #Result
END

SELECT L.Id, L.[Manager Id] as RootManager, R.Id AS Temp1, R.[Manager Id] AS Temp2   INTO #A FROM Organisational_Chart L LEFT OUTER JOIN Organisational_Chart R ON L.[Manager Id] = R.Id

ALTER TABLE #A ADD EmployeeLevel INT NOT NULL DEFAULT 1

WHILE EXISTS (SELECT * FROM #A WHERE Temp1 IS NOT NULL)
BEGIN
	UPDATE #A
	SET #A.EmployeeLevel = EmployeeLevel + 1
	WHERE #A.Temp1 IS NOT NULL

	UPDATE #A
	SET #A.RootManager = R.[Manager Id]
	FROM #A LEFT OUTER JOIN Organisational_Chart R
	ON #A.RootManager = R.Id
	WHERE #A.Temp2 IS NOT NULL

	UPDATE #A 
	SET	#A.Temp1 = R.[Manager Id]
	FROM #A LEFT OUTER JOIN Organisational_Chart R
	ON #A.Temp1 = R.Id
	WHERE #A.Temp1 IS NOT NULL
	
	UPDATE #A 
	SET	#A.Temp2 = R.[Manager Id]
	FROM #A LEFT OUTER JOIN Organisational_Chart R
	ON #A.Temp2 = R.Id
	WHERE #A.Temp2 IS NOT NULL

END

SELECT Id, RootManager, EmployeeLevel INTO #Result
FROM #A

ALTER TABLE #Result ADD EmployeeName VARCHAR(20) NULL,
		                RootManagerName VARCHAR(20) NULL

UPDATE #Result
SET EmployeeName = R.name
FROM #RESULT LEFT JOIN Organisational_Chart R
ON #Result.Id = R.Id

UPDATE #Result
SET RootManagerName = R.name
FROM #RESULT LEFT JOIN Organisational_Chart R
ON #Result.RootManager = R.Id
WHERE RootManager IS NOT NULL

SELECT DISTINCT *
FROM #Result

