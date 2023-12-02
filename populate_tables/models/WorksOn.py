class WorksOn:
    def __init__(self, EmployeeID, PlaneID):
        self._EmployeeID = EmployeeID
        self._PlaneID = PlaneID

    def get_employee_id(self):
        return self._EmployeeID

    def get_plane_id(self):
        return self._PlaneID

    def __str__(self):
        #(EmployeeID, PlaneID)
        return f"({self.get_employee_id()}, {self.get_plane_id()}),"