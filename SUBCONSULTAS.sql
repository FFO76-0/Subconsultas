<<<<<<< HEAD
=======


--Ejercicio 3
-- Empleados que no son clientes
SELECT FirstName + ' ' + LastName AS NombreCompleto
FROM dbo.Employees
EXCEPT
SELECT ContactName
FROM dbo.Customers
ORDER BY NombreCompleto DESC;

---Ejercicio 4
SELECT e.EmployeeID, e.FirstName, e.LastName
FROM dbo.Employees e
WHERE e.EmployeeID NOT IN (
    SELECT et.EmployeeID
    FROM dbo.EmployeeTerritories et
    INNER JOIN dbo.Territories t ON et.TerritoryID = t.TerritoryID
    INNER JOIN dbo.Region r ON t.RegionID = r.RegionID
    WHERE r.RegionDescription = 'Northern'
)
ORDER BY e.LastName DESC;
>>>>>>> e982e03c49374a9657a4eb9ae38afe5175ba3b38