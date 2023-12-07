
-- Two-table Join 
--
-- employees_and_operates.php 
-- 
-- Joins the FName column of the Employee table and 
-- TrackingNumber of the Operates Table where the 
-- EmployeeID's match.
SELECT Employee.FName, Employee.LName, Operates.TrackingNumber
FROM Employee
JOIN Operates ON Employee.EmployeeID = Operates.EmployeeID;


-- Three-table join 
--
-- employee_operates_flight.php
--
-- Joins the FName and LName column of the Employee table, the 
-- TrackingNumber of the Operates Table, and the DepartureTime
-- of the Flight table where the EmployeeID's matches the Operates
-- EmployeeID and where the TrackingNumber of the operates table matches
-- the TrackingNumber of the flight table.
SELECT Employee.FName, Employee.LName, Operates.TrackingNumber, Flight.DepartureTime
FROM Employee
JOIN Operates ON Employee.EmployeeID = Operates.EmployeeID
JOIN Flight ON Operates.TrackingNumber = Flight.TrackingNumber;



-- Self-Join 
--
-- same_airport_employees.php
--
-- Joins columns of employees work at the same 
-- airport where flights depart from. Displays their ID's
SELECT
    O1.EmployeeID AS Employee1,
    O2.EmployeeID AS Employee2,
    O1.DepartureAirport
FROM
    Operates O1
JOIN
    Operates O2 ON O1.DepartureAirport = O2.DepartureAirport
    AND O1.EmployeeID < O2.EmployeeID;


-- Aggregate Function
--
-- seat_capacity.php
--
-- Computes the average seatcapacity from plane and 
-- round to one decimal place.
SELECT ROUND(AVG(SeatCapacity), 1) AS AvgSeatCapacity
FROM Plane;


-- Aggregate function using GROUP BY and HAVING
--
-- flights_by_airport.php
--
-- Displays airports that have more than 2 total flights
--
SELECT DepartureAirport, COUNT(*) AS TotalFlights
FROM Flight
GROUP BY DepartureAirport
HAVING COUNT(*) > 2; 



-- Text-based search query using LIKE with wildcard(s)
--
-- first_names_with_c.php 
-- 
-- Selects all passengers whose first name begins with C 
SELECT * FROM Passenger
WHERE FName LIKE 'C%';


-- Subquery 
--
-- flights_with_cpl_pilot.php
-- 
-- Selects information from the subquery about flights where 
-- the pilot has a CPL license. 
-- 
-- The subquery gets information from the flight, operate, and 
-- employee table regarding flights. Then joins the tables by 
-- TrackingNumber and EmployeeID.
SELECT
    PilotFirstName,
    PilotLastName,
    TrackingNumber,
    FlightDate,
    DepartureAirport,
    ArrivalAirport
FROM
    (
        SELECT
            E.FName AS PilotFirstName,
            E.LName AS PilotLastName,
            F.TrackingNumber,
            F.FlightDate,
            F.DepartureAirport,
            F.ArrivalAirport,
            E.PilotLicense
        FROM
            Flight F
        JOIN
            Operates O ON F.TrackingNumber = O.TrackingNumber
        JOIN
            Employee E ON O.EmployeeID = E.EmployeeID
    ) AS SubqueryFlightInfo
WHERE
    PilotLicense LIKE 'CPL%';


-- THIS IS THE STORED FUNCTION 

-- Gets the number of flights that occur 
-- in the afternoon.
DELIMITER //
CREATE FUNCTION GetNumAfternoonFlights() RETURNS INT
BEGIN
    DECLARE numAfternoonFlights INT;
    
    SELECT COUNT(*)
    INTO numAfternoonFlights
    FROM Operates O
    JOIN Flight F ON O.TrackingNumber = F.TrackingNumber
    WHERE F.DepartureTime > '12:00:00';
    
    RETURN numAfternoonFlights;
END //
DELIMITER ;

-- Call function (8th Query) 
-- 
-- afternoon_flights.php
--
-- Gets number of flights of employee with certain ID.
SELECT GetNumAfternoonFlights() AS NumAfternoonFlights;




-- THIS IS THE STORED PROCEDURE 
--
-- Adds a new Passenger to the Passenger table.
DELIMITER //
CREATE PROCEDURE InsertPassenger(
    IN p_PassportNumber VARCHAR(10),
    IN p_FName VARCHAR(50),
    IN p_LName VARCHAR(50),
    IN p_NumBags INT
)
BEGIN
    INSERT INTO Passenger (PassportNumber, FName, LName, NumBags)
    VALUES (p_PassportNumber, p_FName, p_LName, p_NumBags);
END //
DELIMITER ;



-- Call procedure 
--
-- create_passenger.php
--
-- Call the InsertPassenger stored procedure
CALL InsertPassenger('D00366190', 'Jacob', 'Smith', 4);


-- TRIGGER 
--
-- After new passenger inserted add 1 to max planes in Aiport table.
DELIMITER //
CREATE TRIGGER UpdateMaxPlanes
AFTER INSERT ON Passenger 
FOR EACH ROW
BEGIN
    UPDATE Airport
    SET MaxPlanes = MaxPlanes + 1;
END //
DELIMITER ;


-- Random 10th query
--
-- search_by_name.php
--
-- User enters name into a fielder and the query returns 
-- users with the name first name.
SELECT FName, LName FROM Employee 
WHERE LOWER(FName) = LOWER(searchPromptName);