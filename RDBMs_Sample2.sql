    -- @Create table 1
    CREATE TABLE IF NOT EXISTS users (
      id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
      name VARCHAR(100) NOT NULL
    );
    
    -- @Insert sample data in table 1
    INSERT INTO users (name) VALUES
     ('Blake'),
     ('Ryan'),
     ('Jesse'),
     ('Glaiza'),
     ('Kyla'),
     ('Lee');
    
    -- @Create table 2
    CREATE TABLE IF NOT EXISTS hobbies (
      id INT AUTO_INCREMENT PRIMARY KEY,
      user_id INT NOT NULL,
      hobby VARCHAR(100) NOT NULL,
      FOREIGN KEY (user_id) REFERENCES users(id)
    );
    
    -- @Insert sample data in table 2
    INSERT INTO hobbies (user_id, hobby) VALUES
     (1, 'Swimming'),
     (2, 'Cycling'),
     (3, 'Singing'),
     (5, 'Skydiving'),
     (5, 'Sleeping'),
     (6, 'Walking'),
     (7, 'Running');  -- Assuming id 7 has no corresponding user
    
    -- @Select INNER JOIN
    SELECT 
       users.id AS users_id,
       users.name AS users_name,
       hobbies.id AS hobbies_id,
       hobbies.hobby AS hobby
       FROM users 
       INNER JOIN hobbies ON users.id = hobbies.user_id;
    
    -- @Full Outer Join using UNION
    SELECT 
       users.id AS users_id,
       users.name AS users_name,
       hobbies.id AS hobbies_id,
       hobbies.hobby AS hobby
       FROM users 
       LEFT JOIN hobbies ON users.id = hobbies.user_id
    UNION SELECT 
       users.id AS users_id,
       users.name AS users_name,
       hobbies.id AS hobbies_id,
       hobbies.hobby AS hobby
       FROM users 
       RIGHT JOIN hobbies ON users.id = hobbies.user_id;