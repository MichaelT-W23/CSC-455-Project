class Flight:
    def __init__(self, ArrivalAirport, DepartureAirport, PlaneID, TrackingNumber, FlightDate, DepartureTime, ArrivalTime, GateNumber):
        self._ArrivalAirport = ArrivalAirport
        self._DepartureAirport = DepartureAirport
        self._PlaneID = PlaneID
        self._TrackingNumber = TrackingNumber
        self._FlightDate = FlightDate
        self._DepartureTime = DepartureTime
        self._ArrivalTime = ArrivalTime
        self._GateNumber = GateNumber

    def get_arrival_airport(self):
        return self._ArrivalAirport

    def get_departure_airport(self):
        return self._DepartureAirport

    def get_plane_id(self):
        return self._PlaneID

    def get_tracking_number(self):
        return self._TrackingNumber

    def get_flight_date(self):
        return self._FlightDate

    def get_departure_time(self):
        return self._DepartureTime

    def get_arrival_time(self):
        return self._ArrivalTime

    def get_gate_number(self):
        return self._GateNumber
    
    def __str__(self):
        #(ArrivalAirport, DepartureAirport, PlaneID, TrackingNumber, FlightDate, DepartureTime, ArrivalTime, GateNumber)
        return f"('{self.get_arrival_airport()}', '{self.get_departure_airport()}', {self.get_plane_id()}, '{self.get_tracking_number()}', '{self.get_flight_date()}', '{self.get_departure_time()}', '{self.get_arrival_time()}', '{self.get_gate_number()}'),"