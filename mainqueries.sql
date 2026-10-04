use Hospital_analytic;

SELECT
    d.doctor_name,
    COUNT(a.appointment_id) AS appointments,
    RANK() OVER (
        ORDER BY COUNT(a.appointment_id) DESC
    ) AS doctor_rank
FROM doctors d
LEFT JOIN appointments a
    ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.doctor_name;

SELECT
    d.department,
    SUM(b.total_amount) AS total_revenue
FROM billing b
JOIN admissions a
    ON b.admission_id = a.admission_id
JOIN doctors d
    ON a.doctor_id = d.doctor_id
GROUP BY d.department
ORDER BY total_revenue DESC;

SELECT
    p.patient_name,
    b.total_amount,
    b.payment_status
FROM patients p
JOIN billing b
    ON p.patient_id = b.patient_id
WHERE b.payment_status = 'Pending';

SELECT
    patient_id,
    treatment_cost
FROM billing
ORDER BY treatment_cost DESC
LIMIT 1;


CREATE VIEW hospital_summary AS
SELECT p.patient_id,
       p.patient_name,
       p.gender,
       p.city,
       d.doctor_name,
       d.department,
       a.diagnosis,
       a.admission_date,
       a.discharge_date,
       b.total_amount,
       b.payment_status
FROM patients p
JOIN admissions a ON p.patient_id = a.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
JOIN billing b ON a.admission_id = b.admission_id;


select * from hospital_summary