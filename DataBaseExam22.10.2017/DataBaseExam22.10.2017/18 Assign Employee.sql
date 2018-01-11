-- NOT FINISHED!!!!!!!!

CREATE PROC usp_AssignEmployeeToReport @employeeId INT, @reportId INT
AS
DECLARE @ 
SELECT EmployeeId, r.Id, e.DepartmentId, c.DepartmentId FROM Reports r
JOIN Employees e ON r.EmployeeId = e.Id
JOIN Categories c ON r.CategoryId = c.Id
WHERE e.DepartmentId = c.DepartmentId