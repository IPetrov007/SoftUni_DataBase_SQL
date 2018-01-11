SELECT t.Name, o.Name, o.ParkingPlaces FROM Offices o
JOIN Towns t ON o.TownId = t.Id
WHERE ParkingPlaces > 25
ORDER BY t.Name, o.Id

SELECT * FROM Towns
ORDER BY Id 

SELECT * FROM Offices
ORDER BY ParkingPlaces DESC
