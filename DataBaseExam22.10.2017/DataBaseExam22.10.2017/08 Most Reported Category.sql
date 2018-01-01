SELECT c.Name, COUNT(*) FROM Reports AS r
JOIN Categories AS c ON r.CategoryId = c.Id
GROUP BY CategoryId, c.Name
ORDER BY COUNT(*) DESC, c.Name