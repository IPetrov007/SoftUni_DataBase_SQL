SELECT ISNULL(SUM(op.Quantity * p.Price), 0) AS [Parts Total] FROM Orders AS o
JOIN OrderParts AS op ON o.OrderId = op.OrderId
JOIN Parts AS p ON op.PartId = p.PartId
WHERE DATEDIFF(WEEK, o.IssueDate, '2017/04/24') < 4
