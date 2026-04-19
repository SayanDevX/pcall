CREATE TABLE Member_219(
	Member_Id NUMBER(5),
	Member_Name VARCHAR2(30) NOT NULL,
	Member_Address VARCHAR2(50),
	Acc_Open_Date DATE,
	Membership_Type VARCHAR2(20),
	Fees_Paid NUMBER(4),
	Max_Books_Allowed NUMBER(2) CHECK(Max_Books_Allowed < 7),
	Penalty_Amount NUMBER(7, 2) CHECK(Penalty_Amount <= 1000)
);

DESC Member_219;
DESC Books_219;
DESC Issues_219;

ALTER TABLE Member_219 ADD PRIMARY KEY(Member_Id);
ALTER TABLE Member_219 ADD CHECK(Membership_Type IN('Lifetime', 'Annual', 'Half-Yearly', 'Quarterly'));

CREATE TABLE Books_219(
	Book_No NUMBER(6) PRIMARY KEY,
	Book_Name VARCHAR2(30) NOT NULL,
	Author_Name VARCHAR2(30),
	Cost NUMBER(7,2),
	Category CHAR(10)
);

ALTER TABLE Books_219 ADD CHECK(Category IN('Science', 'Database', 'System', 'Others'));

CREATE TABLE Issues_219(
	Lib_Issue_Id NUMBER(10) PRIMARY KEY,
	Book_No NUMBER(6),
	Member_Id NUMBER(5),
	Issue_Date DATE,
	Return_Date DATE
);

ALTER TABLE Issues_219 ADD FOREIGN KEY(Member_Id) REFERENCES Member_219(Member_Id);
ALTER TABLE Issues_219 ADD FOREIGN KEY(Book_No) REFERENCES Books_219(Book_No);

INSERT INTO Member_219 VALUES(1, 'Sayantan Sinha', 'Pune', '10-DEC-10', 'Lifetime', 2000, 6, 50);
INSERT INTO Member_219 VALUES(2, 'Abhirup Sarkar', 'Kolkata', '19-JAN-11', 'Annual', 1400, 3, 0);
INSERT INTO Member_219 VALUES(3, 'Ritesh Bhuniya', 'Gujarat', '20-FEB-11', 'Quarterly', 350, 2, 100);
INSERT INTO Member_219 VALUES(4, 'Paresh Sen', 'Tripura', '21-MAR-11', 'Half-Yearly', 700, 1, 200);
INSERT INTO Member_219 VALUES(5, 'Sohini Haldar', 'Birbhum', '11-APR-11', 'Lifetime', 2000, 6, 10);
INSERT INTO Member_219 VALUES(6, 'Suparna Biswas', 'Kolkata', '12-APR-11', 'Half-Yearly', 700, 1, 0);
INSERT INTO Member_219 VALUES(7, 'Suranjana Basu', 'Purulia', '30-JUNE-11', 'Annual', 1400, 3, 50);
INSERT INTO Member_219 VALUES(8, 'Arpita Roy', 'Kolkata', '31-JULY-11', 'Half-Yearly', 700, 1, 0);

SELECT * FROM Member_219;

3
SELECT * FROM Books_219;

INSERT INTO Issues_219 VALUES(7001, 101, 1, '10-JAN-11', '');
INSERT INTO Issues_219 VALUES(7002, 102, 2, '25-JAN-11', '');
INSERT INTO Issues_219 VALUES(7003, 103, 1, '01-FEB-11', '');
INSERT INTO Issues_219 VALUES(7004, 104, 2, '15-MAR-11', '');
INSERT INTO Issues_219 VALUES(7005, 101, 4, '04-APR-11', '');
INSERT INTO Issues_219 VALUES(7006, 108, 5, '12-APR-11', '');
INSERT INTO Issues_219 VALUES(7007, 101, 8, '01-AUG-11', '');

SELECT * FROM Issues_219;
