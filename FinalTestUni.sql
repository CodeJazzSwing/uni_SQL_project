CREATE DATABASE FinalTestUni;

USE FinalTestUni;

--COLLEGE table
/*
CREATE TABLE college (
	college_id INT IDENTITY(100,1) PRIMARY KEY,
	college_name VARCHAR (50) DEFAULT NULL
);
*/

/*
INSERT INTO college VALUES('College of Business');
INSERT INTO college VALUES('College of Science');
INSERT INTO college VALUES('College of Philosophy');
INSERT INTO college VALUES('College of Engineering');
INSERT INTO college VALUES('College of Communication');
*/

--ADVISOR TABLE
/*
CREATE TABLE advisor (		
	advisor_id INT IDENTITY (300,1) PRIMARY KEY,
	advisor_first_name VARCHAR (50)  NOT NULL,
	advisor_last_name VARCHAR (100)  NOT NULL,
	advisor_email VARCHAR (100)  DEFAULT NULL,
	advisor_major VARCHAR (50) NOT NULL,
);

INSERT INTO advisor VALUES('Eric', 'Cartman', 'eric@aol.com', 'Business');
INSERT INTO advisor VALUES('Stan', 'Marsh', 'stan@aol.com', 'Science');
INSERT INTO advisor VALUES('Kyle', 'Barb', 'kyle@aol.com', 'Philosophy');
INSERT INTO advisor VALUES('Daffy', 'Duck', 'daffy@aol.com', 'Engineering');
INSERT INTO advisor VALUES('Forhorn', 'Leghorn', 'fog@aol.com', 'Communication');
INSERT INTO advisor VALUES('Bart', 'Simpson', 'bart@aol.com', 'Business', 60000);
*/

--Added ALTER TABLE column for advisor salary
/*
ALTER TABLE advisor
ADD monthy_salary_EUR INT;
*/

--UPDATED advsor columns and set salary.
/*
UPDATE advisor
SET monthy_salary_EUR = 20000
WHERE advisor_id = 300;

UPDATE advisor
SET monthy_salary_EUR = 40000
WHERE advisor_id = 301;

UPDATE advisor
SET monthy_salary_EUR = 40000
WHERE advisor_id = 302;

UPDATE advisor
SET monthy_salary_EUR = 50000
WHERE advisor_id = 303;

UPDATE advisor
SET monthy_salary_EUR = 50000
WHERE advisor_id = 304;
*/

--DORM TABLE AND DATA
/*
CREATE TABLE dorm (		
	dorm_id INT IDENTITY (400,1) PRIMARY KEY,
	dorm_name VARCHAR (50)  NOT NULL,
	phone INT  NOT NULL,
	elevator VARCHAR (5)  NOT NULL,
	parking VARCHAR (5) NOT NULL
);


INSERT INTO dorm VALUES('Radiohead', 5551212, 'Yes', 'No');
INSERT INTO dorm VALUES('Count Basie', 5551313, 'No', 'Yes');
INSERT INTO dorm VALUES('John Coltrane', 5551414, 'Yes', 'No');
INSERT INTO dorm VALUES('Jimi Hendrix', 5551515, 'No', 'Yes');
INSERT INTO dorm VALUES('Ella Fitzgerald', 5551616, 'Yes', 'No');
*/

--LAST TO PUBLISH since I needed to add the values of the DORM and ADVISOR in this table

/*
CREATE TABLE student (		
	student_id INT IDENTITY (200, 1) PRIMARY KEY,
	first_name VARCHAR (50)  NOT NULL,
	last_name VARCHAR (100)  NOT NULL,
	email VARCHAR (100)  DEFAULT NULL,
	us_state VARCHAR (50) NOT NULL,
	birthdate DATE NOT NULL,
	major VARCHAR (50)NOT NULL,
	college_id INT NULL,
	advisor_id INT NULL,
	dorm_id INT NULL,
	FOREIGN KEY (college_id) REFERENCES college (college_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (advisor_id) REFERENCES advisor (advisor_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (dorm_id) REFERENCES dorm (dorm_id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO student VALUES('Roger', 'Rabbit', 'rabbit@aol.com', 'CA', '1998-11-12', 'Business', 100, 300, 400);
INSERT INTO student VALUES('Bugs', 'Bunny', 'bugs@aol.com', 'AZ', '1997-04-01', 'Science', 101, 301, 401);
INSERT INTO student VALUES('Donald', 'Duck', 'donald@aol.com', 'OR', '1995-05-12', 'Philosophy', 102, 302, 402);
INSERT INTO student VALUES('Mighty', 'Mouse', 'mighty@aol.com', 'WA', '1995-03-23', 'Engineering', 103, 303, 403);
INSERT INTO student VALUES('Minnie', 'Mus', 'minne@aol.com', 'NV', '1993-12-02', 'Communication', 104, 304, 404);
INSERT INTO student VALUES('Wendy', 'Testy', 'winnie@aol.com', 'CA', '1992-03-22', 'Philosophy', 102, 302, 404);
INSERT INTO student VALUES('Daisy', 'Quack', 'daisy@aol.com', 'AZ', '1993-09-02', 'Communication', 104, 304, 403);
INSERT INTO student VALUES('Wild', 'Coyote', 'wild@aol.com', 'WA', '1991-08-26', 'Engineering', 103, 303, 402);
INSERT INTO student VALUES('Betty', 'Boop', 'betty@aol.com', 'OR', '1981-02-28', 'Science', 101, 301, 401);
INSERT INTO student VALUES('Road', 'Runner', 'road@aol.com', 'NV', '1988-04-01', 'Business', 100, 300, 400);
*/


