    -- @Create first table 
    CREATE TABLE users (
       id INT PRIMARY KEY AUTO_INCREMENT,
       email VARCHAR(200) NOT NULL UNIQUE,
       bio TEXT,
       country VARCHAR(2)
    );
    
    -- @Insert 20 sample values (Sample Data Only)
    INSERT INTO users (email, bio, country) VALUES
     ('john@example.com', 'Hi, I am John. I love hiking and photography.', 'US'),
     ('emma@example.com', 'Hey there! I am Emma. I am passionate about painting and traveling.', 'CA'),
     ('michael@example.com', 'Hello, I am Michael. I enjoy playing guitar and reading sci-fi novels.', 'UK'),
     ('sophia@example.com', 'Hi, I am Sophia. I am a food enthusiast and love to explore new cuisines.', 'AU'),
     ('lucas@example.com', 'Hello, I am Lucas. I enjoy traveling and learning new languages.', 'DE'),
     ('olivia@example.com', 'Hi, I am Olivia. I love skiing and trying out French cuisine.', 'FR'),
     ('carlos@example.com', 'Hello, I am Carlos. I love soccer and Latin music.', 'ES'),
     ('giulia@example.com', 'Hi, I am Giulia. I enjoy Italian fashion and traditional cooking.', 'IT'),
     ('takeshi@example.com', 'Hello, I am Takeshi. I am interested in Japanese culture and history.', 'JP'),
     ('samantha@example.com', 'Hi, I am Samantha. I enjoy hiking and practicing yoga.', 'US'),
     ('william@example.com', 'Hello, I am William. I love playing hockey and camping.', 'CA'),
     ('amelia@example.com', 'Hi, I am Amelia. I am passionate about classical music and gardening.', 'UK'),
     ('noah@example.com', 'Hello, I am Noah. I enjoy cricket and exploring Indian cuisine.', 'AU'),
     ('hannah@example.com', 'Hi, I am Hannah. I love painting and exploring nature.', 'DE'),
     ('antoine@example.com', 'Hello, I am Antoine. I love cooking and playing rugby.', 'FR'),
     ('mateo@example.com', 'Hi, I am Mateo. I enjoy surfing and Mexican food.', 'ES'),
     ('chiara@example.com', 'Hi, I am Chiara. I love art and traveling the world.', 'IT'),
     ('yuki@example.com', 'Hello, I am Yuki. I love Japanese anime and games.', 'JP'),
     ('james@example.com', 'Hi, I am James. I enjoy playing basketball and coding.', 'US'),
     ('olivia2@example.com', 'Hello, I am Olivia. I love playing the piano and volunteering.', 'CA');
    
    -- @Select Condition 1 ( * or star means everything):
    SELECT * FROM users
      WHERE country = 'US'
      OR id > 2
      ORDER BY id ASC
      LIMIT 2;
    
    -- @Select Condition 2 ('a%' = starts with a):
    SELECT email, id, country FROM users
      WHERE country = 'US'
      AND email LIKE 'a%'
      ORDER BY id DESC
      LIMIT 2;
    
    -- @Create index on email to retrieve data faster
    CREATE INDEX email_index ON users(email);
    
    -- @Create second table (relational)
    CREATE TABLE rooms (
       id INT AUTO_INCREMENT,
       street VARCHAR(200),
       owner_id INT NOT NULL,
       PRIMARY KEY (id),
       FOREIGN KEY (owner_id) REFERENCES users(id)
    );
    
    -- @Sample insert in table 2
    INSERT INTO rooms (street, owner_id) VALUES
     ('lucena', 1),
     ('sariaya', 1),
     ('tayabas', 1),
     ('lucban', 1),
     ('pagbilao', 1),
     ('tiaong', 1),
     ('atimonan', 1);
    
    -- @Select Relational 1:
    SELECT * FROM users
      INNER JOIN rooms
      ON rooms.owner_id = users.id;