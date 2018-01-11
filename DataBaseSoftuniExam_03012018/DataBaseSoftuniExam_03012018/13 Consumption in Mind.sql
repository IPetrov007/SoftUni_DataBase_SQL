SELECT m.Manufacturer,AVG(m.Consumption) FROM Models m
RIGHT JOIN Vehicles v ON m.Id = v.ModelId
RIGHT JOIN Orders o ON v.Id = o.VehicleId
GROUP BY m.Manufacturer, m.Consumption
HAVING AVG(m.Consumption) BETWEEN 5 AND 15
ORDER BY COUNT(o.Id), m.Manufacturer, m.Consumption






