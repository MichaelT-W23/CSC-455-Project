INSERT INTO Airport (AirportCode, City, State, Country, MaxPlanes) VALUES
('TDL', 'New York City', 'AL', 'Afghanistan', 9),
('PEK', 'Los Angeles', 'AK', 'Albania', 4),
('LHR', 'Chicago', 'AZ', 'Algeria', 10),
('DXB', 'Houston', 'AR', 'Andorra', 2),
('FRA', 'Phoenix', 'CA', 'Angola', 5),
('ICN', 'Philadelphia', 'CO', 'Antigua and Barbuda', 9),
('AMS', 'San Antonio', 'CT', 'Argentina', 1),
('SIN', 'San Diego', 'DE', 'Armenia', 5),
('HKG', 'Dallas', 'FL', 'Australia', 5),
('LAX', 'San Jose', 'GA', 'Austria', 7),
('ORD', 'Austin', 'HI', 'Azerbaijan', 1),
('DEN', 'Jacksonville', 'ID', 'Bahamas', 4));


INSERT INTO Employee (EmployeeID, FName, LName, PhoneNumber, PilotLicense, AirportCode) VALUES
(56012553, 'Jacob', 'Smith', '404-435-1255', 'CPL-938474', 'TDL'),
(26343868, 'Michael', 'Johnson', '404-473-1328', 'CPL-145463', 'PEK'),
(80620555, 'Joshua', 'Williams', '786-340-6891', 'CPL-878742', 'LHR'),
(56904133, 'Matthew', 'Brown', '704-094-1076', 'CPL-516656', 'DXB'),
(93078382, 'Ethan', 'Jones', '512-750-4651', 'CPL-623216', 'FRA'),
(24267739, 'Andrew', 'Garcia', '404-765-9869', 'CPL-974572', 'ICN'),
(56135977, 'Daniel', 'Miller', '786-972-5198', 'ATPL-754973', 'AMS'),
(86495494, 'Anthony', 'Davis', '704-280-5259', 'PPL-337133', 'SIN'),
(14698451, 'Joseph', 'Rodriguez', '310-257-0813', 'PPL-993414', 'HKG'),
(61338325, 'Christopher', 'Martinez', '704-072-5776', 'CPL-745588', 'LAX'),
(71189685, 'William', 'Hernandez', '212-172-5008', 'ATPL-177727', 'ORD'),
(94930792, 'David', 'Lopez', '858-262-2531', 'PPL-824565', 'DEN'),
(23672145, 'Alexander', 'Gonzalez', '404-658-9904', 'CPL-275386', 'YYZ'),
(30266030, 'Ryan', 'Wilson', '713-057-2659', 'PPL-991387', 'MEX'));


INSERT INTO Flight (ArrivalAirport, DepartureAirport, PlaneID, TrackingNumber, FlightDate, DepartureTime, ArrivalTime, GateNumber) VALUES
('DCA', 'ATL', 471, 'KN799', '2023-12-02', '08:00:00', '11:15:00', 'A1'),
('PHL', 'PEK', 4304, 'FC216', '2023-12-03', '08:15:00', '11:15:00', 'A2'),
('LGA', 'LHR', 4057, 'SW977', '2023-12-04', '08:30:00', '11:00:00', 'A3'),
('IST', 'DXB', 5039, 'XT418', '2023-12-05', '08:45:00', '11:45:00', 'A4'),
('CPH', 'HND', 4826, 'GO256', '2023-12-06', '09:00:00', '10:15:00', 'A5'),
('DEL', 'FRA', 4635, 'UG860', '2023-12-07', '09:15:00', '11:15:00', 'A6'),
('BCN', 'SYD', 1796, 'MS529', '2023-12-08', '09:30:00', '11:30:00', 'A7'),
('SYD', 'ICN', 3138, 'YJ617', '2023-12-09', '09:45:00', '10:45:00', 'A8'),
('IAD', 'AMS', 9318, 'RW748', '2023-12-10', '10:00:00', '13:00:00', 'A9'),
('DFW', 'SIN', 1008, 'XI589', '2023-12-11', '10:15:00', '13:45:00', 'A10'),
('PDX', 'HKG', 4119, 'GJ404', '2023-12-12', '10:30:00', '12:00:00', 'A11'),
('DTW', 'CDG', 8218, 'EJ828', '2023-12-13', '10:45:00', '13:45:00', 'A12'),
('FRA', 'LAX', 4741, 'BB825', '2023-12-14', '11:00:00', '14:30:00', 'A13'),
('CPH', 'ORD', 1184, 'TH993', '2023-12-15', '11:15:00', '14:45:00', 'A14'),
('HND', 'IST', 1988, 'DT123', '2023-12-16', '11:30:00', '12:45:00', 'A15'));

