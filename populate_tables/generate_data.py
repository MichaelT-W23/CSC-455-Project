from models.Airport import Airport
from models.Employee import Employee
from models.Flight import Flight
from models.GoesOn import GoesOn
from models.Operates import Operates
from models.Passenger import Passenger
from models.Plane import Plane
from models.WorksOn import WorksOn

def create_insert_statements(table_name: str, table_vals: str, model_list: list):
    insert_str = f"INSERT INTO {table_name} {table_vals} VALUES\n"
# VALUES ('P123456', 'TN123', '2023-01-01', 'XYZ', 123, 'ABC', 15);
# "

    # get rid of last comma. Add semicolon ;
    return None 

def file_to_list(file_name):
    lines = []

    with open(file_name, 'r') as file:
        for line in file:
            lines.append(line.strip())
    
    return lines 

employee_ids = file_to_list("values/EmployeeID.txt")
f_names = file_to_list("values/FName.txt")
l_names = file_to_list("values/LName.txt")
phone_numbers = file_to_list("values/PhoneNumber.txt")
pilot_licenses = file_to_list("values/PilotLicense.txt")
airport_codes = file_to_list("values/AirportCode.txt")
tracking_numbers = file_to_list("values/TrackingNumber.txt")
flight_dates = file_to_list("values/FlightDate.txt")
arrival_airports = file_to_list("values/ArrivalAirport.txt")
plane_ids = file_to_list("values/PlaneID.txt")
departure_airports = file_to_list("values/DepartureAirport.txt")
cities = file_to_list("values/City.txt")
states = file_to_list("values/State.txt")
countries = file_to_list("values/Country.txt")
max_planes = file_to_list("values/MaxPlanes.txt")
departure_times = file_to_list("values/DepartureTime.txt")
arrival_times = file_to_list("values/ArrivalTime.txt")
gate_numbers = file_to_list("values/GateNumber.txt")
models = file_to_list("values/Model.txt")
seat_capacities = file_to_list("values/SeatCapacity.txt")
airports = file_to_list("values/Airport.txt")
passport_numbers = file_to_list("values/PassportNumber.txt")
num_bags = file_to_list("values/NumBags.txt")
seat_numbers = file_to_list("values/SeatNumber.txt")

def generate_airports():
    table_vals = "(AirportCode, City, State, Country, MaxPlanes)"
    return None 

def generate_employees():
    table_vals = "(EmployeeID, FName, LName, PhoneNumber, PilotLicense, AirportCode)"
    return None 

def generate_flights():
    table_vals = "(ArrivalAirport, DepartureAirport, PlaneID, TrackingNumber, FlightDate, DepartureTime, ArrivalTime, GateNumber)"
    return None 

def generate_goeson():
    table_vals = "(PassportNumber, TrackingNumber, FlightDate, ArrivalAirport, PlaneID, DepartureAirport, SeatNumber)"
    return None 

def generate_operates():
    table_vals = "(EmployeeID, TrackingNumber, FlightDate, ArrivalAirport, PlaneID, DepartureAirport)"
    return None 

def generate_passengers():
    table_vals = "(PassportNumber, FName, LName, NumBags)"
    return None 

def generate_plane():
    table_vals = "(PlaneID, Model, SeatCapacity, Airport)"
    return None 

def generate_workson():
    table_vals = "(EmployeeID, PlaneID)"
    return None 


