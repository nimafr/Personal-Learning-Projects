-- Class: CSE 3330
-- Semester: Spring 2018
-- Student Name: Rahimzadeh, Nima, nfr8557
-- Student ID: 1000988557
-- Assignment: Project #1


CREATE TABLE PlaneType
(
    Maker varchar(50) NOT NULL,
    Model varchar(50) NOT NULL,
    FlyingSpeed INT NOT NULL,
    GroundSpeed INT NOT NULL,

    PRIMARY KEY(Maker, Model)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;





CREATE TABLE Airport
(
    Code char(3) NOT NULL,
    City varchar(50)  NOT NULL,
    State char(2) NOT NULL,

    PRIMARY KEY (Code)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;





CREATE TABLE Passenger
(
    ID INT NOT NULL AUTO_INCREMENT,
    Name varchar(50) NOT NULL,
    Phone char(13) NOT NULL,

    PRIMARY KEY (ID)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE Pilot
(
    ID INT NOT NULL AUTO_INCREMENT,
    Name varchar(50) NOT NULL,
    DateHired DATE NOT NULL,

    PRIMARY KEY (ID) 
)ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE Flight
(
    FLNO char(4) NOT NULL,
    Meal varchar(20) NOT NULL,
    Smoking char(1) NOT NULL,

    PRIMARY KEY (FLNO)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE PlaneSeats
(
    Maker varchar(50) NOT NULL,
    Model varchar(50) NOT NULL,
    SeatType char(1) NOT NULL,
    NoOfSeats INT,

    PRIMARY KEY (Maker, Model, SeatType),

    CONSTRAINT fk_Seats_PlaneType_MakerModel
        FOREIGN KEY (Maker, Model) REFERENCES PlaneType (Maker, Model)
        ON DELETE CASCADE
        ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE Plane
(
    ID INT NOT NULL AUTO_INCREMENT,
    Maker varchar(50) NOT NULL,
    Model varchar(50) NOT NULL,
    LastMaint DATE,
    LastMaintA char(3),

    PRIMARY KEY(ID),

    CONSTRAINT fk_Plane_PlaneType_MakerModel 
        FOREIGN KEY (Maker, Model) REFERENCES PlaneType (Maker, Model)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_Plane_Airport_Code 
        FOREIGN KEY (LastMaintA) REFERENCES Airport (Code)
        ON DELETE CASCADE
        ON UPDATE CASCADE

)ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE FlightInstance
(
    FLNO char(4) NOT NULL,
    FDate DATE NOT NULL,

    PRIMARY KEY (FLNO, FDate),

    CONSTRAINT fk_FlightInstance_Flight_FLNO
        FOREIGN KEY (FLNO) REFERENCES Flight(FLNO)
        ON DELETE CASCADE
        ON UPDATE CASCADE

)ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE Reservation
(
    PassID INT NOT NULL,
    FLNO char(4) NOT NULL,
    FDate DATE NOT NULL,
    FromA char(3) NOT NULL,
    ToA char(3) NOT NULL,
    SeatClass char(1) NOT NULL,
    DateBooked DATE NOT NULL,
    DateCancelled DATE DEFAULT NULL,

    PRIMARY KEY (PassID, FLNO, FDate),

    CONSTRAINT fk_Reservation_FlightInstance_FLNOFDate
        FOREIGN KEY (FLNO, FDate) REFERENCES FlightInstance(FLNO, FDate)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_Reservation_Airport_FromA
        FOREIGN KEY (FromA) REFERENCES Airport(Code)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_Reservation_Airport_ToA
        FOREIGN KEY (ToA) REFERENCES Airport(Code)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_Reservation_Passenger_PassID
        FOREIGN KEY (PassID) REFERENCES Passenger(ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE

)ENGINE=InnoDB DEFAULT CHARSET=latin1;





CREATE TABLE FlightLeg
(
    FLNO char(4) NOT NULL,
    Seq INT NOT NULL,
    FromA char(3) NOT NULL,
    ToA char(3) NOT NULL,
    DeptTime DATETIME NOT NULL,
    ArrTime DATETIME NOT NULL,
    Plane INT NOT NULL,

    PRIMARY KEY (FLNO, Seq),

    CONSTRAINT fk_FlightLeg_Airport_FromA
        FOREIGN KEY (FromA) REFERENCES Airport (Code)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_FlightLeg_Airport_ToA
        FOREIGN KEY (ToA) REFERENCES Airport (Code)
        ON DELETE CASCADE
        ON UPDATE CASCADE, 

    CONSTRAINT fk_FlightLeg_Flight_FLNO
        FOREIGN KEY (FLNO) REFERENCES Flight (FLNO)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_FlightLeg_Plane_Plane
        FOREIGN KEY (Plane) REFERENCES Plane (ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE   

)ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE FlightLegInstance
(
    Seq INT NOT NULL,
    FLNO char(4) NOT NULL,
    FDate DATE NOT NULL,
    ActDept DATETIME DEFAULT NULL,
    ActArr DATETIME DEFAULT NULL,
    Pilot INT DEFAULT NULL,

    PRIMARY KEY (Seq, FLNO, FDate),

    CONSTRAINT fk_FlightLegInstance_FlightLeg_SeqFLNO
        FOREIGN KEY (FLNO, Seq) REFERENCES FlightLeg (FLNO, Seq)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    
    CONSTRAINT fk_FlightLegInstance_FlightInstance_FLNOFdate
        FOREIGN KEY (FLNO, FDate) REFERENCES FlightInstance (FLNO, FDate)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_FlightLegInstance_Pilot_Pilot
        FOREIGN KEY (Pilot) REFERENCES Pilot(ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE

)ENGINE=InnoDB DEFAULT CHARSET=latin1;