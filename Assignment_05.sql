DROP TABLE IF EXISTS Registration;
DROP TABLE IF EXISTS Viewing;
DROP TABLE IF EXISTS Client;
DROP TABLE IF EXISTS PROPERTY;
DROP TABLE IF EXISTS PrivateOwner;
DROP TABLE IF EXISTS STAFF;
DROP TABLE IF EXISTS BRANCH;

CREATE TABLE BRANCH (
	 	Branch_Id		VARCHAR(30)	NOT NULL,
        Branch_Street	VARCHAR(30),
        Branch_City		VARCHAR(30),
        Postal_Code		VARCHAR(30),
CONSTRAINT BRANCH_PK PRIMARY KEY (Branch_Id));

CREATE TABLE STAFF (
		Staff_Id		VARCHAR(30),
		first_Name		VARCHAR(30),
		last_Name		VARCHAR(30),
		position		VARCHAR(30),
		sex				VARCHAR(30),
		DOB				DATE,
		salary			INT,
		Branch_Id 		VARCHAR(5),
CONSTRAINT STAFF_PK PRIMARY KEY (Staff_Id),
CONSTRAINT STAFF_FK FOREIGN KEY (Branch_Id) REFERENCES BRANCH(Branch_Id));

CREATE TABLE PrivateOwner (
	 	Owner_No		VARCHAR(30) NOT NULL,
		F_Name			VARCHAR(30),
		I_Name			VARCHAR(30),
		Address			VARCHAR(30),
		Tel_No			INT,
CONSTRAINT PrivateOwner_PK PRIMARY KEY (Owner_No));

CREATE TABLE PROPERTY (
		Property_Id		VARCHAR(30)	NOT NULL,
		street_Name		VARCHAR(30),
		city_Name		VARCHAR(30),
		postal_Code		INT,
		house_Type		VARCHAR(30),
		room_Numbers  	INT,
		Max_Rent       	INT,
		Owner_No		VARCHAR(30) NOT NULL,
		Staff_Id		VARCHAR(30),
		Branch_Id 		VARCHAR(30),
CONSTRAINT PROPERTY_PK PRIMARY KEY (Property_Id),
CONSTRAINT PROPERTY_Owner_FK FOREIGN KEY (Owner_No) REFERENCES PrivateOwner(Owner_No), -- if code does not work, comment this line out. 
CONSTRAINT PROPERTY_Staff_FK FOREIGN KEY (Staff_Id) REFERENCES STAFF(Staff_Id),
CONSTRAINT PROPERTY_Branch_FK FOREIGN KEY (Branch_Id) REFERENCES BRANCH(Branch_Id));


CREATE TABLE Client (
		Client_No      	VARCHAR(30)   NOT NULL,
		F_Name          VARCHAR(30),
		I_Name          VARCHAR(30),
		Tel_No			INT,
		Pref_Type		VARCHAR(30),
		Max_Rent		INT,
CONSTRAINT Client_PK PRIMARY KEY (Client_No));

CREATE TABLE Viewing (
		Client_No		VARCHAR(20) NOT NULL,
		Property_Id		VARCHAR(30),
		View_Date		DATE,
		Comment			TEXT,
CONSTRAINT Viewing_PK PRIMARY KEY (Client_No, Property_Id),
CONSTRAINT Viewing_Client_FK FOREIGN KEY (Client_No) REFERENCES Client(Client_No),
CONSTRAINT Viewing_Property_FK FOREIGN KEY (Property_Id) REFERENCES PROPERTY(Property_Id));

CREATE TABLE Registration (
        Client_No		VARCHAR(30) NOT NULL,
		Branch_Id		VARCHAR(30),
		Staff_Id		VARCHAR(30),
		Date_Joined		DATE,
CONSTRAINT Order_PK PRIMARY KEY (Client_No, Branch_Id, Staff_Id),
CONSTRAINT Registration_Client_FK FOREIGN KEY (Client_No) REFERENCES Client(Client_No),
CONSTRAINT Registration_Brach_FK FOREIGN KEY (Branch_Id) REFERENCES BRANCH(Branch_Id),
CONSTRAINT Registration_Staff_FK FOREIGN KEY (Staff_Id) REFERENCES STAFF(Staff_Id));

