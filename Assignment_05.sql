DROP TABLE IF EXISTS Registration_t;
DROP TABLE IF EXISTS Viewing_t;
DROP TABLE IF EXISTS PrivateOwner_t;
DROP TABLE IF EXISTS Client_t;



CREATE TABLE Client_t
        	(Client_No      VARCHAR   NOT NULL,
	      	F_Name          VARCHAR,
            I_Name          VARCHAR,
			Tel_No			INT,
			Pref_Type		VARCHAR,
			Max_Rent		INT,
CONSTRAINT Client_PK PRIMARY KEY (Client_No));

CREATE TABLE PrivateOwner_t
            (Owner_No		VARCHAR NOT NULL,
			F_Name			VARCHAR,
			I_Name			VARCHAR,
			Address			VARCHAR,
			Tel_No			INT,
CONSTRAINT PrivateOwner_PK PRIMARY KEY (Owner_No));

CREATE TABLE Viewing_t
	      	(Client_No		VARCHAR NOT NULL,
			Property_No		VARCHAR,
			View_Date		VARCHAR,
			Comment			TEXT,
CONSTRAINT Viewing_PK PRIMARY KEY (Client_No),
CONSTRAINT Viewing_FK1 FOREIGN KEY (Property_No) REFERENCES PropertyForRent_t(Property_No));

CREATE TABLE Registration_t
        	(Client_No		VARCHAR NOT NULL,
			Branch_No		VARCHAR,
			Staff_No		VARCHAR,
			Date_Joined		VARCHAR,
CONSTRAINT Order_PK PRIMARY KEY (Client_No),
CONSTRAINT Registration_FK1 FOREIGN KEY (Client_No) REFERENCES Client_t(Client_No),
CONSTRAINT Registration_FK2 FOREIGN KEY (Branch_No) REFERENCES Branch_t(Branch_No),
CONSTRAINT Registration_FK3 FOREIGN KEY (Staff_No) REFERENCES Staff_t(Staff_No));



INSERT INTO Client_t
VALUES ('CR76', 'John', 'Kay', 02077745632, 'Flat', 425);
INSERT INTO Client_t
VALUES ('CR56', 'Aline', 'Stewart', 01418481825, 'Flat', 350);
INSERT INTO Client_t
VALUES ('CR74', 'Mike', 'Ritchie', 01475392178, 'House', 750);
INSERT INTO Client_t
VALUES ('CR62', 'Mary', 'Tregear', 01224196720, 'Flat', 600);

INSERT INTO PrivateOwner_t
VALUES ('CO46', 'Joe', 'Keogh', '2 Fergus DR, Aberdeen AB2 7SX', 01224861212);
INSERT INTO PrivateOwner_t
VALUES ('CO87', 'Carol', 'Farrel', '6 Achray St, Glasglow G32 9DX', 01413577419);
INSERT INTO PrivateOwner_t
VALUES ('CO40', 'Tina', 'Murphy', '63 Well St, Glasglow G42', 01419431728);
INSERT INTO PrivateOwner_t
VALUES ('CO93', 'Tony', 'Shaw', '12 Park Pl, Glasglow G4 0QR', 01412257025);

INSERT INTO Viewing_t
VALUES ('CR56', 'PA14', '24-May-04', 'too small');
INSERT INTO Viewing_t
VALUES ('CR76', 'PG4', '20-Apr-04', 'too remote');
INSERT INTO Viewing_t
VALUES ('CR56', 'PG4', '26-May-04', '');
INSERT INTO Viewing_t
VALUES ('CR62', 'PA14', '14-May-04', 'no dining room');
INSERT INTO Viewing_t
VALUES ('CR56', 'PG36', '28-Apr-04', '');

INSERT INTO Registration_t
VALUES ('CR76', 'B005', 'SL41', '2-Jan-04');
INSERT INTO Registration_t
VALUES ('CR56', 'B003', 'SG37', '11-Apr-03');
INSERT INTO Registration_t
VALUES ('CR74', 'B003', 'SG37', '16-Nov-02');
INSERT INTO Registration_t
VALUES ('CR62', 'B007', 'SA9', '7-Mar-03');
