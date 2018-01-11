SELECT m.Model, m.Seats, SUM(v.Mileage) FROM Orders o
JOIN Vehicles v ON o.VehicleId = v.Id
JOIN Models m ON v.ModelId = m.Id
WHERE o.ReturnDate IS NOT  NULL
GROUP BY m.Model, m.Seats