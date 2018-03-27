-- Class: CSE 3330
-- Semester: Spring 2018
-- Student Name: Rahimzadeh, Nima, nfr8557
-- Student ID: 1000988557
-- Assignment: Project #2


SELECT
    ID,
    Model,
    LastMaint
FROM
    nfr8557.Plane
WHERE
    Maker = "Airbus"
;


SELECT DISTINCT
    Name
FROM
    nfr8557.Passenger,
    nfr8557.Reservation,
    nfr8557.Flight
WHERE
    Flight.Meal = 1 AND
    Reservation.FLNO = Flight.FLNO AND
    Passenger.ID = Reservation.PassID
;


SELECT DISTINCT
    Name
FROM
    nfr8557.Pilot,
    nfr8557.FlightLegInstance,
    nfr8557.FlightLeg,
    nfr8557.Airport
WHERE
    Airport.State = 'TX' AND
    FlightLeg.FromA = Airport.Code AND
    FlightLegInstance.FLNO = FlightLeg.FLNO AND
    Pilot.ID = FlightLegInstance.Pilot
;

SELECT
    count(*)
FROM
    nfr8557.Passenger,
    nfr8557.Reservation
WHERE
    Passenger.Name = 'Jones' AND
    Reservation.PassID = Passenger.ID
;


SELECT
    Plane.Maker,
    Plane.Model
FROM
    nfr8557.Plane,
    nfr8557.FlightLeg,
    nfr8557.Airport
WHERE
    Airport.State = 'CA' AND
    FlightLeg.ToA = Airport.Code AND
    FlightLeg.Plane = Plane.ID
;


SELECT DISTINCT
    Models.Maker,
    Planes.sum
    
FROM
    (SELECT
        Maker,
        sum(NoOfSeats) AS sum
    FROM
        nfr8557.PlaneSeats
    group by
        Maker, Model) AS Models,

    (SELECT
        Maker,
        count(Maker) AS sum
    FROM
        nfr8557.Plane
    group by
        Maker) AS Planes

    WHERE
        Models.sum > 350
;


SELECT DISTINCT
    FlightLeg.FLNO
FROM
    nfr8557.FlightLeg
WHERE
    FlightLeg.ToA = 'DFW' OR
    FlightLeg.FromA = 'DFW'
;


SELECT
    *
FROM   
    (SELECT 
        Maker,
        Model,
        sum(NoOfSeats) AS sum
    FROM
        nfr8557.PlaneSeats
    group by 
        Model) AS TotalSeats
    WHERE
        TotalSeats.sum > 300
;