class Employee:
    def __init__(self, EmployeeID, FName, LName, PhoneNumber, PilotLicense, AirportCode):
        self._employee_id = EmployeeID
        self._f_name = FName
        self._l_name = LName
        self._phone_number = PhoneNumber
        self._pilot_license = PilotLicense
        self._airport_code = AirportCode

    def employee_id(self):
        return self._employee_id

    def f_name(self):
        return self._f_name
    
    def l_name(self):
        return self._l_name
    
    def phone_number(self):
        return self._phone_number

    def pilot_license(self):
        return self._pilot_license
    
    def airport_code(self):
        return self._airport_code

    def __str__(self):
        #(1, 'John', 'Doe', '123-456-7890', 'PL12345', 'JFK');
        return f"({self.employee_id()}, '{self.f_name()}', '{self.l_name()}', '{self.phone_number()}', '{self.pilot_license()}', '{self.airport_code()}'),"