use Hospital_analytic;

CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_status VARCHAR(30),

    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);


INSERT INTO appointments
VALUES
(1001, 1, 101, '2026-01-05', 'Completed'),
(1002, 2, 108, '2026-01-07', 'Completed'),
(1003, 3, 102, '2026-01-10', 'Completed'),
(1004, 4, 103, '2026-01-12', 'Cancelled'),
(1005, 5, 106, '2026-01-15', 'Completed'),
(1006, 6, 101, '2026-01-18', 'Completed'),
(1007, 7, 107, '2026-01-20', 'Completed'),
(1008, 8, 105, '2026-01-22', 'Pending'),
(1009, 9, 103, '2026-01-25', 'Completed'),
(1010, 10, 104, '2026-01-28', 'Completed'),
(1011, 1, 107, '2026-02-02', 'Completed'),
(1012, 3, 102, '2026-02-05', 'Completed');

select count(*) as total_appointments from appointments;

select appointment_status,count(*) as appointment_count from appointments group by appointment_status;


SELECT
    d.department,
    COUNT(*) AS appointment_count
FROM appointments a
JOIN doctors d
    ON a.doctor_id = d.doctor_id
GROUP BY d.department
ORDER BY appointment_count DESC;

SELECT
    d.department,
    COUNT(*) AS appointment_count
FROM appointments a
JOIN doctors d
    ON a.doctor_id = d.doctor_id
GROUP BY d.department
ORDER BY appointment_count DESC;