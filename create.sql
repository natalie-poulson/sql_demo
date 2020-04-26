-- Create a table to db
CREATE TABLE flights (
    id SERIAL PRIMARY KEY,
    origin VARCHAR NOT NULL,
    destination VARCHAR NOT NULL,
    duration INTEGER NOT NULL
)

-- Add to db
INSERT INTO flights (origin, destination, duration) VALUES ('New York', 'London', 415);

-- Reading from db/Querying our db
-- Get all rows & columns
SELECT * FROM flights;

-- Get certain column(s)
SELECT origin, destintion FROM flights;

-- Get certain row(s)
SELECT * FROM flights WHERE id = 3;
SELECT * FROM flights WHERE duration > 500;
SELECT * FROM flights WHERE destination = 'Paris' AND duration > 500;
SELECT * FROM flights WHERE destination = 'Paris' OR duration > 500;
SELECT * FROM flights WHERE origin IN ('New York', 'Lima');
-- Any origin that has an 'a' in it
SELECT * FROM flights WHERE origin LIKE '%a%';

-- Using functions
SELECT AVG(duration) FROM flights;
SELECT AVG(duration) FROM flights WHERE origin = 'New York';
SELECT MIN(duration) FROM flights;

-- Getting the count of rows in table
SELECT COUNT(*) FROM flights;
SELECT COUNT(*) FROM flights WHERE origin ='New York';


-- Modify db
UPDATE flights SET duration = 430 WHERE origin = 'New York' AND destination = 'London';

-- Delete from db
DELETE FROM flights WHERE destination = 'Tokyo';





