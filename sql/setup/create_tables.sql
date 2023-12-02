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

-- Create Operates Table
CREATE TABLE Operates (
    EmployeeID INT,
    TrackingNumber VARCHAR(50),
    FlightDate DATE,
    ArrivalAirport VARCHAR(10),
    PlaneID INT,
    DepartureAirport VARCHAR(10),
    PRIMARY KEY (EmployeeID, TrackingNumber, FlightDate, ArrivalAirport, PlaneID, DepartureAirport),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (TrackingNumber, FlightDate, ArrivalAirport, PlaneID, DepartureAirport) REFERENCES Flight(TrackingNumber, FlightDate, ArrivalAirport, PlaneID, DepartureAirport)
);

-- Create Airport Table
CREATE TABLE Airport (
    AirportCode VARCHAR(10) PRIMARY KEY,
    City VARCHAR(255),
    State VARCHAR(255),
    Country VARCHAR(255),
    MaxPlanes INT
);

-- Create WorksOn Table
CREATE TABLE WorksOn (
    EmployeeID INT,
    PlaneID INT,
    PRIMARY KEY (EmployeeID, PlaneID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (PlaneID) REFERENCES Plane(PlaneID)
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

-- Create Plane Table
CREATE TABLE Plane (
    PlaneID INT PRIMARY KEY,
    Model VARCHAR(255),
    SeatCapacity INT,
    Airport VARCHAR(10),
    FOREIGN KEY (Airport) REFERENCES Airport(AirportCode)
);

-- Create Passenger Table
CREATE TABLE Passenger (
    PassportNumber VARCHAR(50) PRIMARY KEY,
    FName VARCHAR(255),
    LName VARCHAR(255),
    NumBags INT
);

-- Create GoesOn Table
CREATE TABLE GoesOn (
    PassportNumber VARCHAR(50),
    TrackingNumber VARCHAR(50),
    FlightDate DATE,
    ArrivalAirport VARCHAR(10),
    PlaneID INT,
    DepartureAirport VARCHAR(10),
    SeatNumber INT,
    PRIMARY KEY (PassportNumber, TrackingNumber, FlightDate, ArrivalAirport, PlaneID, DepartureAirport),
    FOREIGN KEY (PassportNumber) REFERENCES Passenger(PassportNumber),
    FOREIGN KEY (TrackingNumber, FlightDate, ArrivalAirport, PlaneID, DepartureAirport) REFERENCES Flight(TrackingNumber, FlightDate, ArrivalAirport, PlaneID, DepartureAirport)
);
