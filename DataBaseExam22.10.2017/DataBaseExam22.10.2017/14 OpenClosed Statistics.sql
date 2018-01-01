SELECT e.FirstName + ' ' + e.LastName AS FullName,
	   ISNULL(CONVERT(VARCHAR, CL.ClosedReports), '0') + '/' +
	   ISNULL(CONVERT(VARCHAR, oc.OpenReports), '0') AS [Stats]
FROM Employees AS e
JOIN (SELECT EmployeeId, COUNT(1) AS OpenReports FROM Reports AS r
			WHERE YEAR(OpenDate) = 2016 
			GROUP BY EmployeeId) AS OC ON OC.EmployeeId = e.Id
LEFT JOIN (SELECT EmployeeId, COUNT(1) AS ClosedReports FROM Reports AS r
		  WHERE YEAR(CloseDate) = 2016
		  GROUP BY EmployeeId) AS CL ON CL.EmployeeId = e.Id
ORDER BY FullName
