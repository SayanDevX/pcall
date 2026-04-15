CREATE TABLE Student_219(
Roll number(5),
Name varchar2(30),
Age number(5),
Course varchar2(5),
Math number(6,2),
Physics number(6,2),
Computer number(6,2),
Birthday date
);

INSERT INTO Student_219 VALUES('1', 'Rahul', '19', 'BCA', '79.5', '67', '89', '15-jun-93');
INSERT INTO Student_219 VALUES('2', 'Kunal', '21', 'BCA', '68', '76', '59.5', '16-aug-91');
INSERT INTO Student_219 VALUES('3', 'Aditi', '20', 'MSc', '90', '73', '56', '20-sep-92');
INSERT INTO Student_219 VALUES('4', 'Sumit', '20', 'MCA', '57.5', '78', '81', '07-dec-91');
INSERT INTO Student_219 VALUES('5', 'Anirban', '22', 'MCA', '80', '68', '63', '15-sep-94');
INSERT INTO Student_219 VALUES('6', 'Kumkum', '21', 'BCA', '72', '54.5', '80', '08-feb-95');
INSERT INTO Student_219 VALUES('7', 'Suman', '21', 'BCA', '91.5', '31', '61', '10-mar-94');
INSERT INTO Student_219 VALUES('8', 'Rohit', '22', 'MSc', '85', '76', '92', '19-apr-92');

SELECT * from Student_219;

SELECT * FROM Student_219 WHERE Roll = 5;

SELECT Roll, Name, Math, Physics, Computer FROM Student_219;

CREATE TABLE MSc_219 AS SELECT * FROM Student_219 WHERE 1=2;

CREATE TABLE MCA_219 AS SELECT Roll, Name AS First_Name, Age, Course AS Department, Math, Physics, Computer, Birthday FROM Student_219 WHERE 1=2;

DESC MSc_219;

DESC MCA_219;

INSERT INTO MCA_219 SELECT * FROM Student_219 WHERE Course='MCA';

SELECT * FROM MCA_219;

UPDATE Student_219 SET Math = 95 WHERE Roll = 7;

DELETE FROM Student_219 WHERE Roll = 2;