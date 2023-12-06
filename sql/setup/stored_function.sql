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
