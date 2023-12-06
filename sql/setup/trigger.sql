
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