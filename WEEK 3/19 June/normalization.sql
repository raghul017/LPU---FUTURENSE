-- ANOMALIES
-- Update Anomaly: Update the cost of a treatment and see the impact on existing appointments
UPDATE Treatments
SET cost = 1500
WHERE treatment_id = 1;

-- Delete Anomaly: Delete a treatment and see the impact on existing appointments
DELETE FROM Treatments
WHERE treatment_id = 5;

-- Insertion Anomaly: Try inserting an appointment for a non-existent patient
INSERT INTO Appointments (appointment_id, patient_id, treatment_id, appointment_date)
VALUES (10005, 106, 2, '2024-07-01');

-- Candidate Keys: Display treatment information and choose the primary key
SELECT treatment_id, treatment_name, cost, duration, location
FROM Treatments;

-- Foreign Keys: Join Appointments and Patients tables using the foreign key relationship
SELECT a.appointment_id, p.patient_name, a.treatment_id
FROM Appointments a
INNER JOIN Patients p ON a.patient_id = p.patient_id
WHERE a.patient_id = 102;

-- 1NF: Example of table adhering to 1NF
CREATE TABLE Treatments_1NF (
    treatment_id INT PRIMARY KEY,
    treatment_name VARCHAR(50) NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    duration INT,
    location VARCHAR(30) CHECK(location IN ('New York', 'Los Angeles'))
);

-- 2NF: Example of table adhering to 2NF
-- Decomposed Appointments table into Appointments and Appointment_Details
CREATE TABLE Appointments_2NF (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    appointment_date DATE NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

CREATE TABLE Appointment_Details (
    appointment_detail_id INT PRIMARY KEY,
    appointment_id INT,
    treatment_id INT,
    notes VARCHAR(255),
    FOREIGN KEY (appointment_id) REFERENCES Appointments_2NF(appointment_id),
    FOREIGN KEY (treatment_id) REFERENCES Treatments(treatment_id)
);

-- 3NF: Example of table adhering to 3NF
-- Decomposed Appointments table into Appointments and PatientLocation
CREATE TABLE Appointments_3NF (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    treatment_id INT,
    appointment_date DATE NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (treatment_id) REFERENCES Treatments(treatment_id)
);

CREATE TABLE PatientLocation (
    patient_id INT PRIMARY KEY,
    city VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- BCNF: Example of table adhering to BCNF
-- Decomposed Appointments table into Appointment_Info and Appointment_Details
CREATE TABLE Appointment_Info (
    appointment_id INT PRIMARY KEY,
    appointment_date DATE NOT NULL,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

CREATE TABLE Appointment_Details (
    appointment_id INT,
    patient_id INT,
    treatment_id INT,
    PRIMARY KEY (appointment_id, patient_id, treatment_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (treatment_id) REFERENCES Treatments(treatment_id)
);
