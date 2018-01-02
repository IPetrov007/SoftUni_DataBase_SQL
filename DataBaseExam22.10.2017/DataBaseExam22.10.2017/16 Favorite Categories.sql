SELECT DEP,
	   CAT,
	   Percentage
FROM  (SELECT d.Name AS [DEP], 
	   c.Name AS [CAT], 
	   CAST(ROUND(COUNT(*) OVER (PARTITION BY c.id)  * 100.00 /
	   COUNT(*) OVER (PARTITION BY d.Id), 0) as int) AS [Percentage]
FROM Departments d
JOIN Categories c ON d.Id = c.DepartmentId
JOIN Reports r ON r.CategoryId = c.Id) AS Stat
GROUP BY DEP, CAT, Percentage
ORDER BY DEP, CAT, Percentage


