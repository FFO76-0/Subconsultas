


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
<<<<<<< HEAD
-- 8. Lista el nombre de los empleados que pertenezcan a la región Southern
SELECT FirstName + ' ' + LastName AS NombreEmpleado
FROM Employees
WHERE EmployeeID IN (
    SELECT EmployeeID 
    FROM EmployeeTerritories 
    WHERE TerritoryID IN (
        SELECT TerritoryID 
        FROM Territories 
        WHERE RegionID = (
            SELECT RegionID 
            FROM Region 
            WHERE RegionDescription = 'Southern'
        )
    )
);
>>>>>>> 541d4ff792bad77420cc53714f302e173947d602

-- 9. ID de la orden, fecha de pedido, fecha de entrega y flete de "United Package"
SELECT OrderID, OrderDate, ShippedDate, Freight
FROM Orders
WHERE ShipVia = (
    SELECT ShipperID 
    FROM Shippers 
    WHERE CompanyName = 'United Package'
    
);
=======




-- Consulta 5

SELECT OrderID, CustomerID, ShipCountry
FROM Orders
WHERE ShipCountry IN ('Sweden', 'Spain');

>>>>>>> 6aa1f32462a12e6d7c232f192fe5f02f1c2a4e8a



-- Consulta 6  Cuáles son los productos cuyo nombre de proveedor (Company name) inicie con L.

SELECT ProductID, ProductName, SupplierID
FROM Products
WHERE SupplierID IN (
    SELECT SupplierID
    FROM Suppliers
    WHERE CompanyName LIKE 'L%'
);


-- Consulta 7  Muestra los nombres de todos los territorios que estén en la region Western

SELECT TerritoryDescription
FROM Territories
WHERE RegionID IN (
    SELECT RegionID
    FROM Region
    WHERE RegionDescription = 'Western'
);
