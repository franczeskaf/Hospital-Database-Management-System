



INSERT INTO room (room_number, nightly_fee, capacity) VALUES ('101A', 150, 2);
INSERT INTO room (room_number, nightly_fee, capacity) VALUES ('102B', 200, 3);
INSERT INTO room (room_number, nightly_fee, capacity) VALUES ('103C', 175, 2);
INSERT INTO room (room_number, nightly_fee, capacity) VALUES ('104D', 250, 4);
INSERT INTO room (room_number, nightly_fee, capacity) VALUES ('105E', 225, 3);

INSERT INTO physician (doctor_id, name, certification_number, address, field_of_expertise, phone_number) 
VALUES ('D001', 'Dr. Alice Johnson', 'C1234567', '123 Health St, Medicity, TX', 'Cardiology', '5551234567');

INSERT INTO physician (doctor_id, name, certification_number, address, field_of_expertise, phone_number) 
VALUES ('D002', 'Dr. Bob Smith', 'C2345678', '456 Wellness Ave, Healville, CA', 'Neurology', '5552345678');

INSERT INTO physician (doctor_id, name, certification_number, address, field_of_expertise, phone_number) 
VALUES ('D003', 'Dr. Carol Williams', 'C3456789', '789 Care Blvd, Curetown, NY', 'Pediatrics', '5553456789');

INSERT INTO physician (doctor_id, name, certification_number, address, field_of_expertise, phone_number) 
VALUES ('D004', 'Dr. David Brown', 'C4567890', '321 Recovery Rd, Treatville, FL', 'Orthopedics', '5554567890');

INSERT INTO physician (doctor_id, name, certification_number, address, field_of_expertise, phone_number) 
VALUES ('D005', 'Dr. Emily Davis', 'C5678901', '654 Therapy Ln, Mendentown, IL', 'Dermatology', '5555678901');



INSERT INTO nurse (nurse_id, name, cert_number, phone_number, address) 
VALUES ('N001', 'Nurse Olivia Green', 'NC123456', '5556789012', '101 Care St, Healville, CA');

INSERT INTO nurse (nurse_id, name, cert_number, phone_number, address) 
VALUES ('N002', 'Nurse Liam White', 'NC234567', '5557890123', '202 Wellness Ave, Medicity, TX');

INSERT INTO nurse (nurse_id, name, cert_number, phone_number, address) 
VALUES ('N003', 'Nurse Emma Black', 'NC345678', '5558901234', '303 Therapy Blvd, Curetown, NY');

INSERT INTO nurse (nurse_id, name, cert_number, phone_number, address) 
VALUES ('N004', 'Nurse Noah Brown', 'NC456789', '5559012345', '404 Recovery Rd, Treatville, FL');

INSERT INTO nurse (nurse_id, name, cert_number, phone_number, address) 
VALUES ('N005', 'Nurse Ava Blue', 'NC567890', '5550123456', '505 Health Ln, Mendentown, IL');



INSERT INTO patient (patient_id, name, address, phone_number, primary_physician, room)
VALUES ('P001', 'John Doe', '123 Main St, Healville, CA', '5551112222', 'D001', '101A');

INSERT INTO patient (patient_id, name, address, phone_number, primary_physician, room)
VALUES ('P002', 'Jane Smith', '456 Elm St, Medicity, TX', '5553334444', 'D002', '102B');

INSERT INTO patient (patient_id, name, address, phone_number, primary_physician, room)
VALUES ('P003', 'Michael Johnson', '789 Oak St, Curetown, NY', '5555556666', 'D003', '103C');

INSERT INTO patient (patient_id, name, address, phone_number, primary_physician, room)
VALUES ('P004', 'Sarah Brown', '321 Pine St, Treatville, FL', '5557778888', 'D004', '104D');

INSERT INTO patient (patient_id, name, address, phone_number, primary_physician, room)
VALUES ('P005', 'Emily Davis', '654 Maple St, Mendentown, IL', '5559990000', 'D005', '105E');


INSERT INTO invoice (amount, responsible_patient)
VALUES (150, 'P001');

INSERT INTO invoice (amount, responsible_patient)
VALUES (200, 'P002');

INSERT INTO invoice (amount, responsible_patient)
VALUES (175, 'P003');

