SELECT E.FirstName + ' ' + e.LastName AS Name, COUNT(UserId) AS [Users Number] FROM Employees AS e
LEFT JOIN Reports AS r ON e.Id = R.EmployeeId
GROUP BY e.FirstName + ' ' + e.LastName
ORDER BY [Users Number] DESC, Name


