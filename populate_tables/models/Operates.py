class Operates:
    def __init__(self, EmployeeID, TrackingNumber, FlightDate, DepartureAirport):
        self._EmployeeID = EmployeeID
        self._TrackingNumber = TrackingNumber
        self._FlightDate = FlightDate
        self._DepartureAirport = DepartureAirport

    def get_employee_id(self):
        return self._EmployeeID

    def get_tracking_number(self):
        return self._TrackingNumber

    def get_flight_date(self):
        return self._FlightDate

    def get_departure_airport(self):
        return self._DepartureAirport

    def __str__(self):
        #(EmployeeID, TrackingNumber, FlightDate, ArrivalAirport, PlaneID, DepartureAirport)
        return f"({self.get_employee_id()}, '{self.get_tracking_number()}', '{self.get_flight_date()}', '{self.get_departure_airport()}'),"