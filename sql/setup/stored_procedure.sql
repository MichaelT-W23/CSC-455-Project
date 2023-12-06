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