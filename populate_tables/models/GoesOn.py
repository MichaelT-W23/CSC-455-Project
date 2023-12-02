class GoesOn:
    def __init__(self, PassportNumber, TrackingNumber, FlightDate, ArrivalAirport, PlaneID, DepartureAirport, SeatNumber):
        self._PassportNumber = PassportNumber
        self._TrackingNumber = TrackingNumber
        self._FlightDate = FlightDate
        self._ArrivalAirport = ArrivalAirport
        self._PlaneID = PlaneID
        self._DepartureAirport = DepartureAirport
        self._SeatNumber = SeatNumber

    def get_passport_number(self):
        return self._PassportNumber

    def get_tracking_number(self):
        return self._TrackingNumber

    def get_flight_date(self):
        return self._FlightDate

    def get_arrival_airport(self):
        return self._ArrivalAirport

    def get_plane_id(self):
        return self._PlaneID

    def get_departure_airport(self):
        return self._DepartureAirport

    def get_seat_number(self):
        return self._SeatNumber
    

    def __str__(self):
        #(PassportNumber, TrackingNumber, FlightDate, ArrivalAirport, PlaneID, DepartureAirport, SeatNumber)
        return f"(\"{self.get_passport_number()}\", \"{self.get_tracking_number()}\", \"{self.get_flight_date()}\", \"{self.get_arrival_airport()}\", \"{self.get_plane_id()}\", \"{self.get_departure_airport()}\", \"{self.get_seat_number()}\"),"