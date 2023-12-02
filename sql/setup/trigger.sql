DELIMITER  //
CREATE TRIGGER UpdateNumBags
AFTER INSERT ON GoesOn
FOR EACH ROW
BEGIN
    UPDATE Passenger
    SET NumBags = NumBags + 1
    WHERE PassportNumber = NEW.PassportNumber;
END;
DELIMITER ;
