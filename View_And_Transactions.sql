-- Views (Virtual Tables)
 
 CREATE VIEW myview 
  AS name, age
  FROM users;
  
 SELECT * FROM myview;
 
 DROP VIEW myview
 
 
 -- Transactions
 
 CREATE TABLE accounts (
   id INT PRIMARY KEY AUTO_INCREMENT,
   name VARCHAR(200),
   balance DECIMAL(18,2) NOT NULL DEFAULT 0.0
 );
 
 INSERT INTO accounts(name,balance) VALUES
  ('john',5000.00),
  ('jake',8000.00),
  ('aimee',2000.00);
 
 START TRANSACTION;
 
 UPDATE accounts
  SET balance = balance - 100
  WHERE id = 1;
  SAVEPOINT A;
 
 UPDATE accounts
  SET balance = balance + 100
  WHERE id = 2;
  SAVEPOINT B;
  
 ROLLBACK TO SAVEPOINT A;
 
 COMMIT;
 
 RELEASE SAVEPOINT A; -- Removes the SAVEPOINT
