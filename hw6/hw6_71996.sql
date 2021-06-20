SET SCHEMA FN71996;

INSERT INTO FN71996.TEACHER
(NAME, EMAIL, ADDRESS, PNUMBER) VALUES
('Ivan Georgiev', 'georgiev@teacher.bg', 'Bulgaria, Razgrad, str. "Otec Paisii" 33',
 '0895737567');


INSERT INTO FN71996.TEACHER
(NAME, EMAIL, ADDRESS, PNUMBER) VALUES
('Georgi Ivanov', 'ivanov@teacher.bg', 'Bulgaria, Sofia, str. "Elin Pelin" 4',
 '089573657');


INSERT INTO FN71996.TEACHER
(NAME, EMAIL, ADDRESS, PNUMBER) VALUES
('Elena Petrova', 'petrova@teacher.bg', 'Bulgaria, Razgrad, str. "Sv. Kliment" 35',
 '0893487567');


INSERT INTO FN71996.TEACHER
(NAME, EMAIL, ADDRESS, PNUMBER) VALUES
('Petyo Kolev', 'kolev@teacher.bg', 'Bulgaria, Sofia, str. "Oborishte" 17',
 '0895737567');


INSERT INTO FN71996.TEACHER
(NAME, EMAIL, ADDRESS, PNUMBER) VALUES
('Gabriela Georgieva', 'georgieva@teacher.bg', 'Bulgaria, Razgrad, str. "Otec Paisii" 17',
 '0896346578');

INSERT INTO FN71996.SCHOOL
(NAME, EMAIL, ADDRESS, PNUMBER, PRNAME) VALUES
('OU Vapcarov', 'vapcarov.primary@school.bg',
 'Bulgaria, Razgrad, str. "Otec Paisii" 3', '0895737456', 'Ivan Georgiev');

INSERT INTO FN71996.SCHOOL
(NAME, EMAIL, ADDRESS, PNUMBER, PRNAME) VALUES
('NUTI', 'nuti@school.bg',
 'Bulgaria, Sofia, str. "Shipchenski prohod" 65', '0895700991', 'Gabriela Georgieva');

INSERT INTO FN71996.SCHOOL
(NAME, EMAIL, ADDRESS, PNUMBER, PRNAME) VALUES
('9.FEG "Alphonse de Lamartine"', 'feg@school.bg',
 'Bulgaria, Soifa, bul. "Patriarh Evtimii" 35', '0895727345', 'Petyo Kolev');

INSERT INTO FN71996.STUDENT
(ID, NAME, GRADE, NOTES, ATTENDANCE, EMAIL, PNUMBER, SNAME) VALUES
('120', 'Ivan Ivanov', '5', '6', '0', 'i.ivanov@student.bg', '0895647733', 'OU Vapcarov');

INSERT INTO FN71996.STUDENT
(ID, NAME, GRADE, NOTES, ATTENDANCE, EMAIL, PNUMBER, SNAME) VALUES
('121', 'Ivana Georgieva', '7', '4', '1', 'i.georgieva@student.bg', '0874326541', 'NUTI');

INSERT INTO FN71996.STUDENT
(ID, NAME, GRADE, NOTES, ATTENDANCE, EMAIL, PNUMBER, SNAME) VALUES
('122', 'Todor Simeonov', '9', '5', '1', 't.simeonov@student.bg', '0882034562', '9.FEG "Alphonse de Lamartine"');

INSERT INTO FN71996.STUDENT
(ID, NAME, GRADE, NOTES, ATTENDANCE, EMAIL, PNUMBER, SNAME) VALUES
('123', 'Filipa Andreeva', '12', '3', '0', 'f.andreeva@student.bg', '0876788763', 'NUTI');

INSERT INTO FN71996.STUDENT
(ID, NAME, GRADE, NOTES, ATTENDANCE, EMAIL, PNUMBER, SNAME) VALUES
('124', 'Nikol Nikolaeva', '5', '6', '1', 'n.nikolaeva@student.bg', '0891234657', 'OU Vapcarov');

INSERT INTO FN71996.PARENT
(NAME, EMAIL, PNUMBER, ADDRESS) VALUES
('Simeon Petrov', 's.petrov@gmail.com', '0894454565', 'Bulgaria, Sofia, str. "Georgi Rakovski" 4');

INSERT INTO FN71996.PARENT
(NAME, EMAIL, PNUMBER, ADDRESS) VALUES
('Andrei Nikolaev', 'a.nikolaev@gmail.com', '0892214565', 'Bulgaria, Razgrad, str. "Georgi Petrov" 32');

INSERT INTO FN71996.PARENT
(NAME, EMAIL, PNUMBER, ADDRESS) VALUES
('Filip Filipov', 'f.filipov@gmail.com', '0894333565', 'Bulgaria, Sofia, str. "Stefan Dimitrov" 41');

INSERT INTO FN71996.PARENT
(NAME, EMAIL, PNUMBER, ADDRESS) VALUES
('Maria Lulakova', 'm.lulakova@gmail.com', '087343456', 'Bulgaria, Razgrad, bul. "Strandza"5');

INSERT INTO FN71996.SUBJECT
(TNAME, SID, NOTES) VALUES
('Elena Petrova', '120', '5');

INSERT INTO FN71996.SUBJECT
(TNAME, SID, NOTES) VALUES
('Gabriela Georgieva', '121', '6');

INSERT INTO FN71996.SUBJECT
(TNAME, SID, NOTES) VALUES
('Petyo Kolev', '122', '4');

INSERT INTO FN71996.SUBJECT
(TNAME, SID, NOTES) VALUES
('Georgi Ivanov', '123', '5');

INSERT INTO FN71996.SUBJECT
(TNAME, SID, NOTES) VALUES
('Ivan Georgiev', '124', '5');

CREATE VIEW INFO7
AS
    SELECT P.NAME, S.PNAME, S.NOTES
        FROM PARENT P, STUDENT S
        WHERE P.NAME = S.PNAME;

SELECT NAME, NOTES FROM INFO7;


CREATE VIEW INFO9
AS
    SELECT T.NAME, S.ID
        FROM TEACHER T, STUDENT S
        WHERE T.SNAME = S.SNAME;

SELECT * FROM INFO9;

CREATE VIEW INFO10
AS
    SELECT S.NAME, S.PNAME, S.NOTES
    FROM STUDENT S;


