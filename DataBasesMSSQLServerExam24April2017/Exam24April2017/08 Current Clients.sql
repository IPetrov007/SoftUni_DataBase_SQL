SELECT c.FirstName + ' ' + c.LastNAme AS Client,
       DATEDIFF(DAY, IssueDate, '04/24/2017') AS [Days going],
	   j.Status
 FROM Clients c
JOIN Jobs j ON j.ClientId = c.ClientId
WHERE j.Status != 'Finished'
