SELECT p.PartId, 
	   p.Description, 
	   r.Quantity AS [Required],
	   p.StockQty AS [In Stock],
	   CASE
	   WHEN p.PartId IN (SELECT op.PartId 
						 FROM Orders AS o
						 RIGHT JOIN OrderParts AS op ON o.OrderId = op.OrderId
						 WHERE Delivered = 0)
						 THEN (SELECT op.Quantity FROM Orders AS o
							   RIGHT JOIN OrderParts AS op 
							   ON o.OrderId = op.OrderId
							   AND op.PartId = p.PartId
							   WHERE Delivered = 0)
	   ELSE 0
	   END AS [Ordered]
	   FROM Parts as p
JOIN PartsNeeded AS r ON r.PartId = p.PartId
JOIN Jobs AS j on r.JobId = j.JobId
WHERE j.Status != 'Finished'
AND (p.StockQty + (CASE
	   WHEN p.PartId IN (SELECT op.PartId 
						 FROM Orders AS o
						 RIGHT JOIN OrderParts AS op ON o.OrderId = op.OrderId
						 WHERE Delivered = 0)
						 THEN (SELECT op.Quantity FROM Orders AS o
							   RIGHT JOIN OrderParts AS op 
							   ON o.OrderId = op.OrderId
							   AND op.PartId = p.PartId
							   WHERE Delivered = 0)
	   ELSE 0
	   END)) < r.Quantity
ORDER BY p.PartId