-- Adds a new row to the WorksOn table where 
-- the EmployeeID is set the employeeID 
-- parameter and the PlaneID is set the planeId 
-- parameter

DELIMITER //
CREATE PROCEDURE AssignPlaneToEmployee(employeeID INT, planeID INT)
BEGIN
    INSERT INTO WorksOn (EmployeeID, PlaneID)
    VALUES (employeeID, planeID);
END;
DELIMITER;