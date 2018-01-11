SELECT [Category Name],
	   (SUM(InProgress) + SUM(WaitingCount)) AS [Reports Number],
	   CASE
	   WHEN SUM(InProgress) > SUM(WaitingCount) THEN 'in progress'
	   WHEN SUM(InProgress) < SUM(WaitingCount) THEN 'waiting'
	   ELSE 'equal'
	   END AS [Main Status]
 FROM (SELECT c.Name AS [Category Name],
	   SUM(CASE WHEN s.Label = 'in progress' THEN 1 ELSE 0 END) AS InProgress,
	   SUM(CASE WHEN s.Label = 'waiting' THEN 1 ELSE 0 END) as WaitingCount
FROM Reports r
JOIN Status s ON r.StatusId = s.Id
JOIN Categories c ON r.CategoryId = c.Id
WHERE s.Label IN ('in progress', 'waiting')
GROUP BY c.Name		 
) AS rs
GROUP BY [Category Name]
ORDER BY [Category Name], [Reports Number], [Main Status]



SELECT * FROM Reports
WHERE CategoryId = 1

SELECT * FROM Status
