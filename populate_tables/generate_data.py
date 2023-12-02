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

    for i in range(len(model_list)):
        insert_str += str(model_list[i]) + "\n"

    final_str = insert_str.strip()[:-1]

    with open(f"insert_statments/{table_name.lower()}_insert.sql", "w") as file:
        file.write(f"{final_str};")


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

    airports = [Airport(airport_codes[i], cities[i], states[i], countries[i], int(max_planes[i])) for i in range(200)]

    create_insert_statements("Airport", table_vals, airports)

    print("Generated airports")

def generate_employees():
    table_vals = "(EmployeeID, FName, LName, PhoneNumber, PilotLicense, AirportCode)"

    employees = []

    for i in range(200):
        employees.append(Employee(int(employee_ids[i]), f_names[i], l_names[i], phone_numbers[i], pilot_licenses[i], airport_codes[i]))

    create_insert_statements('Employee', table_vals, employees)

    print("Generated Employees")

def generate_flights():
    table_vals = "(ArrivalAirport, DepartureAirport, PlaneID, TrackingNumber, FlightDate, DepartureTime, ArrivalTime, GateNumber)"

    flights = []

    for i in range(200):
        flights.append(Flight(arrival_airports[i], departure_airports[i], int(plane_ids[i]), tracking_numbers[i], flight_dates[i], departure_airports[i], arrival_times[i], gate_numbers[i]))

    create_insert_statements('Flight', table_vals, flights)

    print("Generated Flights")

def generate_goeson():
    table_vals = "(PassportNumber, TrackingNumber, FlightDate, ArrivalAirport, PlaneID, DepartureAirport, SeatNumber)"

    goes_on = []

    for i in range(200):
        goes_on.append(GoesOn(passport_numbers[i], tracking_numbers[i], flight_dates[i], arrival_airports[i], int(plane_ids[i]), departure_airports[i], int(seat_numbers[i])))

    create_insert_statements('GoesOn', table_vals, goes_on)

    print("Generated goeson")

def generate_operates():
    table_vals = "(EmployeeID, TrackingNumber, FlightDate, ArrivalAirport, PlaneID, DepartureAirport)"

    operates = []

    for i in range(200):
        operates.append(Operates(int(employee_ids[i]), tracking_numbers[i], flight_dates[i], arrival_airports[i], int(plane_ids[i]), departure_airports[i]))

    create_insert_statements('Operates', table_vals, operates)

    print("Generated operates")

def generate_passengers():
    table_vals = "(PassportNumber, FName, LName, NumBags)"

    passengers = [Passenger(passport_numbers[i], f_names[i], l_names[i], int(num_bags[i])) for i in range(200)]
    
    create_insert_statements('Passenger', table_vals, passengers)

    print("Generated passengers")

def generate_plane():
    table_vals = "(PlaneID, Model, SeatCapacity, Airport)"

    planes = [Plane(int(plane_ids[i]), models[i], int(seat_capacities[i]), airports[i]) for i in range(200)]

    create_insert_statements('Plane', table_vals, planes)

    print("Generated planes")


def generate_workson():
    table_vals = "(EmployeeID, PlaneID)"

    works_on = [WorksOn(int(employee_ids[i]), int(plane_ids[i])) for i in range(200)]

    create_insert_statements('WorksOn', table_vals, works_on)

    print("Generated workson")


"""
Call the functions to generate insert statements
"""
generate_airports()

generate_employees()

generate_flights()

generate_goeson()

generate_operates()

generate_passengers()

generate_plane()

generate_workson()