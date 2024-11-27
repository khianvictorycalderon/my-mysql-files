-- Database stuff

-- create
CREATE DATABASE sample_database;

-- show
SHOW DATABASES;

-- delete
DROP DATABASE sample_database;

-- select
USE sample_database;

-- describe table
DESC table_name;
DESCRIBE table_name;

-- copy a table from another table
CREATE TABLE copied_table AS
 SELECT * FROM employees
 
-- delete table
DROP TABLE table_name;

-- insert
INSERT INTO table_name(column1, column2)
 VALUES (column1_value,column2_value), -- row 1
        (column1_value,column2_value), -- row 2
        (column1_value,column2_value); -- row 3
        
-- copy another table data
CREATE TABLE copied_table(
    data_info VARCHAR(200)
);
INSERT INTO copied_table(data_info)
 SELECT employee_name
 FROM employees;
 
-- update rows
UPDATE table_name
 SET column1_name = value1, column2_name = value2
 WHERE id = 6
 OR id = 5;
 
-- delete row
DELETE FROM table_name
 WHERE department = 'IT';
 
-- LIKE
SELECT *
 FROM employees
 WHERE employee_name
 LIKE '%hello'; -- 123hello
 
SELECT *
 FROM employees
 WHERE employee_name
 LIKE 'hello%'; -- hello123
 
SELECT *
 FROM employees
 WHERE employee_name
 LIKE '%hello%'; -- 123hello123
 
SELECT *
 FROM employees
 WHERE employee_name
 LIKE 'hello'; -- hello
 
SELECT *
 FROM employees
 WHERE employee_name
 LIKE 'h_llo'; -- hallo hello hillo hxllo (basically anything)

SELECT *
 FROM employees
 WHERE employee_name
 LIKE 'h_l_o'; -- halpo hilto helyo (basically anything)
 
SELECT * -- combination of the 2 wildcard
 FROM employees
 WHERE employee_name
 LIKE '%he_lo%'; -- 123heplo123 321hexlo321 (basically anything)
 
 
-- TOP, mysql uses limit INSTEAD
SELECT *
 FROM employees
 LIMIT 3;
 
 
-- ORDER (arranges alphabetically or numerically based on the data type)
-- ASC or DESC only, by default is ASC
SELECT *
 FROM employees
 ORDER BY employee_name DESC; -- (Z-A)
 
SELECT *
 FROM employees
 ORDER BY employee_name ASC; -- (A-Z)
 
SELECT *
 FROM employees
 ORDER BY employees_salary ASC; -- (0-9)
 
-- Group by (with indentical data)
-- Total revenue per department
SELECT employee_department, SUM(employees_generated_revenue) AS department_total_revenue
 FROM employees
 GROUP BY employee_department;
 
-- distinct (elimated duplicate data)
-- lists the total number of departments
SELECT DISTINCT employee_department
 FROM employees;
 
 
-- multiple sorting
-- primary, secondary, and tertiary sorting
-- so if there is a conflict in the primary, it will move to the secondary
-- and if there is a conflict in the secondary, it will move to the tertiary and so on
SELECT *
 FROM employees
 ORDER BY employee_department DESC, employees_salary;
 -- in this case, there are multiple employees with the same department, so it will move to their salary instead