INSERT INTO BRANCH VALUES
('B005', '22 DEER RD', 'LONDON', 'SW1 4EH'),
('B007', '16 ARGYLL ST', 'ABERDEEN', 'AB2 3SU'),
('B003', '163 MAIN ST', 'GLASGOW', 'G11 9QX'),
('B004', '32 MANSE RD', 'BRISTOL', 'G11 9QX'),
('B002', '56 CLOVER DR', 'LONDON', 'NW10 6EU');

INSERT INTO STAFF VALUES
('SL21', 'JOHN', 'WHITE', 'MANAGER', 'M', '1-OCT-45', '30000', 'B005'),
('SG37', 'ANN', 'BEECH', 'ASSISTANT', 'F', '10-NOV-60', '12000', 'B003'),
('SG14', 'DAVID', 'FORD', 'SUPERVISOR', 'M', '24-MAR-58', '18000', 'B003'),
('SA9', 'MARY', 'HOWE', 'ASSISTANT', 'F', '19-FEB-70', '9000', 'B007'),
('SG5', 'SUSAN', 'BRAND', 'MANAGER', 'F', '3-JUN-40', '24000', 'B003'),
('SL41', 'JULIE', 'LEE', 'ASSISTANT', 'F', '13-JUN-65', '9000', 'B005');

INSERT INTO PROPERTY VALUES
('PA14', '16 Holhead',  'Aberdeen', 'AB7 5SU', 'House',6, 650, 'CO46', 'SA9', 'B007'),
('PL94', '6 Argyll St',  'London',  'NW2',     'Flat', 4, 400, 'CO87', 'SL41', 'B005'),
('PG4',  '6 Lawrence St','Glasgow', 'G11 9QX', 'Flat', 3, 350, 'CO40', NULL, 'B003'),
('PG36', '2 Manor Rd',   'Glasgow', 'G32 4QX', 'Flat', 3, 375, 'CO93', 'SG37', 'B003'),
('PG21', '18 Dale Rd',   'Glasgow', 'G12',     'House',5, 600, 'CO87', 'SG37', 'B003'),
('PG16', '5 Novar Dr',   'Glasgow', 'G12 9AX', 'Flat', 4, 450, 'CO93', 'SG14', 'B003');

INSERT INTO PrivateOwner VALUES
('CO46', 'Joe', 'Keogh', '2 Fergus DR, Aberdeen AB2 7SX', 01224861212),
('CO87', 'Carol', 'Farrel', '6 Achray St, Glasglow G32 9DX', 01413577419),
('CO40', 'Tina', 'Murphy', '63 Well St, Glasglow G42', 01419431728),
('CO93', 'Tony', 'Shaw', '12 Park Pl, Glasglow G4 0QR', 01412257025);

INSERT INTO Client VALUES
('CR76', 'John', 'Kay', 02077745632, 'Flat', 425),
('CR56', 'Aline', 'Stewart', 01418481825, 'Flat', 350),
('CR74', 'Mike', 'Ritchie', 01475392178, 'House', 750),
('CR62', 'Mary', 'Tregear', 01224196720, 'Flat', 600);

INSERT INTO Viewing VALUES
('CR56', 'PA14', '24-May-04', 'too small'),
('CR76', 'PG4', '20-Apr-04', 'too remote'),
('CR56', 'PG4', '26-May-04', NULL),
('CR62', 'PA14', '14-May-04', 'no dining room'),
('CR56', 'PG36', '28-Apr-04', NULL);

INSERT INTO Registration VALUES
('CR76', 'B005', 'SL41', '2-Jan-04'),
('CR56', 'B003', 'SG37', '11-Apr-03'),
('CR74', 'B003', 'SG37', '16-Nov-02'),
('CR62', 'B007', 'SA9', '7-Mar-03');
