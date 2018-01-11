CREATE FUNCTION udf_GetReportsCount(@employeeId INT, @statusId INT)
RETURNS INT
AS
BEGIN
	RETURN (
			SELECT COUNT(*) FROM Reports
			WHERE EmployeeId = @employeeId AND
			StatusId = @statusId
			);
END

GO

SELECT Id, FirstName, Lastname, dbo.udf_GetReportsCount(Id, 2) AS ReportsCount
FROM Employees
ORDER BY Id
