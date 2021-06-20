SET SCHEMA FN71996;

CREATE TABLE EMPLOYEES(
    employee_id NUM(3),
    first_name VARCHAR(15),
    last_name VARCHAR(15),
    hir_date DATE,
    job_id VARCHAR(10),
    salary NUM(7,2),
    commission_pet NUM(7,2),
    department_id NUM(2),
    manager_id NUM(3)

);

CREATE TABLE DEPARTMENTS(
    department_id NUM(2),
    department_name VARCHAR(20),
    location_id NUM(4)

);

CREATE TABLE LOCATIONS(
    location_id NUM(4),
    loc_name VARCHAR(20),
    city VARCHAR(30)

);

CREATE TABLE COUNTRIES (
     lcountry_id       CHAR(2),
           country_name   VARCHAR(40),
           region_id           NUM(4)

);

--1
SELECT CONCAT(CONCAT(last_name, ', '), job_id) AS EmployeeAndTitle
FROM EMPLOYEES;

--2
SELECT INITCAP(last_name) AS LastName, length(first_name) AS NameLength
FROM EMPLOYEES
WHERE last_name LIKE 'J&' OR
last_name LIKE 'A&' OR
last_name LIKE 'M&'
ORDER BY last_name;


--3
SELECT E.last_name, D.department_name, L.location_id, L.city
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE E.commission_pet <> NULL;

--4
SELECT E.employee_id, E.last_name, E.salary
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.department_id = D.department_id
--any employee with a ‘u’ in their name
AND E.last_name LIKE '_%u%'
AND E.first_name LIKE '_%u%'
--employees who earn more the average salary
AND E.salary > (SELECT AVG(SALARY) FROM EMPLOYEES E2
    WHERE E2.department_id = E.department_id);

--5
SELECT E.last_name, E.hir_date
FROM EMPLOYEES E
WHERE E.hir_date > (SELECT E2.hir_date FROM EMPLOYEES E2
WHERE E2.last_name = 'Davies');

--6
SELECT C.country_name, C.lcountry_id
FROM LOCATIONS L, DEPARTMENTS D, COUNTRIES C
WHERE D.department_id = L.location_id
INTERSECT
SELECT C.country_name, C.lcountry_id
FROM COUNTRIES C, LOCATIONS L
WHERE L.location_id NOT IN (C.lcountry_id);






