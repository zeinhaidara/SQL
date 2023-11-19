-- Drop tables if they exist
DROP TABLE IF EXISTS employee, contact, address;

-- Create employee table
CREATE TABLE employee (
    id SERIAL PRIMARY KEY,
    fname TEXT,
    lname TEXT,
    age INT,
    hiredate DATE
);

-- Load employee records
INSERT INTO employee (id, fname, lname, age, hiredate)
VALUES
    (01, 'Alan', 'Palmer', 32, '2019-12-15'),
    (02, 'Susan', 'Shepard', 28, '2015-07-21'),
    (03, 'Justin', 'Ward', 43, '2017-08-24'),
    (04, 'Alan', 'Smith', 30, '2017-06-22'),
    (05, 'James', 'Betternot', 26, '2017-06-22'),
    (06, 'Ralph', 'White', 44, '2017-06-23'),
    (07, 'Leonard', 'Nimoy', 72, '2007-12-14'),
    (08, 'Janice', 'Rand', 61, '2016-07-06'),
    (09, 'Harry', 'Mudd', 65, '2020-07-06'),
    (10, 'Hikaru', 'Sulu', 58, '2015-03-21'),
    (11, 'James', 'Kirk', 59, '2014-01-02'),
    (12, 'Leonard', 'McCoy', 65, '2015-08-21'),
    (13, 'Pavel', 'Chekov', 44, '2014-10-15'),
    (14, 'Christopher', 'Pike', 32, '2014-11-24'),
    (15, 'Darth', 'Vader', 124, '2015-03-22'),
    (16, 'Boba', 'Fett', 49, '2015-03-22'),
    (17, 'Luke', 'Skywalker', 66, '2019-11-11'),
    (18, 'Han', 'Solo', 73, '2012-02-03'),
    (19, 'Kylo', 'Ren', 34, '2020-06-14'),
    (20, 'Galen', 'Erso', 55, '2020-06-14');

-- Create address table
CREATE TABLE address (
    id SERIAL PRIMARY KEY,
    address1 TEXT,
    address2 TEXT,
    city TEXT,
    state TEXT,
    zip TEXT
);

-- Load address records
INSERT INTO address (id, address1, address2, city, state, zip)
VALUES
    (01, '1211 Sudan St', 'n/a', 'Mobile', 'AL', '36609'),
    (02, '4800 Barkshire Dr', 'n/a', 'Pace', 'FL', '32571'),
    (03, '12 Nutmeg Ct', 'n/a', 'Culver City', 'CA', '90211'),
    (04, '2142 Elmwood Pl', 'n/a', 'Johnson City', 'TN', '37112'),
    (05, '777 Heavenly Ln', 'Box 13', 'Pike City', 'MN', '50877');

-- Create contact table
CREATE TABLE contact (
    id SERIAL PRIMARY KEY,
    cellphone TEXT,
    homephone TEXT,
    email TEXT
);

-- Load contact records
INSERT INTO contact (id, cellphone, homephone, email)
VALUES
    (01, '5121325343', '5125234234', 'apalmer@yachtmail.com'),
    (02, '5129739834', '5129847873', 'sshepard@yorkdevtraining.com'),
    (03, '6453898502', '6459872345', 'jsward2007@yahoo.com'),
    (04, '8763238756', '8763736548', 'alsmith999@gmail.com'),
    (05, '8880345966', '8888567987', 'james.betternot@hotmail.com'),
    (06, '3322827765', '3328760098', 'ralph.white264@aol.com');

-- Query 1: Join employee and address tables on id and return fname, lname, age, city, state where fname = 'Alan'
SELECT e.fname, e.lname, e.age, a.city, a.state
FROM employee e
JOIN address a ON e.id = a.id
WHERE e.fname = 'Alan';

-- Query 2: Join employee, address, and contact tables on id and return fname, lname, age, city, state, email where email = 'james.betternot@hotmail.com'
SELECT e.fname, e.lname, e.age, a.city, a.state, c.email
FROM employee e
JOIN address a ON e.id = a.id
JOIN contact c ON e.id = c.id
WHERE c.email = 'james.betternot@hotmail.com';

-- Update Susan Shepard's cellphone to be 4383991212
UPDATE contact
SET cellphone = '4383991212'
WHERE id = (SELECT id FROM employee WHERE fname = 'Susan' AND lname = 'Shepard');

-- Query 3: Return all data for Susan
SELECT *
FROM employee e
JOIN contact c ON e.id = c.id
WHERE e.fname = 'Susan' AND e.lname = 'Shepard';
