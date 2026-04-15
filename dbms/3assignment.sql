SELECT Book_Name, Cost FROM Books_219 WHERE Cost=(SELECT MAX(Cost) FROM Books_219);

SELECT MIN(Cost) AS "Minimum Cost", AVG(Cost) AS "Average Cost", SUM(Cost) AS "Total Cost" FROM Books_219;

SELECT Member_Id, Member_Name FROM Member_219 WHERE Member_Id IN (SELECT Member_Id FROM Issues_219 WHERE Issue_Date BETWEEN '26-JAN-11' AND '14-APR-11');

SELECT Book_Name, Author_Name, Category FROM Books_219 WHERE Category <> 'Others';

SELECT Book_Name ,Author_name FROM Books_219 WHERE Author_name LIKE '____t%';
SELECT Book_Name ,Author_name FROM Books_219 WHERE Author_name LIKE 'S%';
SELECT Book_Name ,Author_name FROM Books_219 WHERE Author_name LIKE 'S_%';
SELECT Book_Name ,Author_name FROM Books_219 WHERE Author_name LIKE '%a';
SELECT Book_Name ,Author_name FROM Books_219 WHERE Author_name LIKE '__a_a%';
SELECT Book_Name ,Author_name FROM Books_219 WHERE Author_name LIKE '%a_';
SELECT Book_Name ,Author_name FROM Books_219 WHERE Author_name LIKE 'D%e';

SELECT Member_Name FROM Member_219 WHERE Member_name LIKE 'S%';
SELECT Member_Name FROM Member_219 WHERE (Member_name LIKE 'S%' OR Member_Name LIKE 'A%' AND Member_Name LIKE '%t%');

SELECT Book_Name FROM Books_219 WHERE Book_Name LIKE '%SQL%';
SELECT COUNT(DISTINCT Author_Name) AS "DIFFERENT AUTHOR_NAME"FROM Books_219;

SELECT ABS(-167) FROM DUAL;
SELECT POWER(8,6) FROM DUAL;
SELECT ROUND(134.56789, 2) FROM DUAL;
SELECT SQRT(144) FROM DUAL;
SELECT CEIL(13.15), FLOOR(13.15) FROM DUAL;

SELECT EXTRACT(DAY FROM SYSDATE) AS "DAY", EXTRACT(MONTH FROM SYSDATE) AS "MONTH", EXTRACT(YEAR FROM SYSDATE) AS "YEAR" FROM DUAL;

SELECT GREATEST(4, 5, 17) FROM DUAL;
SELECT LEAST(4, 5, 17) FROM DUAL;

SELECT SUBSTR('INFOSYS', 3, 4) FROM DUAL;
SELECT ASCII('a'), ASCII('S') FROM DUAL;
SELECT LENGTH('INFOSYS'), REPLACE('INFOSYS', 'S', 'T') FROM DUAL;

SELECT Member_Name, Member_Address FROM Member_219 WHERE Member_Address = 'Kolkata';

SELECT Book_Name FROM Books_219 WHERE COST BETWEEN 300 AND 500;

SELECT Member_Name FROM Member_219 WHERE Membership_Type = 'Half-Yearly';

SELECT Member_Name FROM Member_219 WHERE EXTRACT(YEAR FROM Acc_Open_Date) = 2011;

SELECT Member_NAME, Penalty_Amount FROM Member_219 WHERE Member_Id IN (SELECT Member_Id FROM Issues_219 WHERE Book_No IN (SELECT Book_No FROM Books_219 WHERE Book_Name = 'Let Us C'));

SELECT Member_Name, Max_Books_Allowed FROM Member_219 WHERE Member_Id IN (SELECT Member_Id FROM Issues_219 Where Extract(Month FROM Issue_Date) = 1);

SELECT Member_Name FROM Member_219 WHERE Member_Id NOT IN (SELECT Member_Id FROM Issues_219);

SELECT Book_Name, Category FROM Books_219 WHERE Cost IS NULL;

SELECT Book_Name, Author_Name, Cost FROM Books_219 WHERE Author_Name = 'Loni' AND Cost < 600;

SELECT Lib_Issue_Id, Book_No, Member_Id, Issue_Date FROM Issues_219 WHERE Return_Date IS NULL;

SELECT Book_Name FROM Books_219 WHERE Category = 'Science' OR Category = 'Database';

SELECT Member_Name, Penalty_Amount FROM Member_219 WHERE Penalty_Amount != 0 ORDER BY Penalty_Amount DESC;

SELECT * FROM Books_219 ORDER BY Category, Cost DESC;

SELECT INITCAP(Book_Name), UPPER(Author_Name) FROM Books_219 ORDER BY Book_Name DESC;

SELECT Category, CASE WHEN Category = 'Database' THEN 'D' WHEN Category = 'Science' THEN 'S' WHEN Category = 'RDBMS' THEN 'R' ELSE 'O' END AS "Category" FROM Books_219;

SELECT Member_Name FROM Member_219 WHERE EXTRACT(YEAR FROM Acc_Open_Date) = 2011;