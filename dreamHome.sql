DROP TABLE IF EXISTS PROPERTY_t;
DROP TABLE IF EXISTS STAFF_t;
DROP TABLE IF EXISTS BRANCH_t;

CREATE TABLE BRANCH_t
(
				Branch_Id		VARCHAR(4)	NOT NULL,
        Branch_Street	VARCHAR(30),
        Branch_City		CHAR(20),
        Postal_Code		VARCHAR(7),
        CONSTRAINT BRANCH_PK PRIMARY KEY (Branch_Id)
        );

CREATE TABLE STAFF_t
	(
					 Staff_Id		VARCHAR(6),
				   first_Name	VARCHAR(30),
		       last_Name		VARCHAR(20),
	         position		VARCHAR(9),
					 sex		CHAR(1),
					 DOB		DATE,
					 salary		INT(9),
					 Branch_Id VARCHAR(5),
	         CONSTRAINT STAFF_PK PRIMARY KEY (Staff_Id),
					 CONSTRAINT STAFF_FK1 FOREIGN KEY (Branch_Id) REFERENCES BRANCH_t(Branch_Id)
	        );

CREATE TABLE PROPERTY_t
		(
				Property_Id		VARCHAR(5)	NOT NULL,
				street_Name		VARCHAR(25),
				city_Name			CHAR(30),
				postal_Code		INT(6),
				house_Type		CHAR(9),
				room_Numbers  INT(2),
				owner_Number		VARCHAR(9),
				Staff_id		VARCHAR(9),
				Branch_Id VARCHAR(5),
				CONSTRAINT PROPERTY_PK PRIMARY KEY (Property_Id),
				CONSTRAINT PROPERTY_FK1 FOREIGN KEY (Branch_Id) REFERENCES BRANCH_t(Branch_Id),
				CONSTRAINT PROPERTY_FK2 FOREIGN KEY (Staff_Id) REFERENCES STAFF_t(Staff_Id)
			);


INSERT INTO BRANCH_T VALUES
('B005', '22 DEER RD', 'LONDON', 'SW1 4EH'),
('B007', '16 ARGYLL ST', 'ABERDEEN', 'AB2 3SU'),
('B003', '163 MAIN ST', 'GLASGOW', 'G11 9QX'),
('B004', '32 MANSE RD', 'BRISTOL', 'G11 9QX'),
('B002', '56 CLOVER DR', 'LONDON', 'NW10 6EU');

INSERT INTO STAFF_T VALUES
('SL21', 'JOHN', 'WHITE', 'MANAGER', 'M', '1-OCT-45' '30000', 'B005'),
('SG37', 'ANN', 'BEECH', 'ASSISTANT', 'F', '10-NOV-60' '12000', 'B003'),
('SG14', 'DAVID', 'FORD', 'SUPERVISOR', 'M', '24-MAR-58' '18000', 'B003'),
('SA9', 'MARY', 'HOWE', 'ASSISTANT', 'F', '19-FEB-70' '9000', 'B007'),
('SG5', 'SUSAN', 'BRAND', 'MANAGER', 'F', '3-JUN-40' '24000', 'B003'),
('SL41', 'JULIE', 'LEE', 'ASSISTANT', 'F', '13-JUN-65' '9000', 'B005');

INSERT INTO PROPERTY_T VALUES
('PA14', '16 HOLHEAD', 'ABERDEEN', 'AB7 5SU', 'HOUSE', '6', '650', 'CO46', 'SA9', 'B007'),
('PL94', '6 ARGYLL ST', 'LONDON', 'NW2', 'FLAT', '4', '400', 'CO87', 'SL41', 'B005'),
('PG4', '6 LAWRENCE ST', 'GLASGOW', 'G11 9QX', 'FLAT', '3', '350', 'CO40', 'NULL', 'B003'),
('PG36', '2 MANOR RD', 'GLASGOW', 'G32 4QX', 'FLAT', '3', '375', 'CO93', 'SG37', 'B003'),
('PG21', '18 DALE RD', 'GLASGOW', 'G12', 'HOUSE', '5', '600', 'CO87', 'SG37', 'B003'),
('PG16', '5 NOVAR DR', 'GLASGOW', 'G12 9AX', 'FLAT', '4', '450', 'CO93', 'SG14', 'B003');