INSERT INTO invoice (amount, responsible_patient)
VALUES (250, 'P004');

INSERT INTO invoice (amount, responsible_patient)
VALUES (225, 'P005');


INSERT INTO instruction (specific_patient, instruction_date, instruction_code, execution_results, fee, description, assigned_nurse, responsible_physician)
VALUES ('P001', '2024-06-19', 'INS001', 'Successful execution', 150, 'Administer medication', 'N001', 'D001');

INSERT INTO instruction (specific_patient, instruction_date, instruction_code, execution_results, fee, description, assigned_nurse, responsible_physician)
VALUES ('P002', '2024-06-19', 'INS002', 'Patient responded well', 200, 'Perform MRI scan', 'N002', 'D002');

INSERT INTO instruction (specific_patient, instruction_date, instruction_code, execution_results, fee, description, assigned_nurse, responsible_physician)
VALUES ('P003', '2024-06-18', 'INS003', 'Follow-up scheduled', 175, 'Check vitals', 'N003', 'D003');

INSERT INTO instruction (specific_patient, instruction_date, instruction_code, execution_results, fee, description, assigned_nurse, responsible_physician)
VALUES ('P004', '2024-06-18', 'INS004', 'Procedure completed', 250, 'Perform surgery', 'N004', 'D004');

INSERT INTO instruction (specific_patient, instruction_date, instruction_code, execution_results, fee, description, assigned_nurse, responsible_physician)
VALUES ('P005', '2024-06-17', 'INS005', 'Patient discharged', 225, 'Provide wound care', 'N005', 'D005');


INSERT INTO medicine (name) VALUES ('Paracetamol');
INSERT INTO medicine (name) VALUES ('Amoxicillin');
INSERT INTO medicine (name) VALUES ('Lisinopril');
INSERT INTO medicine (name) VALUES ('Atorvastatin');
INSERT INTO medicine (name) VALUES ('Metformin');

INSERT INTO medication (medicine_name, receiving_patient, admin_nurse, amount)
VALUES ('Paracetamol', 'P001', 'N001', '1 pill');

INSERT INTO medication (medicine_name, receiving_patient, admin_nurse, amount)
VALUES ('Amoxicillin', 'P002', 'N002', '500 mg');

INSERT INTO medication (medicine_name, receiving_patient, admin_nurse, amount)
VALUES ('Lisinopril', 'P003', 'N003', '10 mg');

INSERT INTO medication (medicine_name, receiving_patient, admin_nurse, amount)
VALUES ('Atorvastatin', 'P004', 'N004', '20 mg');

INSERT INTO medication (medicine_name, receiving_patient, admin_nurse, amount)
VALUES ('Metformin', 'P005', 'N005', '1000 mg');


INSERT INTO health_records (record_id, disease, date, status, patient_num, description)
VALUES ('HR001', 'Influenza', '2024-01-15', 'Recovered', 'P001', 'Patient had mild symptoms.');

INSERT INTO health_records (record_id, disease, date, status, patient_num, description)
VALUES ('HR002', 'Fractured Arm', '2023-11-10', 'Healing', 'P002', 'Patient underwent surgery.');

INSERT INTO health_records (record_id, disease, date, status, patient_num, description)
VALUES ('HR003', 'Allergic Rhinitis', '2024-03-20', 'Under Treatment', 'P003', 'Patient prescribed antihistamines.');

INSERT INTO health_records (record_id, disease, date, status, patient_num, description)
VALUES ('HR004', 'Diabetes Type 2', '2024-02-05', 'Managed', 'P004', 'Patient monitoring blood sugar levels.');

INSERT INTO health_records (record_id, disease, date, status, patient_num, description)
VALUES ('HR005', 'Skin Rash', '2024-04-15', 'Resolved', 'P005', 'Patient treated with topical cream.');


INSERT INTO assigned_room VALUES ('P001', '101A', 5);

INSERT INTO assigned_room VALUES ('P002', '102B', 3);

INSERT INTO assigned_room VALUES ('P003', '103C', 7);

INSERT INTO assigned_room VALUES ('P004', '104D', 4);

INSERT INTO assigned_room VALUES ('P005', '105E', 2);