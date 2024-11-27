    -- Return rows
    SELECT email, id FROM users
     WHERE country = 'PH'
     AND id > 1
     OR email LIKE "z%"
     ORDER BY id ASC
     LIMIT 2;