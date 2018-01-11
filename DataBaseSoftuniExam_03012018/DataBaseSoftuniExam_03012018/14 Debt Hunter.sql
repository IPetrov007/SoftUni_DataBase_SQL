
SELECT c.FirstName + ' ' + c.LastName AS [Category Name],
	   c.Email,
	   Bill,
	   t.Name AS [Town],
	   RANK() OVER (PARTITION BY t.Name ORDER BY Bill DESC) AS Ranks FROM Orders o
			JOIN Clients c ON o.ClientId = c.Id
			JOIN Towns t ON o.TownId = t.Id
			JOIN 
			(SELECT c.FirstName + ' ' + c.LastName AS [Category Name],
				   c.Email AS [Email],
				   Bill AS [Bill],
				   t.Name AS [Town],
				   RANK() OVER (PARTITION BY t.Name ORDER BY Bill DESC) AS Ranks,
				   o.ClientId
			FROM Orders o
			JOIN Clients c ON o.ClientId = c.Id
			JOIN Towns t ON o.TownId = t.Id
			WHERE c.CardValidity < o.CollectionDate
			GROUP BY t.Name, c.FirstName + ' ' + c.LastName, c.Email, Bill, ClientId
			HAVING Bill IS NOT NULL
			) AS st ON o.ClientId = st.ClientId

WHERE Ranks < 3
