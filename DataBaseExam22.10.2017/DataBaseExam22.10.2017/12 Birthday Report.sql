SELECT c.Name AS [Category name] FROM Categories AS c
JOIN Reports AS r ON c.Id = r.CategoryId
JOIN Users AS u ON r.UserId = u.Id
WHERE DAY(u.BirthDate) = DAY(r.OpenDate)
AND MONTH(u.BirthDate) = MONTH(r.OpenDate)
GROUP BY c.Name
ORDER BY c.Name