--Table created to show that many students can have many advisor and advisors can have many students).
 /*
 CREATE TABLE all_advisors_students (		
	advisors_students_id INT IDENTITY (1,1) PRIMARY KEY,
	student_id INT NOT NULL,
	advisor_id INT NOT NULL,
	college_id INT NOT NULL
	FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE NO ACTION,
	FOREIGN KEY (advisor_id) REFERENCES advisor (advisor_id) ON DELETE NO ACTION,
	FOREIGN KEY (college_id) REFERENCES college (college_id) ON DELETE NO ACTION
);


INSERT INTO all_advisors_students VALUES(200, 300, 100);
INSERT INTO all_advisors_students VALUES(200, 305, 100);
INSERT INTO all_advisors_students VALUES(201, 301, 101);
INSERT INTO all_advisors_students VALUES(202, 302, 102);
INSERT INTO all_advisors_students VALUES(203, 303, 103);
INSERT INTO all_advisors_students VALUES(204, 304, 104);
INSERT INTO all_advisors_students VALUES(205, 302, 102);
INSERT INTO all_advisors_students VALUES(206, 304, 104);
INSERT INTO all_advisors_students VALUES(207, 303, 103);
INSERT INTO all_advisors_students VALUES(208, 301, 101);
INSERT INTO all_advisors_students VALUES(209, 300, 100);
INSERT INTO all_advisors_students VALUES(209, 305, 100);
*/

--Created another table to show MANY TO MANY relationship with students who live in dorms and their needs. In the future can add columns to show other special needs of students, like eating preferences, roommates, etc...
 /*
 CREATE TABLE livingneeds (		
	livingneeds_id INT IDENTITY (1,1) PRIMARY KEY,
	student_id INT NULL,
	dorm_id INT NULL,
	needs_elevator VARCHAR (5)  DEFAULT NULL,
	needs_parking VARCHAR (5) DEFAULT NULL,
	other_comments VARCHAR (100) DEFAULT NULL,
	FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE NO ACTION,
	FOREIGN KEY (dorm_id) REFERENCES dorm (dorm_id) ON DELETE NO ACTION
);

INSERT INTO livingneeds VALUES(200, 400, 'yes', 'no', 'wheelchair');
INSERT INTO livingneeds VALUES(201, 401, 'no', 'yes', '');
INSERT INTO livingneeds VALUES(202, 402, 'yes', 'no', 'crutches');
INSERT INTO livingneeds VALUES(205, 404, 'yes', 'no', 'other HDCP');
INSERT INTO livingneeds VALUES(204, 403, 'no', 'yes', '');
*/

------------QUERIES!

--GROUP BY example to count the number of US states from where students comes from
SELECT COUNT (us_state), us_state
FROM student
GROUP BY us_state
ORDER BY (us_state) ASC;


--GROUP BY to know the dorms that have an elevator, in Alpha order.

SELECT COUNT (elevator), dorm_name
FROM dorm
WHERE elevator='Yes'
GROUP BY dorm_name
ORDER BY (dorm_name) ASC;


--Example of getting all students and info who study science.
SELECT * FROM student WHERE major = 'Science';

--Example of JOIN...Students with their advisors.
SELECT student.student_id, student.first_name, student.last_name, advisor.advisor_id, advisor.advisor_first_name, advisor.advisor_last_name, advisor.advisor_major
FROM student
LEFT JOIN advisor
ON student.advisor_id = advisor.advisor_id;

--Example of queries to get all info in tables.   
SELECT * FROM advisor;
SELECT * FROM all_advisors_students;
SELECT * FROM student;
SELECT * FROM dorm;


--NESTED QUERY of students who need an elevator.
--Created a separate LIVINGNEEDS table to keep info confidential. This makes the info confidential for GDPR purposes.
SELECT student.first_name, student.last_name
FROM student 
WHERE student.student_id IN (
	SELECT student_id
	FROM livingneeds
	WHERE needs_elevator='yes'
);

--DELETE FUNCTION...To delete Wild Coyote since he will transfer.
DELETE FROM student WHERE student_id = '207'

--Example of UPDATE....
UPDATE dorm SET dorm_name = 'Pelé' WHERE dorm_name = 'Jimi Hendrix'

--Example of ORDER BY to see the list of which US states students come from, in ascending order.
SELECT * FROM student
ORDER BY us_state ASC; 

-- EXAMPLE of VARIABLE
--Switch the year '1993' to another year to get students who were born on or after the year changed in the date. 
--T.ex. 1993 gives you 6 students.
--1991 gives you 8 students.
--1995 gives you 4 students.
--1997 gives you 2 students.

DECLARE @yearofbirth DATE

SET @yearofbirth = '1993-01-01'

SELECT first_name AS [First Name], last_name AS [Last Name], major [Major]
FROM dbo.student
WHERE birthdate >= @yearofbirth 


--2 MATH FUNCTIONS. Get the avergae and the min salaries.

SELECT AVG(monthy_salary_EUR)
FROM advisor;

SELECT MIN(monthy_salary_EUR)
FROM advisor;


--Example of getting RANGE. Which advisor makes over 40K.

SELECT advisor_first_name, advisor_last_name, monthy_salary_EUR
FROM advisor
WHERE monthy_salary_EUR > 40000
