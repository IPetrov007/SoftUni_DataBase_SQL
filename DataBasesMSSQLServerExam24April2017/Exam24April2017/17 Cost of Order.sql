CREATE FUNCTION udf_GetCost(@JobId int)
RETURNS DECIMAL(6, 2)
AS
BEGIN
RETURN(SELECT ISNULL(SUM(Quantity * Price), 0) FROM Orders AS o
JOIN OrderParts AS op ON o.OrderId = op.OrderId
JOIN Parts AS p ON op.PartId = p.PartId
WHERE o.JobId = @JobId)
END


