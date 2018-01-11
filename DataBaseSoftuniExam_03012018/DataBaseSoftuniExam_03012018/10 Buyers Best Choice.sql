SELECT m.Manufacturer, m.Model, COUNT(o.Id) AS [TimesOrdered] FROM Models m
LEFT JOIN Vehicles v ON m.Id= v.ModelId
LEFT JOIN Orders o ON v.Id = o.VehicleId
GROUP BY m.Manufacturer, m.Model
ORDER BY TimesOrdered DESC, Manufacturer DESC, Model 

