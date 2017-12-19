SELECT m.FirstName + ' ' + m.LastNAme AS Mechanics,
       AVG(DATEDIFF(DAY, IssueDate, FinishDate)) AS [Average Days]
	   FROM Mechanics m
JOIN Jobs j ON j.MechanicId = m.MechanicId
GROUP BY m.FirstName + ' ' + m.LastNAme, m.MechanicId
ORDER BY m.MechanicId
