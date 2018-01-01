SELECT TOP(1)  WITH TIES m.Name AS Model, 
			   COUNT(*) AS [Times Serviced], 
			   (SELECT ISNULL(SUM(op.Quantity * p.Price), 0) 
					FROM Orders AS o
					JOIN OrderParts AS op ON o.OrderId = op.OrderId
					JOIN Parts AS p ON p.PartId = op.PartId
					JOIN Jobs AS j ON j.JobId = o.JobId
					WHERE m.ModelId = j.ModelId
					) AS [Parts Total]
FROM Models AS m
JOIN Jobs as j ON m.ModelId = j.ModelId
GROUP BY m.Name, m.ModelId
ORDER BY COUNT(*) DESC
