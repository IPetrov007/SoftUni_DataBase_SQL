SELECT FirstName + ' ' + LastNAme AS Available
       FROM Mechanics
WHERE MechanicId NOT IN(SELECT DISTINCT MechanicId FROM Jobs
                            WHERE Status != 'Finished'
                            AND MechanicId IS NOT NULL)
ORDER BY MechanicId