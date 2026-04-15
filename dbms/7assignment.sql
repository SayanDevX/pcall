1. Largest of Two

DECLARE
    NUM1 NUMBER;
    NUM2 NUMBER;
BEGIN
    NUM1:=:ENTER_FIRST_NUMBER;
    NUM2:=:ENTER_SECOND_NUMBER;
    IF (NUM1>NUM2)
    THEN
        DBMS_OUTPUT.PUT_LINE(NUM1|| ' is the largest number.');
    ELSIF (NUM2>NUM1)
    THEN
        DBMS_OUTPUT.PUT_LINE(NUM2||' is the largest number.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Both Numbers Are Equal');
    END IF;
END;



2. Even or Odd

DECLARE
    NUM NUMBER;
BEGIN
    NUM:=:ENTER_NUMBER;
    IF MOD(NUM,2)=0
    THEN
        DBMS_OUTPUT.PUT_LINE(NUM || ' is even.');
    ELSE
        DBMS_OUTPUT.PUT_LINE(NUM || ' is odd.');
    END IF;
END;



3. Factorial

DECLARE
    NUM NUMBER;
    FACT NUMBER;
    BACK NUMBER;
BEGIN 
    FACT:=1;
    NUM:=:ENTER_NUMBER;
    BACK:=NUM;
    WHILE NUM != 0
    LOOP
        FACT:=FACT*NUM;
        NUM:=NUM-1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Factorial of ' || BACK || ' is ' || FACT);
END;



4. Leap Year

DECLARE 
    YEAR NUMBER;
BEGIN
    YEAR:=:ENTER_YEAR;
    IF (MOD(YEAR, 4) = 0 AND MOD(YEAR, 100) != 0) OR (MOD(YEAR, 400) = 0)
    THEN
        DBMS_OUTPUT.PUT_LINE(YEAR || ' is leapyear.');
    ELSE
        DBMS_OUTPUT.PUT_LINE(YEAR || ' is not leapyear.');
    END IF;
END;



5. Reverse of String

DECLARE
    STR VARCHAR2(30);
    REV VARCHAR2(30);
    LEN NUMBER;
BEGIN
    STR :=: ENTER_STRING;
    LEN := LENGTH(STR);
    WHILE LEN != 0
    LOOP
        REV := REV || SUBSTR(STR, LEN, 1);
        LEN := LEN-1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Original String is: ' || STR);
    DBMS_OUTPUT.PUT_LINE('Reversed String is: ' || REV);
END;



6. Area and Radius

CREATE TABLE CIRCLE(
    RADIUS NUMBER(3),
    AREA NUMBER(10,3)
);
select * from CIRCLE;
While Loop ->

DECLARE
    RADIUS NUMBER(3);
    AREA NUMBER(10, 3);
BEGIN
    RADIUS := 1;
    WHILE RADIUS <= 10
    LOOP
        AREA := 3.141 * RADIUS * RADIUS;
        INSERT INTO CIRCLE VALUES(RADIUS, AREA);
        RADIUS := RADIUS + 1;
    END LOOP;
END;


FOR LOOP ->
 
DECLARE
    AREA NUMBER(10, 3);
BEGIN  
    FOR I IN 1..10
    LOOP   
        AREA := 3.141 * I * I;
        INSERT INTO CIRCLE VALUES(I, AREA);
    END LOOP;
END;



7. Books-Copy

