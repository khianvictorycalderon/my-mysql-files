-- TEMPORARY TABLE
CREATE TEMPORARY TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(200)
);
ALTER TABLE users AUTO_INCREMENT = 1001;

INSERT INTO users(name) VALUES
 ('zyrus'),
 ('patrick'),
 ('james');
 
SELECT * FROM users;

DROP TEMPORARY TABLE users;


-- Clone tables
/*
  Similar to CREATE TABLE table_name( SELECT * FROM )
  but includes indexes and all
*/

CREATE TABLE new_table_name LIKE original_table_name;
INSERT INTO new_table_name SELECT * FROM original_table_name;