CREATE VIEW vw_patient_health_record AS
SELECT p.patient_id, p.name AS patient_name, p.address AS patient_address, p.phone_number AS patient_phone,
       hr.record_id, hr.disease, hr.date, hr.status,
       ph.name AS primary_physician
FROM patient p
LEFT JOIN health_records hr ON p.patient_id = hr.patient_num
LEFT JOIN physician ph ON p.primary_physician = ph.doctor_id;

CREATE VIEW vw_patient_room_details AS
SELECT p.patient_id, p.name AS patient_name, p.address AS patient_address, p.phone_number AS patient_phone,
       ar.room_num, ar.duration
FROM patient p
JOIN assigned_room ar ON p.patient_id = ar.patient;

CREATE VIEW vw_medication_administration AS
SELECT m.medicine_name, m.receiving_patient, p.name AS patient_name, 
       m.admin_nurse, n.name AS nurse_name, m.amount,
       r.room_num
FROM medication m
JOIN patient p ON m.receiving_patient = p.patient_id
JOIN nurse n ON m.admin_nurse = n.nurse_id
LEFT JOIN assigned_room r ON p.patient_id = r.patient;



SELECT p.name AS patient_name, ar.room_num, ph.name AS primary_physician
FROM assigned_room ar JOIN patient p ON ar.patient = p.patient_id
JOIN physician ph ON p.primary_physician = ph.doctor_id;

SELECT n.name AS nurse_name, COUNT(*) AS total_medications_administered
FROM medication m
JOIN nurse n ON m.admin_nurse = n.nurse_id
GROUP BY n.name;

SELECT p.name AS patient_name, SUM(i.fee) AS total_amount_billed, ph.field_of_expertise
FROM instruction i
JOIN patient p ON i.specific_patient = p.patient_id
JOIN physician ph ON p.primary_physician = ph.doctor_id
GROUP BY p.name, ph.field_of_expertise;



SELECT AVG(fee) AS average_fee_per_instruction
FROM instruction;

SELECT ph.field_of_expertise, SUM(i.fee) AS total_fee_billed
FROM physician ph
JOIN patient p ON ph.doctor_id = p.primary_physician
JOIN instruction i ON p.patient_id = i.specific_patient
GROUP BY ph.field_of_expertise;



SELECT ar.room_num, AVG(ar.duration) AS average_duration
FROM assigned_room ar
GROUP BY ar.room_num;




SELECT hr.record_id, hr.disease, hr.date, hr.status
FROM health_records hr
WHERE hr.patient_num IN (
SELECT p.patient_id
FROM patient p
JOIN physician ph ON p.primary_physician = ph.doctor_id
WHERE ph.field_of_expertise = 'Cardiology'
);

SELECT p.name AS patient_name
FROM patient p
WHERE p.patient_id IN (
    SELECT DISTINCT ar.patient
    FROM assigned_room ar
    WHERE ar.patient NOT IN (
        SELECT hr.patient_num
        FROM health_records hr
        WHERE hr.status = 'Resolved' OR hr.status = 'Recovered'
    )
);

SELECT name AS patient_name,
       (SELECT name FROM physician WHERE doctor_id = patient.primary_physician) AS primary_physician
FROM patient;



SELECT n.name AS nurse_name, sum(m.amount) AS medications_administered
FROM nurse n
LEFT JOIN medication m ON n.nurse_id = m.admin_nurse
GROUP BY n.name
ORDER BY medications_administered DESC;

SELECT p.name AS patient_name, ph.name AS primary_physician, SUM(i.fee) AS total_fee_billed
FROM patient p
JOIN physician ph ON p.primary_physician = ph.doctor_id
JOIN instruction i ON p.patient_id = i.specific_patient
GROUP BY p.name, ph.name;


SELECT p.name AS patient_name, ph.name AS primary_physician,
       COUNT(i.instruction_code) AS total_instructions
FROM patient p
JOIN physician ph ON p.primary_physician = ph.doctor_id
LEFT JOIN instruction i ON p.patient_id = i.specific_patient
GROUP BY p.name, ph.name
ORDER BY total_instructions DESC;


SELECT p.name AS patient_name, ar.room_num, ar.duration,
       hr.disease, hr.date, hr.status
FROM patient p
LEFT JOIN assigned_room ar ON p.patient_id = ar.patient
LEFT JOIN (
    SELECT h1.*
    FROM health_records h1
    WHERE h1.date = (
        SELECT MAX(h2.date)
        FROM health_records h2
        WHERE h2.patient_num = h1.patient_num
    )
) hr ON p.patient_id = hr.patient_num;


SELECT ar.room_num, SUM(i.fee) AS total_fee_billed
FROM assigned_room ar
LEFT JOIN patient p ON ar.patient = p.patient_id
LEFT JOIN instruction i ON p.patient_id = i.specific_patient
GROUP BY ar.room_num
ORDER BY total_fee_billed DESC;

SELECT n.name AS nurse_name, p.name AS patient_name, COUNT(i.instruction_code) AS total_instructions
FROM nurse n
JOIN instruction i ON n.nurse_id = i.assigned_nurse
JOIN patient p ON i.specific_patient = p.patient_id
GROUP BY n.name, p.name
ORDER BY n.name, total_instructions DESC;

