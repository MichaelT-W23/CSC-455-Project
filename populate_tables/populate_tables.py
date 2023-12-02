from models.Airport import Airport
from models.Employee import Employee
from models.Flight import Flight
from models.GoesOn import GoesOn
from models.Operates import Operates
from models.Passenger import Passenger
from models.Plane import Plane
from models.WorksOn import WorksOn



a = Airport('ABC', 'City1', 'State1', 'Country1', 50);
e = Employee(1, 'John', 'Doe', '123-456-7890', 'P12345', 'ABC')
f = Flight('XYZ', 'ABC', 123, 'TN123', '2023-01-01', '12:00:00', '14:00:00', 'Gate1')
g = GoesOn('P123456', 'TN123', '2023-01-01', 'XYZ', 123, 'ABC', 15)
o = Operates(1, 'TN123', '2023-01-01', 'XYZ', 123, 'ABC')
p = Passenger('P123456', 'Alice', 'Smith', 2)
pl = Plane(123, 'Boeing 737', 150, 'ABC')
wo = WorksOn(1, 123)



print(a)
print(e)
print(f)
print(g)

print(o)
print(p)
print(pl)
print(wo)



# def file_to_list(file_name):
#     lines = []

#     with open(file_name, 'r') as file:
#         for line in file:
#             lines.append(line.strip())
    
#     return lines 


# stuff = file_to_list("values/employees.txt")

# os.chdir("values")


# for s in stuff:
#     os.system(f"touch {s}.txt")
#     print(f"{s.lower()} = file_to_list(\"values/{s}.txt\")")





# INSERT INTO Employee (EmployeeID, FName, LName, PhoneNumber, PilotLicense, AirportCode)
# VALUES (1, 'John', 'Doe', '123-456-7890', 'P12345', 'ABC');

# INSERT INTO Operates (EmployeeID, TrackingNumber, FlightDate, ArrivalAirport, PlaneID, DepartureAirport)
# VALUES (1, 'TN123', '2023-01-01', 'XYZ', 123, 'ABC');

# INSERT INTO Airport (AirportCode, City, State, Country, MaxPlanes)
# VALUES ('ABC', 'City1', 'State1', 'Country1', 50);

# INSERT INTO WorksOn (EmployeeID, PlaneID)
# VALUES (1, 123);

# INSERT INTO Flight (ArrivalAirport, DepartureAirport, PlaneID, TrackingNumber, FlightDate, DepartureTime, ArrivalTime, GateNumber)
# VALUES ('XYZ', 'ABC', 123, 'TN123', '2023-01-01', '12:00:00', '14:00:00', 'Gate1');


# INSERT INTO Plane (PlaneID, Model, SeatCapacity, Airport)
# VALUES (123, 'Boeing 737', 150, 'ABC');


# INSERT INTO Passenger (PassportNumber, FName, LName, NumBags)
# VALUES ('P123456', 'Alice', 'Smith', 2);


# INSERT INTO GoesOn (PassportNumber, TrackingNumber, FlightDate, ArrivalAirport, PlaneID, DepartureAirport, SeatNumber)
# VALUES ('P123456', 'TN123', '2023-01-01', 'XYZ', 123, 'ABC', 15);




