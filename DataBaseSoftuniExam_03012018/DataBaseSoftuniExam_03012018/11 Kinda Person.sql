SELECT o.ClientId, m.Class FROM Orders o
JOIN Clients c ON o.ClientId = c.Id
JOIN Vehicles v ON o.VehicleId = v.Id
JOIN Models m ON v.ModelId = m.Id
GROUP BY o.ClientId, m.Class
