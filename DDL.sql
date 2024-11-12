CREATE DATABASE School;

USE School;

CREATE TABLE Student
(
Roll_no INT auto_increment Primary Key ,
Sname varchar(50),
Marks INT,
Grade char(1) check(Grade in ('A','B','C'))
);
USE School;
DESC CLASSTEN;
SELECT Roll_no,Sname,Marks,Grade FROM Student;
SELECT * FROM Student;
INSERT INTO Student VALUES
(1,'Raj',40,'A'),
(2,'jinu',40,'A'),
(3,'minu',30,'B'),
(4,'sona',20,'C');

ALTER TABLE Student ADD Contact varchar(15);
ALTER TABLE Student DROP COLUMN Grade; 
DESC CLASSTEN;


RENAME TABLE Student TO CLASSTEN;
TRUNCATE  TABLE CLASSTEN;
DESC CLASSTEN;
DROP DATABASE School;









