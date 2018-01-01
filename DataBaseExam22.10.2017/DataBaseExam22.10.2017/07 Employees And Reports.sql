SELECT FirstName, LastName, Description, FORMAT(OpenDate, 'yyyy-MM-dd') AS OpenDate FROM Reports AS r
JOIN Employees AS e ON r.EmployeeId = e.Id
WHERE EmployeeId IS NOT NULL
ORDER BY EmployeeId, OpenDate, r.Id
