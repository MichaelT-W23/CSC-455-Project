class Passenger:
    def __init__(self, PassportNumber, FName, LName, NumBags):
        self._PassportNumber = PassportNumber
        self._FName = FName
        self._LName = LName
        self._NumBags = NumBags

    def get_passport_number(self):
        return self._PassportNumber

    def get_first_name(self):
        return self._FName

    def get_last_name(self):
        return self._LName

    def get_num_bags(self):
        return self._NumBags
    
    def __str__(self):
        #(PassportNumber, FName, LName, NumBags)
        return f"('{self.get_passport_number()}', '{self.get_first_name()}', '{self.get_last_name()}', {self.get_num_bags()}),"