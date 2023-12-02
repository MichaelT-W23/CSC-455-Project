class Plane:
    def __init__(self, PlaneID, Model, SeatCapacity, Airport):
        self._PlaneID = PlaneID
        self._Model = Model
        self._SeatCapacity = SeatCapacity
        self._Airport = Airport

    def get_plane_id(self):
        return self._PlaneID

    def get_model(self):
        return self._Model

    def get_seat_capacity(self):
        return self._SeatCapacity

    def get_airport(self):
        return self._Airport

    def __str__(self):
        #(PlaneID, Model, SeatCapacity, Airport)
        return f"({self.get_plane_id()}, '{self.get_model()}', {self.get_seat_capacity()}, '{self.get_airport()}'),"