INSERT INTO GoesOn (PassportNumber, TrackingNumber, FlightDate, DepartureAirport, SeatNumber) VALUES
('D00366190', 'KN799', '2023-12-02', 'ATL', 360),
('C17694564', 'FC216', '2023-12-03', 'PEK', 106),
('R52209597', 'SW977', '2023-12-04', 'LHR', 114),
('O46716844', 'XT418', '2023-12-05', 'DXB', 281),
('A48504457', 'GO256', '2023-12-06', 'HND', 50),
('P65296337', 'UG860', '2023-12-07', 'FRA', 55),
('D19797813', 'MS529', '2023-12-08', 'SYD', 241),
('R81212141', 'YJ617', '2023-12-09', 'ICN', 355),
('Q83234538', 'RW748', '2023-12-10', 'AMS', 45),
('Z50355929', 'XI589', '2023-12-11', 'SIN', 119),
('F01904388', 'GJ404', '2023-12-12', 'HKG', 385),
('R04048480', 'EJ828', '2023-12-13', 'CDG', 89),
('A72796368', 'BB825', '2023-12-14', 'LAX', 112),
('Z98157616', 'TH993', '2023-12-15', 'ORD', 231),
('H03462321', 'DT123', '2023-12-16', 'IST', 32),
('W40141682', 'LD469', '2023-12-17', 'DEN', 103));




INSERT INTO Operates (EmployeeID, TrackingNumber, FlightDate, DepartureAirport) VALUES
(56012553, 'KN799', '2023-12-02', 'ATL'),
(26343868, 'FC216', '2023-12-03', 'PEK'),
(80620555, 'SW977', '2023-12-04', 'LHR'),
(56904133, 'XT418', '2023-12-05', 'DXB'),
(93078382, 'GO256', '2023-12-06', 'HND'),
(24267739, 'UG860', '2023-12-07', 'FRA'),
(56135977, 'MS529', '2023-12-08', 'SYD'),
(86495494, 'YJ617', '2023-12-09', 'ICN'),
(14698451, 'RW748', '2023-12-10', 'AMS'),
(61338325, 'XI589', '2023-12-11', 'SIN'),
(71189685, 'GJ404', '2023-12-12', 'HKG'),
(94930792, 'EJ828', '2023-12-13', 'CDG'),
(23672145, 'BB825', '2023-12-14', 'LAX'),
(30266030, 'TH993', '2023-12-15', 'ORD'),
(20211082, 'DT123', '2023-12-16', 'IST'),
(80195544, 'LD469', '2023-12-17', 'DEN'),
(25142684, 'QF814', '2023-12-18', 'BKK'));




INSERT INTO Passenger (PassportNumber, FName, LName, NumBags) VALUES
('D00366190', 'Jacob', 'Smith', 4),
('C17694564', 'Michael', 'Johnson', 4),
('R52209597', 'Joshua', 'Williams', 1),
('O46716844', 'Matthew', 'Brown', 1),
('A48504457', 'Ethan', 'Jones', 1),
('P65296337', 'Andrew', 'Garcia', 2),
('D19797813', 'Daniel', 'Miller', 2),
('R81212141', 'Anthony', 'Davis', 5),
('Q83234538', 'Joseph', 'Rodriguez', 1),
('Z50355929', 'Christopher', 'Martinez', 6),
('F01904388', 'William', 'Hernandez', 2),
('R04048480', 'David', 'Lopez', 2),
('A72796368', 'Alexander', 'Gonzalez', 4));






INSERT INTO Plane (PlaneID, Model, SeatCapacity, AirportCode) VALUES
(471, 'Airbus A220', 410, 'TDL'),
(4304, 'Airbus A300', 405, 'PEK'),
(4057, 'Airbus A310', 157, 'LHR'),
(5039, 'Airbus A318', 381, 'DXB'),
(4826, 'Airbus A319', 232, 'FRA'),
(4635, 'Airbus A320', 286, 'ICN'),
(1796, 'Airbus A321', 313, 'AMS'),
(3138, 'Airbus A330', 449, 'SIN'),
(9318, 'Airbus A340', 347, 'HKG'),
(1008, 'Airbus A350', 500, 'LAX'),
(4119, 'Airbus A380', 442, 'ORD'),
(8218, 'Boeing 707', 270, 'DEN'),
(4741, 'Boeing 717', 167, 'YYZ'),
(1184, 'Boeing 727', 284, 'MEX'));








INSERT INTO WorksOn (EmployeeID, PlaneID) VALUES
(56012553, 471),
(26343868, 4304),
(80620555, 4057),
(56904133, 5039),
(93078382, 4826),
(24267739, 4635),
(56135977, 1796),
(86495494, 3138),
(14698451, 9318),
(61338325, 1008),
(71189685, 4119));





















