-- Class: CSE 3330
-- Semester: Spring 2018
-- Student Name: Rahimzadeh, Nima, nfr8557
-- Student ID: 1000988557
-- Assignment: Project #1

INSERT INTO PlaneType (Maker, Model, FlyingSpeed, GroundSpeed)
    Values 
        ('MD', 'MD11', 600, 180),
        ('MD', 'SUPER80', 500, 170),
        ('BOEING', '727', 510, 160),
        ('BOEING', '757', 650, 160),
        ('AIRBUS', 'A300', 620, 150),
        ('AIRBUS', 'A320', 700, 180);

INSERT INTO Airport (Code, City, State)
    Values 
        ('DFW', 'Dallas', 'TX'),
        ('LOG', 'Boston', 'MA'),
        ('ORD', 'Chicago', 'IL'),
        ('MDW', 'Chicago', 'IL'),
        ('JFK', 'New York', 'NY'),
        ('LGA', 'New York', 'NY'),
        ('INT', 'Houston', 'TX'),
        ('LAX', 'Los Angeles', 'CA');


INSERT INTO Passenger (Name, Phone)
    Values 
        ('Jones','(972)999-1111'),
        ('James','(214)111-9999'),
        ('Henry','(214)222-1111'),
        ('Luis','(972)111-3333'),
        ('Howard','(972)333-1111'),
        ('Frank','(214)111-5555'),
        ('Frankel','(972)111-2222'),
        ('Bushnell','(214)111-4444'),
        ('Camden','(214)222-5555'),
        ('Max','(972)444-1111'),
        ('Flores','(214)333-6666'),
        ('Clinton','(214)222-5555');

INSERT INTO Pilot (Name, DateHired)
    Values 
        ('Jones','1990-05-10'),
        ('Adams','1990-06-01'),
        ('Walker','1991-07-02'),
        ('Flores','1992-04-01'),
        ('Thompson','1992-4-10'),
        ('Dean','1993-09-02'),
        ('Carter','1994-08-01'),
        ('Mango','1995-05-02');

INSERT INTO Flight (FLNO, Meal, Smoking)
    Values 
        ('1000','Bistro','Y'),
        ('1010','Meal','N'),
        ('1020','Meal','Y'),
        ('1030','Snack','N'),
        ('1040','Meal','N');

INSERT INTO PlaneSeats (Maker, Model, SeatType, NoOfSeats)
    Values 
        ('MD','MD11','F',20),
        ('MD','MD11','E',150),
        ('MD','SUPER80','F',10),
        ('MD','SUPER80','E',90),
        ('BOEING','727','F',10),
        ('BOEING','727','E',110),
        ('BOEING','757','F',20),
        ('BOEING','757','E',160),
        ('AIRBUS','A300','F',20),
        ('AIRBUS','A300','E',160),
        ('AIRBUS','A320','F',30),
        ('AIRBUS','A320','E',200);

INSERT INTO Plane (Maker, Model, LastMaint, LastMaintA)
    Values 
        ('MD','MD11','2002-09-03','DFW'),
        ('MD','MD11','2002-09-04','MDW'),
        ('MD','SUPER80','2002-09-01','LAX'),
        ('MD','SUPER80','2002-09-03','ORD'),
        ('MD','SUPER80','2002-09-06','LGA'),
        ('BOEING','727','2002-09-01','DFW'),
        ('BOEING','757','2002-10-02','LAX'),
        ('AIRBUS','A300','2002-09-01','INT'),
        ('AIRBUS','A320','2002-09-04','LOG');

INSERT INTO FlightInstance (FLNO, FDate)
    Values 
        ('1000', '2002-10-05'),
        ('1000', '2002-10-06'),
        ('1000', '2002-10-07'),
        ('1010', '2002-10-05'),
        ('1010', '2002-10-06'),
        ('1020', '2002-10-05'),
        ('1030', '2002-10-05'),
        ('1040', '2002-10-07');

