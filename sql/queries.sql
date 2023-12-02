
-- Two-table Join 
--
-- employees_and_operates.php 
-- 
-- Joins the FName column of the Employee table and 
-- TrackingNumber of the Operates Table where the 
-- EmployeeID's match.
SELECT Employee.FName, Operates.TrackingNumber
FROM Employee
JOIN Operates ON Employee.EmployeeID = Operates.EmployeeID;


-- Three-table join 
--
-- employee_operates_flight.php
--
-- Joins the FName column of the Employee table, the 
-- TrackingNumber of the Operates Table, and the DepartureTime
-- of the Flight table where the EmployeeID's matches the Operates
-- EmployeeID and where the TrackingNumber of the operates table matches
-- the TrackingNumber of the flight table.
SELECT Employee.FName, Operates.TrackingNumber, Flight.DepartureTime
FROM Employee
JOIN Operates ON Employee.EmployeeID = Operates.EmployeeID
JOIN Flight ON Operates.TrackingNumber = Flight.TrackingNumber;


-- Self-Join 
--
-- employee_pairs.php
--
-- Joins each employee with another employee in the table 
-- on columns where their EmployeeID's aren't the same.
SELECT e1.FName AS Employee1, e2.FName AS Employee2
FROM Employee e1
JOIN Employee e2 ON e1.EmployeeID <> e2.EmployeeID;


-- Aggregate Function
--
-- seat_capacity.php
--
-- Computes the average seatcapacity from plane 
SELECT AVG(SeatCapacity) AS AvgSeatCapacity
FROM Plane;


-- Aggregate function using GROUP BY and HAVING
--
-- planes_in_aiportcode.php
--
-- Counts the number of planes per airport code
-- and then groups them by their AirportCode for
-- each result that is greater than 5.
SELECT AirportCode, COUNT(*) AS NumberOfPlanes
FROM Plane
GROUP BY AirportCode
HAVING COUNT(*) > 5;


-- Text-based search query using LIKE with wildcard(s)
--
-- first_names_with_c.php 
-- 
-- Selects all passengers whose first name begins with C 
SELECT * FROM Passenger
WHERE FName LIKE 'C%';


-- Subquery 
--
-- usa_employees.php
-- 
-- Selects the EmployeeID, first name, and last name 
-- of empolyees that work in the USA.
SELECT EmployeeID, FName, LName
FROM Employee
WHERE AirportCode IN (SELECT AirportCode FROM Airport WHERE Country = 'USA');


-- Call function 
-- 
-- flights_by_employee.php
--
-- Gets number of flights of employee with certain ID.
SELECT GetNumFlightsByEmployee(employeeID) AS NumFlights;


-- Call procedure 
--
-- assign_to_employee.php
--
-- Calls the procedure to add employee to WorksOn table.
CALL AssignPlaneToEmployee(145, 717);