CREATE TABLE BOOKS_COPY_219 (
    Book_No NUMBER(6) PRIMARY KEY,
	Book_Name VARCHAR2(30) NOT NULL,
	Author_Name VARCHAR2(30),
	Cost NUMBER(7,2),
	Category CHAR(10) CHECK(Category IN('Science', 'Database', 'System', 'Others'))
);
INSERT INTO BOOKS_COPY_219 VALUES(101, 'Let Us C', 'Denis Ritchie', 450, 'Others');
INSERT INTO BOOKS_COPY_219 VALUES(102, 'Oracle-Complete Ref', 'Loni', 550, 'Database');
INSERT INTO BOOKS_COPY_219 VALUES(103, 'Visual Basic 10', 'BPB', 700, 'Others');
INSERT INTO BOOKS_COPY_219 VALUES(104, 'Mastering SQL', 'Loni', 450, 'Database');
INSERT INTO BOOKS_COPY_219 VALUES(105, 'PL SQL-Ref', 'Scott Urman', 750, 'Database');
INSERT INTO BOOKS_COPY_219 VALUES(106, 'UNIX', 'Sumitava Das', 300, 'System');
INSERT INTO BOOKS_COPY_219 VALUES(107, 'Optics', 'Ghatak', 600, 'Science');
INSERT INTO BOOKS_COPY_219 VALUES(108, 'Data Structure', 'G.S. Baluja', 350, 'Others');

SELECT * FROM BOOKS_COPY_219;



DECLARE 
    B_NO NUMBER(6);
    PREV_COST NUMBER(7,2);
    NEW_COST NUMBER(7, 2);
    CHANGED_COST NUMBER(7, 2);
BEGIN
    B_NO:=:ENTER_BOOK_NO;
    NEW_COST:=:ENTER_NEW_COST;
    SELECT COST INTO PREV_COST FROM BOOKS_COPY_219 WHERE Book_No = B_NO;
    DBMS_OUTPUT.PUT_LINE('Prev Cost is: ' || PREV_COST || ' rupees.');
    IF PREV_COST < 450 AND NEW_COST < 900
    THEN
        UPDATE BOOKS_COPY_219 SET Cost = NEW_COST WHERE Book_No = B_NO;
        SELECT COST INTO CHANGED_COST FROM BOOKS_COPY_219 WHERE Book_No = B_NO;
        DBMS_OUTPUT.PUT_LINE('New Cost is: ' || CHANGED_COST || ' rupees.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Recheck The Cost Value.');
    END IF;
END;




8. Member Details

DECLARE
    ID NUMBER;
    ROW Member_219%ROWTYPE;
BEGIN
    ID:=:ENTER_ID;
    SELECT * INTO ROW FROM Member_219 WHERE Member_Id = ID;
    DBMS_OUTPUT.PUT_LINE('Name: ' || ROW.Member_Name || chr(10) || 'Address: ' || ROW.Member_Address || chr(10) || 'Fees Paid: ' || ROW.Fees_Paid || ' rupees.');
END;




9. String Display

DECLARE
    STR VARCHAR2(30);
    LENSTR NUMBER;
    REP VARCHAR2(30);
    LENREP NUMBER;
    SPACES NUMBER;
BEGIN
    STR :=: ENTER_STRING;
    LENSTR := LENGTH(STR);
    REP := REPLACE(STR, ' ', '');
    LENREP := LENGTH(REP);
    SPACES := LENSTR - LENREP;
    DBMS_OUTPUT.PUT_LINE(REP);
    DBMS_OUTPUT.PUT_LINE('Number of Spaces: ' || SPACES);
END;




10. Separate Lined String

DECLARE 
    STR VARCHAR(30);
    LENSTR NUMBER;
BEGIN
    STR :=: ENTER_STR;
    LENSTR := LENGTH(STR);
    WHILE LENSTR != 0
    LOOP
        DBMS_OUTPUT.PUT_LINE(SUBSTR(STR, -LENSTR, 1));
        LENSTR := LENSTR - 1;
    END LOOP;
END;




11. Upper Case, Lower Case


DECLARE 
    ID NUMBER(4);
    NAME VARCHAR2(30);
BEGIN  
    ID :=: ENTER_MEMBER_ID;
    SELECT Member_Name INTO NAME FROM Member_219 WHERE Member_Id = ID;
    DBMS_OUTPUT.PUT_LINE(UPPER(NAME));
    DBMS_OUTPUT.PUT_LINE(LOWER(NAME));
END;