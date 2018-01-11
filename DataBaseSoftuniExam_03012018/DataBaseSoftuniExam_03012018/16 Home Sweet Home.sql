SELECT m.Manufacturer + ' - ' + m.Model AS [Vehicle],
	   CASE
	   WHEN v.Id NOT IN (SELECT VehicleId FROM Orders) THEN 'home'
	   WHEN v.Id NOT IN (SELECT VehicleId FROM Orders o
						JOIN Vehicles v ON o.VehicleId = v.Id
						WHERE ReturnOfficeId = v.OfficeId) THEN (SELECT TOP(1) tt.Name + ' - ' + ff.Name FROM Orders oo
																JOIN Vehicles vv ON oo.VehicleId = vv.Id
																JOIN Offices ff ON oo.ReturnOfficeId = ff.Id
																JOIN Towns tt ON ff.TownId = tt.Id
																WHERE v.Id = vv.Id
																ORDER BY ReturnDate DESC)
	   WHEN v.Id IN (SELECT VehicleId FROM Orders
					 WHERE ReturnDate IS NULL) THEN 'on a rent'
	   END AS Location
FROM Vehicles v
JOIN Models m ON v.ModelId = m.Id
--LEFT JOIN Orders o ON v.Id = o.VehicleId
JOIN Offices f ON v.OfficeId = f.Id
JOIN Towns t ON f.TownId = t.Id
ORDER BY Vehicle, v.Id
