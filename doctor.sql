use  Hospital_analytic;

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100),
    specialization VARCHAR(100),
    department VARCHAR(100),
    experience_years INT
);

INSERT INTO doctors
VALUES
(101, 'Dr. Kumar', 'Cardiology', 'Cardiology', 12),
(102, 'Dr. Priya', 'Neurology', 'Neurology', 8),
(103, 'Dr. Arun', 'Orthopedics', 'Orthopedics', 10),
(104, 'Dr. Meena', 'Pediatrics', 'Pediatrics', 7),
(105, 'Dr. Ravi', 'Dermatology', 'Dermatology', 6),
(106, 'Dr. Anitha', 'General Medicine', 'General Medicine', 15),
(107, 'Dr. Suresh', 'Cardiology', 'Cardiology', 18),
(108, 'Dr. Divya', 'Gynecology', 'Gynecology', 9);

select count(*) as total_doctors from doctors;

select doctor_name,experience_years from doctors order by experience_years desc limit 1;

select department,count(*)as doctor_count from doctors group by department order by doctor_count desc;