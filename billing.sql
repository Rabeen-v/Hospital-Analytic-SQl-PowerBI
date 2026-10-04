use Hospital_analytic;

CREATE TABLE billing (
    bill_id INT PRIMARY KEY,
    patient_id INT,
    admission_id INT,
    treatment_cost DECIMAL(10,2),
    medicine_cost DECIMAL(10,2),
    room_cost DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    payment_status VARCHAR(30),
    payment_date DATE,

    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (admission_id) REFERENCES admissions(admission_id)
);


INSERT INTO billing
VALUES
(3001, 1, 2001, 45000, 8000, 15000, 68000, 'Paid', '2026-01-10'),
(3002, 2, 2002, 25000, 5000, 9000, 39000, 'Paid', '2026-01-11'),
(3003, 3, 2003, 18000, 3000, 5000, 26000, 'Paid', '2026-01-15'),
(3004, 5, 2004, 10000, 2500, 3000, 15500, 'Paid', '2026-01-18'),
(3005, 6, 2005, 30000, 6000, 12000, 48000, 'Pending', NULL),
(3006, 7, 2006, 55000, 10000, 18000, 83000, 'Paid', '2026-01-30'),
(3007, 9, 2007, 22000, 4500, 6000, 32500, 'Pending', NULL),
(3008, 10, 2008, 16000, 3500, 8000, 27500, 'Paid', '2026-02-02');

select* from billing where payment_date is null;

SELECT SUM(total_amount) AS total_revenue
FROM billing;

SELECT AVG(total_amount) AS average_bill
FROM billing;

SELECT MAX(total_amount) AS highest_bill
FROM billing;

SELECT MIN(total_amount) AS lowest_bill
FROM billing;

SELECT SUM(total_amount) AS paid_amount
FROM billing
WHERE payment_status = 'Paid';

SELECT SUM(total_amount) AS pending_amount
FROM billing
WHERE payment_status = 'Pending';

SELECT
    payment_status,
    COUNT(*) AS bill_count
FROM billing
GROUP BY payment_status;

SELECT *
FROM billing
WHERE total_amount >
(
    SELECT AVG(total_amount)
    FROM billing
);