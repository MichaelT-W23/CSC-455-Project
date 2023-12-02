class Airport:
    def __init__(self, AirportCode, City, State, Country, MaxPlanes):
        self._AirportCode = AirportCode
        self._City = City
        self._State = State
        self._Country = Country
        self._MaxPlanes = MaxPlanes

    def get_airport_code(self):
        return self._AirportCode

    def get_city(self):
        return self._City

    def get_state(self):
        return self._State

    def get_country(self):
        return self._Country

    def get_max_planes(self):
        return self._MaxPlanes
    

    def __str__(self):
        #(AirportCode, City, State, Country, MaxPlanes)
        return f"('{self.get_airport_code()}', '{self.get_city()}', '{self.get_state()}', '{self.get_country()}', {self.get_max_planes()}),"