INSERT INTO Reservation (PassID, FLNO, FDate, FromA, ToA, SeatClass, DateBooked)
    Values 
        (1,'1000','2002-10-05','DFW','LOG','E','2002-09-05'),
        (1,'1020','2002-10-05','LOG','JFK','E','2002-09-14'),
        (2,'1020','2002-10-05','LOG','INT','E','2002-09-04'),
        (3,'1020','2002-10-05','JFK','LAX','E','2002-09-19'),
        (4,'1020','2002-10-05','LOG','LAX','E','2002-09-10'),
        (5,'1020','2002-10-05','LOG','DFW','F','2002-09-29'),
        (6,'1010','2002-10-05','LAX','JFK','E','2002-09-19'),
        (7,'1010','2002-10-05','LAX','ORD','E','2002-09-27'),
        (8,'1030','2002-10-05','LAX','DFW','F','2002-10-05'),
        (3,'1010','2002-10-06','LAX','JFK','E','2002-09-14'),
        (9,'1010','2002-10-06','LAX','JFK','E','2002-09-09');


INSERT INTO Reservation (PassID, FLNO, FDate, FromA, ToA, SeatClass, DateBooked, DateCancelled)
    Values 
        (10,'1010','2002-10-06','ORD','JFK','E','2002-09-07', '2002-09-19');


INSERT INTO Reservation (PassID, FLNO, FDate, FromA, ToA, SeatClass, DateBooked)
    Values 
        (11,'1000','2002-10-06','DFW','LOG','E','2002-09-09'),
        (12,'1000','2002-10-06','DFW','LOG','E','2002-09-19'),
        (1,'1010','2002-10-06','ORD','JFK','E','2002-09-15'),
        (1,'1040','2002-10-07','LAX','LGA','E','2002-10-01');


INSERT INTO FlightLeg (FLNO, Seq, FromA, ToA, DeptTime, ArrTime, Plane)
    Values 
        ('1000',1,'DFW','LOG','2001-01-01 10:20:00','2001-01-01 13:40:00',7),
        ('1010',1,'LAX','ORD','2001-01-01 13:10:00','2001-01-01 16:20:00',3),
        ('1010',2,'ORD','JFK','2001-01-01 17:10:00','2001-01-01 20:20:00',3),
        ('1020',1,'LOG','JFK','2001-01-01 05:40:00','2001-01-01 06:20:00',9),
        ('1020',2,'JFK','DFW','2001-01-01 07:20:00','2001-01-01 10:20:00',9),
        ('1020',3,'DFW','INT','2001-01-01 11:10:00','2001-01-01 11:40:00',7),
        ('1020',4,'INT','LAX','2001-01-01 12:20:00','2001-01-01 15:10:00',7),
        ('1030',1,'LAX','INT','2001-01-01 11:20:00','2001-01-01 16:10:00',6),
        ('1030',2,'INT','DFW','2001-01-01 17:20:00','2001-01-01 18:00:00',6),
        ('1040',1,'LAX','LGA','2002-01-01 15:30:00','2001-01-01 21:00:00',1);


INSERT INTO FlightLegInstance (Seq, FLNO, FDate, ActDept, ActArr, Pilot)
    Values 
        (1,'1000','2002-10-05','2002-01-01 10:10:00','2002-01-01 13:10:00',3),
        (1,'1000','2002-10-06','2002-01-01 10:30:00','2002-01-01 14:20:00',8),
        (1,'1010','2002-10-05','2002-01-01 13:20:00','2002-01-01 17:10:00',1),
        (2,'1010','2002-10-05','2002-01-01 18:00:00','2002-01-01 21:00:00',1),
        (1,'1010','2002-10-06','2002-01-01 13:10:00','2002-01-01 16:10:00',3),
        (2,'1010','2002-10-06','2002-01-01 17:00:00','2002-01-01 20:30:00',6),
        (1,'1020','2002-10-05','2002-01-01 05:40:00','2002-01-01 06:30:00',5),
        (2,'1020','2002-10-05','2002-01-01 07:30:00','2002-01-01 10:40:00',5),
        (3,'1020','2002-10-05','2002-01-01 11:30:00','2002-01-01 12:20:00',5),
        (4,'1020','2002-10-05','2002-01-01 13:00:00','2002-01-01 16:00:00',2),
        (1,'1030','2002-10-05','2002-01-01 11:20:00','2002-01-01 16:10:00',8),
        (2,'1030','2002-10-05','2002-01-01 17:20:00','2002-01-01 18:40:00',8);


INSERT INTO FlightLegInstance (Seq, FLNO, FDate)
    Values 
        (1,'1000','2002-10-07'),
        (1,'1040','2002-10-07');