SELECT t.Name AS [TownName], COUNT(o.Id) AS [OfficesNumber] FROM Offices o
JOIN Towns t ON o.TownId = t.Id
GROUP BY t.Id, t.Name
ORDER BY OfficesNumber DESC, TownName