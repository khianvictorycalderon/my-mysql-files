 -- @ Order clause
 SELECT name, age
 FROM users
 WHERE age >= 18
 ORDER BY name DESC;
 
 SELECT name, age
 FROM users
 WHERE age >= 18
 ORDER BY name ASC;
 
 
-- @ Group and Count clause
-- Group columns with the same data value
CREATE TABLE users (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    age INT NOT NULL
);

INSERT INTO users(name,age) VALUES
 ('John Doe',18),
 ('Patrick Reyes',19),
 ('Isaac Newton',18),
 ('Albert Guinto',18),
 ('Jericho Disanta',19),
 ('Cara Nepo',20),
 ('Cristine Apacio',20);
 
SELECT -- Displays the number of columns with the same age
 COUNT(name) AS name_with_same_age,
 age
 FROM users
 GROUP BY age;
 
/*

 Aggregate Functions:
 SUM() = Returns the total sum of a numeric column.
 COUNT() = Returns the number of rows.
 AVG() = Returns the average value of a numeric column.
 MAX() = Returns the maximum value.
 MIN() = Returns the minimum value.
 
*/

-- Having Clause, like WHERE but has aggregated functions

SELECT age, COUNT(*) AS user_count
 FROM users
 GROUP BY age
 HAVING COUNT(*) > 1
 ORDER BY age DESC;
 
 
-- @ Describe Clause , column parameters
DESC users;
DESCRIBE users;


-- @ Truncate, empties all the rows of a TABLE
TRUNCATE users;

-- @ Delete row, selected rows ONLY
DELETE FROM users
WHERE age <= 18;


-- @ Rename a table using ALTER
ALTER TABLE users
RENAME TO new_table_name;


-- @ Create and delete DATABASE
CREATE DATABASE new_database;
DROP DATABASE old_database;


-- @ Use database
USE DATABASE database_name;

-- @ Create database if not exist
CREATE DATABASE IF NOT EXISTS mydatabase;


-- @ Commit and rollback, rollback is like an undo

START TRANSACTION;
 -- SQL statements
COMMIT; -- Permanently saved data

START TRANSACTION;
 -- SQL statements
ROLLBACK; -- Discards saved data