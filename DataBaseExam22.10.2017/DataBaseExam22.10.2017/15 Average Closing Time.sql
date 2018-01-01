SELECT d.Name, ISNULL(CONVERT(VARCHAR, AVG(DATEDIFF(DAY, OpenDate, CloseDate))), 'no info') FROM Departments d
JOIN Categories c ON c.DepartmentId = d.Id
JOIN Reports r ON r.CategoryId = c.Id
GROUP BY d.Name
ORDER BY d.Name