SELECT m.ModelId,Name, CONCAT(AVG(DATEDIFF(DAY, IssueDate, FinishDate)), ' days') AS [Average Service Time] FROM Models AS m
JOIN Jobs AS j ON m.ModelId = j.ModelId
WHERE Status = 'Finished'
GROUP BY m.ModelId, Name
ORDER BY AVG(DATEDIFF(DAY, IssueDate, FinishDate))