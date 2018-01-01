SELECT OpenDate, Description, Email FROM Reports AS r
JOIN Categories AS c ON r.CategoryId = c.Id
JOIN Users AS u ON r.UserId = u.Id
WHERE CloseDate IS NULL
AND r.Id IN (SELECT Id FROM Reports
			WHERE LEN(Description) > 20
			AND Description LIKE '%str%')
AND c.DepartmentId IN (1, 4, 5)
ORDER BY r.OpenDate, u.Email, r.Id
