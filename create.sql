-------------------------------- Create a table to db
CREATE TABLE flights (
    id SERIAL PRIMARY KEY,
    origin VARCHAR NOT NULL,
    destination VARCHAR NOT NULL,
    duration INTEGER NOT NULL
)

---------------------------------- Add to db
INSERT INTO flights (origin, destination, duration) VALUES ('New York', 'London', 415);


-------------------------------- Reading from db/Querying our db
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
-- Limiting the results of a query
SELECT * FROM flights LIMIT 2;
SELECT * FROM flights ORDER BY duration ASC;
SELECT * FROM flights ORDER BY duration DESC;
SELECT * FROM flights ORDER BY duration ASC LIMIT 3;


-- Using functions
SELECT AVG(duration) FROM flights;
SELECT AVG(duration) FROM flights WHERE origin = 'New York';
SELECT MIN(duration) FROM flights;

-- Getting the count of rows in table
SELECT COUNT(*) FROM flights;
SELECT COUNT(*) FROM flights WHERE origin ='New York';


--------------------------------------- Modify db
UPDATE flights SET duration = 430 WHERE origin = 'New York' AND destination = 'London';

--------------------------------------- Delete from db
DELETE FROM flights WHERE destination = 'Tokyo';




-- Take all the rows based on their orign, and then count them up.
SELECT origin, COUNT(*) FROM flights GROUP BY origin;
--- Only get origins that have more than one flight
SELECT origin, COUNT(*) FROM flights GROUP BY origin HAVING COUNT(*) > 1;



-- Foreign Keys
CREATE TABLE passengers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    flight_id INTEGER REFERENCES flights
)

-- Find Alice
SELECT * FROM passengers WHERE first_name = 'Alice';
-- assume returns id 1
-- Find flight with that id
SELECT * FROM flights WHERE id = 1;

-- Do above in 1 step with JOINS (below are Inner Joins)
SELECT origin, destiation, first_name FROM flights JOIN passengers ON passengers.flight.id = flights.id; 
-- this is how to do it in 1 step
SELECT origin, destiation, first_name FROM flights JOIN passengers ON passengers.flight.id = flights.id WHERE first_name = 'Alice';


-- Left JOIN
-- Get flights that don't have any passengers also
SELECT origin, destiation, first_name FROM flights LEFT JOIN passengers ON passengers.flight.id = flights.id; 




-- Nested Queries
-- Get flight_ids that have more than one passenger
SELECT flight_id FROM passengers GROUP BY flight_id HAVING COUNT(*) > 1;
--  Get flight info 
SELECT * FROM flights WHERE id IN (SELECT flight_id FROM passengers GROUP BY flight_id HAVING COUNT(*) > 1);