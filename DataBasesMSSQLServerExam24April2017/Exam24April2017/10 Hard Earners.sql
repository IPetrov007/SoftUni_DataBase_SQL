SELECT TOP(3)
       m.FirstName + ' ' + m.LastNAme AS Mechanics,
       COUNT(*) AS Jobs
       FROM Mechanics m
JOIN Jobs j ON j.MechanicId = m.MechanicId
WHERE j.Status != 'Finished'
GROUP BY m.FirstName + ' ' + m.LastNAme
HAVING COUNT(*) > 1
ORDER BY Jobs DESC
