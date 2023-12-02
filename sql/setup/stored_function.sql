-- This function calculates the number of rows 
-- in the operates table when the EmployeeID and 
-- employeeID are the same. Returns the number 
-- of flights.
--
-- The parameter is the employeedID to be matched 
--
DELIMITER //
CREATE FUNCTION GetNumFlightsByEmployee(employeeID INT) RETURNS INT
BEGIN
    DECLARE numFlights INT;
    SELECT COUNT(*) INTO numFlights
    FROM Operates
    WHERE EmployeeID = employeeID;
    RETURN numFlights;
END;
DELIMITER ;
