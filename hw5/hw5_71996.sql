SET SCHEMA FN71996;

--CREATING THE TABLES

CREATE TABLE PARENT(
    NAME VARCHAR(50) NOT NULL PRIMARY KEY,
    EMAIL VARCHAR(50) NOT NULL,
    PNUMBER INT NOT NULL,
    ADDRESS VARCHAR(50)
);

CREATE TABLE STUDENT(
    ID INT NOT NULL PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL,
    GRADE INT NOT NULL,
    NOTES INT,
    ATTENDANCE CHAR(1),
    EMAIL VARCHAR(50) NOT NULL,
    PNUMBER INT
);

CREATE TABLE SCHOOL(
  NAME VARCHAR(50) NOT NULL PRIMARY KEY,
  EMAIL VARCHAR(50) NOT NULL,
  ADDRESS VARCHAR(50) NOT NULL,
  PNUMBER INT NOT NULL
);

CREATE TABLE TEACHER(
  NAME VARCHAR(50) NOT NULL PRIMARY KEY,
  EMAIL VARCHAR(50) NOT NULL,
  ADDRESS VARCHAR(50) NOT NULL,
  PNUMBER INT NOT NULL
);

CREATE TABLE SUBJECT(
    TNAME VARCHAR(50) NOT NULL PRIMARY KEY,
    SID INT NOT NULL,
    NOTES INT
);

-- ADDING THE FOREIGN KEYS NOW BECAUSE OF A MISTAKE IN THE FIRST PLACE
ALTER TABLE STUDENT
ADD COLUMN SNAME VARCHAR(50);

ALTER TABLE STUDENT
ADD COLUMN PNAME VARCHAR(50);

ALTER TABLE SCHOOL
ADD COLUMN PRNAME VARCHAR(50);

ALTER TABLE TEACHER
ADD COLUMN SNAME VARCHAR(50);

--ADDING THE FOREIGN KEYS
ALTER TABLE STUDENT
ADD CONSTRAINT FK_STUDENT_SCHOOL
FOREIGN KEY(SNAME) REFERENCES SCHOOL(NAME);

ALTER TABLE SCHOOL
ADD CONSTRAINT FK_SCHOOL_TEACHER
FOREIGN KEY(PRNAME) REFERENCES TEACHER(NAME);

ALTER TABLE TEACHER
ADD CONSTRAINT FK_TEACHER_SCHOOL
FOREIGN KEY(SNAME) REFERENCES SCHOOL(NAME);

ALTER TABLE STUDENT
ADD CONSTRAINT CK_STUDENT_ATTENDANCE CHECK(ATTENDANCE IN (0,1));

ALTER TABLE STUDENT
ADD CONSTRAINT FK_STUDENT_PARENT
FOREIGN KEY(PNAME) REFERENCES PARENT(NAME);

ALTER TABLE SUBJECT
ADD CONSTRAINT FK_SUBJECT_TEACHER
FOREIGN KEY(TNAME) REFERENCES TEACHER(NAME);

ALTER TABLE SUBJECT
ADD CONSTRAINT FK_SUBJECT_STUDENT
FOREIGN KEY(SID) REFERENCES STUDENT(ID);









