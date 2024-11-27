-- @ General CONSTRAINTS

-- NOT NULL
CREATE TABLE user (
  id INT NOT NULL
);

-- Modify column to add NOT NULL constraint
ALTER TABLE user
  MODIFY id INT NOT NULL;

-- Modify column to drop NOT NULL constraint
ALTER TABLE user
  MODIFY id INT NULL;


-- DEFAULT (provides a default value)
CREATE TABLE user (
  name VARCHAR(200),
  salary DECIMAL(18,2) DEFAULT 5000.00
);

-- Modify column to change the default value
ALTER TABLE user
  MODIFY COLUMN salary DECIMAL(18,2) DEFAULT 6000.00;

-- Modify column to drop the default value
ALTER TABLE user
  ALTER COLUMN salary DROP DEFAULT;

-- Inserting with default values
-- Method 1, omit the default:
INSERT INTO user(name) VALUES ('jake');

-- Method 2, explicitly state:
INSERT INTO user(name, salary) VALUES ('jake', DEFAULT);

 
 
-- UNIQUE
CREATE TABLE customers (
   id INT PRIMARY KEY,
   name VARCHAR(200),
   table_number INT UNIQUE
 ); 
 
-- Adding unique constraint (only if not already defined)
ALTER TABLE customers
 ADD CONSTRAINT uniqueness UNIQUE (table_number);

-- Dropping the unique constraint
ALTER TABLE customers
 DROP INDEX table_number;


-- PRIMARY KEY
CREATE TABLE user (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(200)
);

ALTER TABLE user
 DROP PRIMARY KEY
 

-- FOREIGN KEY
CREATE TABLE orders (
  id INT PRIMARY KEY AUTO_INCREMENT,
  owner_id INT NOT NULL,
  item VARCHAR(200),
  FOREIGN KEY (owner_id) REFERENCES user(id)
);

ALTER TABLE user
 DROP FOREIGN KEY
 
 
-- CHECK
CREATE TABLE users (
  name VARCHAR(200),
  age INT CHECK (age >= 18)
  height INT
);

 -- multiple conditions
CREATE TABLE users (
  name VARCHAR(200),
  age INT,
  height INT,
  CHECK (age >= 18 AND height >= 5)
);

ALTER TABLE users
 ADD CONSTRAINT mycondition
 CHECK (age >= 18 AND height >= 5);
 
ALTER TABLE user
 DROP CONSTRAINT mycondition;
 

-- INDEX
CREATE INDEX age_index ON users(age);

ALTER TABLE users
 DROP INDEX age_index;