-- Ghazal
-- DSC110: Introduction to Data Science and Programming, Week 3 SQL Homework, This file contains the SQL exercises completed in class.
-- The comments explain what each query does and why it is used.


-- This part creates a table called Patients.
-- Each row represents one patient.
-- patient_id is the primary key, so every patient must have a unique ID.
-- name cannot be empty because it is defined as NOT NULL.
-- The other columns store the patient's age, gender, and city.

CREATE TABLE Patients (
    patient_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER,
    gender TEXT,
    city TEXT
);


-- This part inserts six sample patients into the Patients table.
-- Each patient has a unique ID along with their name, age, gender, and city.

INSERT INTO Patients (patient_id, name, age, gender, city) VALUES
(1, 'John Doe', 45, 'M', 'Boston'),
(2, 'Jane Smith', 32, 'F', 'Cambridge'),
(3, 'Mike Johnson', 58, 'M', 'Boston'),
(4, 'Sarah Williams', 41, 'F', 'Somerville'),
(5, 'David Brown', 29, 'M', 'Boston'),
(6, 'Emily Davis', 67, 'F', 'Cambridge');


-- This query displays all columns and all rows from the Patients table.
-- The * means that all fields in the table will be shown.

SELECT * FROM Patients;


-- This part creates a table called Visits.
-- Each row represents one patient visit.
-- visit_id is the primary key and uniquely identifies each visit.
-- patient_id connects the visit to a patient in the Patients table.
-- The foreign key creates a relationship between the two tables.

CREATE TABLE Visits (
    visit_id INTEGER PRIMARY KEY,
    patient_id INTEGER,
    visit_date TEXT,
    diagnosis TEXT,
    cost REAL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);


-- This part inserts sample visit data into the Visits table.
-- Each row includes the visit ID, patient ID, date, diagnosis, and cost.

INSERT INTO Visits (visit_id, patient_id, visit_date, diagnosis, cost) VALUES
(101, 1, '2024-01-15', 'Hypertension', 150.00),
(102, 1, '2024-03-20', 'Diabetes', 200.00),
(103, 2, '2024-02-10', 'Flu', 100.00),
(104, 3, '2024-01-25', 'Hypertension', 150.00),
(105, 3, '2024-02-14', 'Back Pain', 180.00),
(106, 4, '2024-03-05', 'Diabetes', 200.00),
(108, 6, '2024-02-20', 'Arthritis', 220.00),
(109, 6, '2024-03-15', 'Hypertension', 150.00);


-- This part displays all rows and columns from the Visits table.

SELECT * FROM Visits;


-- This part displays all rows and columns from the Patients table.

SELECT * FROM Patients;


-- This part selects only patients who live in Boston.
-- The WHERE clause is used to filter the records based on city.

SELECT *
FROM Patients
WHERE city = 'Boston';


-- This part selects only female patients.
-- The WHERE clause filters the gender column and returns records where gender is F.

SELECT *
FROM Patients
WHERE gender = 'F';

-- This part selects only patient_id, name, and age.
-- Instead of displaying every column, we specify the fields we want to see.

SELECT patient_id, name, age
FROM Patients;


-- This part selects only the name and city of each patient.
-- Other columns from the Patients table will not be displayed.

SELECT name, city
FROM Patients;



-- This part counts the total number of rows in the Patients table.
-- COUNT(*) counts every patient record.

SELECT COUNT(*)
FROM Patients;


-- This part counts how many different gender values are in the Patients table.
-- DISTINCT makes sure repeated values are only counted once.

SELECT COUNT(DISTINCT gender)
FROM Patients;


-- This part calculates the average age of all patients.
-- AVG() calculates the mean of the values in the age column.

SELECT AVG(age)
FROM Patients;



-- This Part calculates the average age for each gender.
-- GROUP BY separates the patients into gender groups before calculating the average.

SELECT gender, AVG(age)
FROM Patients
GROUP BY gender;

-- NOTE: After this part I used the help of AI since I was so confused. I have to visit office hours or practice more to get more comfortable in this part. 

-- This Part calculates the average age for each gender.
-- It then sorts the results from the highest average age to the lowest.
-- ORDER BY 2 means that the results are sorted using the second selected column,
-- which is AVG(age).
-- DESC means descending order.

SELECT gender, AVG(age)
FROM Patients
GROUP BY gender
ORDER BY 2 DESC;



-- INNER JOIN
-- This part combines information from the Patients and Visits tables.
-- The two tables are matched using patient_id.
-- An inner join only returns patients who have a matching visit.
-- p and v are shorter aliases for the Patients and Visits tables.

SELECT
    p.name,
    p.age,
    v.visit_date,
    v.diagnosis,
    v.cost
FROM Patients p
JOIN Visits v ON p.patient_id = v.patient_id;


-- LEFT JOIN
-- This part also combines the Patients and Visits tables using patient_id.
-- A left join keeps every patient from the Patients table,
-- even if that patient does not have a matching visit.
-- If there is no matching visit, the visit information will appear as NULL.

SELECT
    p.name,
    p.age,
    v.visit_date,
    v.diagnosis,
    v.cost
FROM Patients p
LEFT JOIN Visits v ON p.patient_id = v.patient_id;
