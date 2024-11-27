    -- Altering table properties
    
    -- Using MODIFY (redefining entire set of rules)
    ALTER TABLE users
    MODIFY name 
    VARCHAR(200) NOT NULL UNIQUE;
    
    -- Using add and drop CONSTRAINTS
    ALTER TABLE users
    ADD CONSTRAINT constraint_name
    CHECK (id >= 18);
    
    ALTER TABLE users
    DROP CONSTRAINT constraint_name;