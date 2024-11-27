-- @ Subquery, a query inside a query, results of a column are independent from each other
SELECT name, (SELECT MAX(age) FROM users) AS max_age
FROM users;


-- @ Creating a sub table (sample data)
CREATE TABLE cellphone_no (
   id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   owner_id INT NOT NULL,
   cellphone_number TEXT NOT NULL,
   FOREIGN KEY (owner_id) REFERENCES users(id)
);
-- @ Cellphone numbers example (sample data)
INSERT INTO cellphone_no(owner_id,cellphone_number) VALUES
 (1, '0999 421 4285'),
 (2, '0999 123 4567'),
 (3, '0999 234 5678'),
 (4, '0999 345 6789'),
 (5, '0999 456 7890'),
 (6, '0999 567 8901'),
 (7, '0999 678 9012');

-- @ Resetting auto_increment to 1
ALTER TABLE cellphone_no
 AUTO_INCREMENT = 1;

-- @ Arithmetic operators
SELECT * FROM users
   WHERE id = 2 + 2
   OR id = 2 - 2
   OR id = 2 * 2
   OR id = 2 / 2;
   OR id = 2 % 2; -- 0 remainder
   
   
-- @ Comparison operators
SELECT * FROM users
   WHERE id = 1 -- equal
   OR id > 1 -- greater than
   OR id < 1 -- less than
   OR id >= 1 -- greater than or equal
   OR id <= 1 -- less than or equal
   OR id != 1 -- not equal
   OR id <> 1 -- less than or greater than (similar to not equal)
   OR id !> 1 -- not greater than
   OR id !< 1 -- not less than
   
   
   
-- @ Logical operator (sample data)
CREATE TABLE employees (
  employee_id INT PRIMARY KEY AUTO_INCREMENT,
  employee_name VARCHAR(200) NOT NULL,
  employee_department CHAR(50) NOT NULL,
  employees_salary DECIMAL(20,2),
  employees_generated_revenue DECIMAL(20,2) NOT NULL
);
INSERT INTO employees(employee_name,employee_department,employees_salary,employees_generated_revenue) VALUES
  ('John Smith', 'Marketing', 50000.00, 65000.00),
  ('Mary Johnson', 'HR', 48000.00, 55000.00),
  ('Michael Williams', 'Sales', 55000.00, 70000.00),
  ('Jennifer Brown', 'Finance', 60000.00, 72000.00),
  ('William Jones', 'IT', 52000.00, 58000.00),
  ('Linda Garcia', 'Marketing', 48000.00, 50000.00),
  ('David Martinez', 'Sales', 60000.00, 65000.00),
  ('Susan Davis', 'Finance', 55000.00, 60000.00),
  ('Robert Rodriguez', 'HR', 48000.00, 45000.00),
  ('Karen Wilson', 'IT', 52000.00, 48000.00),
  ('Daniel Hernandez', 'Marketing', 50000.00, 55000.00),
  ('Lisa Gonzalez', 'Sales', 58000.00, 63000.00),
  ('Paul Taylor', 'Finance', 62000.00, 70000.00),
  ('Mark Anderson', 'IT', 54000.00, 59000.00),
  ('Betty Thomas', 'HR', 47000.00, 48000.00),
  ('Donald Moore', 'Marketing', 49000.00, 48000.00),
  ('Helen Walker', 'Sales', 57000.00, 60000.00),
  ('Christopher Hill', 'Finance', 63000.00, 65000.00),
  ('Amy Lee', 'IT', 53000.00, 50000.00),
  ('Richard Scott', 'HR', NULL, 42000.00);
 
 
-- @ reseting
TRUNCATE employees;
 ALTER TABLE employees
 AUTO_INCREMENT = 1001;

-- @ Logical operators

-- ALL
SELECT *
 FROM employees
 WHERE employee_department = ALL (
    SELECT employee_department
    FROM employees
    WHERE employee_department = 'HR'
    );
    
-- ANY and SOME (can be use interchangably)
SELECT *
 FROM employees
 WHERE employee_department = ANY (
    SELECT employee_department
    FROM employees
    WHERE employee_department = 'Finance'
        OR employee_department = 'IT'
    );
    
SELECT *
 FROM employees
 WHERE employee_department = SOME (
    SELECT employee_department
    FROM employees
    WHERE employee_department = 'Finance'
        OR employee_department = 'IT'
    );
    
-- AND
SELECT *
 FROM employees
 WHERE employees_salary > 50000.00
 AND employee_department = 'IT';
    
-- BETWEEN
SELECT *
 FROM employees
 WHERE employees_salary
 BETWEEN 40000.00 AND 50000.00;
 
-- EXISTS (can be more efficient when checking for the existence of rows, especially in scenarios where the subquery may return a large result set.)
SELECT *
 FROM employees
 WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE employees.employee_id = e.employee_id
    AND employees_generated_revenue > employees_salary
);

-- IN (often faster for smaller result sets or when comparing against a small set of values.)
SELECT *
 FROM employees
 WHERE employee_id IN (
    SELECT employee_id
    FROM employees
    WHERE employees_generated_revenue > employees_salary
);

-- LIKE
SELECT *
 FROM employees
 WHERE employee_id
 LIKE "%hello%";
 
-- NOT & OR (returns the same results)
SELECT * 
 FROM employees
 WHERE NOT employee_department = 'IT'
 OR employee_department != 'IT';
 
-- IS NULL
SELECT *
 FROM employees
 WHERE employees_salary IS NULL;
 

-----------------------------------------------------------