-- Execute each query one by one. Don't just copy and paste whole file.

-- Execute queries in order from top to bottom.

--DON'T COPY THE COMMENTS 

-- Create Passenger Table
CREATE TABLE Passenger (
    PassportNumber VARCHAR(50) PRIMARY KEY,
    FName VARCHAR(255),
    LName VARCHAR(255),
    NumBags INT
);

-- Create Airport Table
CREATE TABLE Airport (
    AirportCode VARCHAR(10) PRIMARY KEY,
    City VARCHAR(255),
    State VARCHAR(255),
    Country VARCHAR(255),
    MaxPlanes INT
);

-- Create Plane Table
CREATE TABLE Plane (
    PlaneID INT PRIMARY KEY,
    Model VARCHAR(255),
    SeatCapacity INT,
    Airport VARCHAR(10),
    FOREIGN KEY (Airport) REFERENCES Airport(AirportCode)
);

-- Create Flight Table
CREATE TABLE Flight (
    ArrivalAirport VARCHAR(10),
    DepartureAirport VARCHAR(10),
    PlaneID INT,
    TrackingNumber VARCHAR(50),
    FlightDate DATE,
    DepartureTime TIME,
    ArrivalTime TIME,
    GateNumber VARCHAR(10),
    PRIMARY KEY (ArrivalAirport, DepartureAirport, PlaneID, TrackingNumber, FlightDate),
    FOREIGN KEY (ArrivalAirport) REFERENCES Airport(AirportCode),
    FOREIGN KEY (DepartureAirport) REFERENCES Airport(AirportCode),
    FOREIGN KEY (PlaneID) REFERENCES Plane(PlaneID)
);

-- Create Employee Table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FName VARCHAR(255),
    LName VARCHAR(255),
    PhoneNumber VARCHAR(15),
    PilotLicense VARCHAR(50),
    AirportCode VARCHAR(10),
    FOREIGN KEY (AirportCode) REFERENCES Airport(AirportCode)
);

-- Create GoesOn Table
CREATE TABLE GoesOn (
    PassportNumber VARCHAR(50),
    TrackingNumber VARCHAR(50),
    FlightDate DATE,
    DepartureAirport VARCHAR(10),
    SeatNumber INT,
    PRIMARY KEY (PassportNumber, TrackingNumber, FlightDate, DepartureAirport)
);

-- EXECUTE THIS PART 1 LINE AT A TIME. Alter table/add constraint is considered 1 line.
CREATE INDEX i1 ON Flight(DepartureAirport);

ALTER TABLE GoesOn
ADD CONSTRAINT fk4 FOREIGN KEY (DepartureAirport) REFERENCES Flight(DepartureAirport);


CREATE INDEX i2 ON Flight(TrackingNumber);

ALTER TABLE GoesOn
ADD CONSTRAINT fk2 FOREIGN KEY (TrackingNumber) REFERENCES Flight(TrackingNumber);



CREATE INDEX i3 ON Flight(FlightDate);

ALTER TABLE GoesOn
ADD CONSTRAINT fk3 FOREIGN KEY (FlightDate) REFERENCES Flight(FlightDate);
--------------------------------------------------------------------------------------

-- Create Operates Table
CREATE TABLE Operates (
    EmployeeID INT,
    TrackingNumber VARCHAR(50),
    FlightDate DATE,
    DepartureAirport VARCHAR(10),
    PRIMARY KEY (EmployeeID, TrackingNumber, FlightDate, DepartureAirport),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (TrackingNumber) REFERENCES Flight(TrackingNumber),
    FOREIGN KEY (FlightDate) REFERENCES Flight(FlightDate),
    FOREIGN KEY (DepartureAirport) REFERENCES Flight(DepartureAirport)
);


-- Create WorksOn Table
CREATE TABLE WorksOn (
    EmployeeID INT,
    PlaneID INT,
    PRIMARY KEY (EmployeeID, PlaneID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (PlaneID) REFERENCES Plane(PlaneID)
);



