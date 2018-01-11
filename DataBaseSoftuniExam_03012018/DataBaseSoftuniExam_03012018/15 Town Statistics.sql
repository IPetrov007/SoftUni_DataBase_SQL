SELECT tt.Name,
	   (SELECT COUNT(*)
										FROM Orders o
										JOIN Clients c ON o.ClientId = c.Id
										JOIN Towns t ON o.TownId = t.Id
										GROUP BY t.Name, c.Gender
										HAVING t.Name = tt.Name
										AND c.Gender = 'M') *100 / COUNT(*) AS MalePercent,
	   (SELECT COUNT(*)
										FROM Orders o
										JOIN Clients c ON o.ClientId = c.Id
										JOIN Towns t ON o.TownId = t.Id
										GROUP BY t.Name, c.Gender
										HAVING t.Name = tt.Name
										AND c.Gender = 'F') * 100 / COUNT(*) AS FemalePercent
FROM Orders oo
JOIN Clients cc ON oo.ClientId = cc.Id
JOIN Towns tt ON oo.TownId = tt.Id
GROUP BY tt.Name, tt.Id
ORDER BY tt.Name, tt.Id
