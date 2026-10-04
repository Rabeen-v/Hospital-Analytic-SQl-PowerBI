create database Hospital_analytic;
 
 use Hospital_analytic;


CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100),
    gender VARCHAR(10),
    date_of_birth DATE,
    city VARCHAR(50),
    blood_group VARCHAR(5)
);

INSERT INTO patients
VALUES
(1, 'Arun Kumar', 'Male', '1998-05-12', 'Chennai', 'O+'),
(2, 'Priya Raj', 'Female', '2000-08-21', 'Nagapattinam', 'A+'),
(3, 'Rahul Das', 'Male', '1995-02-10', 'Chennai', 'B+'),
(4, 'Divya Mani', 'Female', '1999-11-05', 'Madurai', 'AB+'),
(5, 'Karthik S', 'Male', '1992-07-18', 'Coimbatore', 'O+'),
(6, 'Meena Devi', 'Female', '1988-03-25', 'Chennai', 'A-'),
(7, 'Suresh Kumar', 'Male', '1979-09-14', 'Trichy', 'B+'),
(8, 'Anitha R', 'Female', '1996-12-30', 'Salem', 'O-'),
(9, 'Vignesh P', 'Male', '2001-06-08', 'Chennai', 'AB+'),
(10, 'Nandhini K', 'Female', '1994-04-17', 'Madurai', 'A+');

select count(*) from patients;

select patient_id,count(*) from patients group by patient_id having count(*)>1;

select count(*) as total_patients from patients;

select gender,count(*) as patient_count from patients group by gender;

select city,count(*) as patient_count from patients group by city order by patient_count desc;

select blood_group,count(*) as patient_count from patients group by blood_group order by patient_count desc;
