drop database hospital;
create database hospital;
show databases;
use hospital;

create table room (
room_number varchar(5),
nightly_fee int,
capacity int,
primary key(room_number)
);

create table physician (
doctor_id varchar(8),
name varchar(255),
certification_number varchar(8),
address varchar(255),
field_of_expertise varchar(255),
phone_number varchar(10),
primary key(doctor_id)
);

create table nurse (
nurse_id varchar(8),
name varchar(255),
cert_number varchar(8),
phone_number varchar(10),
address varchar(255),
primary key (nurse_id)
);

create table patient (
patient_id varchar(16),
name varchar(255),
address varchar(255),
phone_number varchar(10),
primary_physician varchar(8),
room varchar(5),
primary key(patient_id),
foreign key (primary_physician) references physician(doctor_id)
);


create table instruction (
specific_patient varchar(16),
instruction_date DATE,
instruction_code varchar(32),
execution_results varchar(255),
fee int,
description varchar(255),
assigned_nurse varchar(8),
responsible_physician varchar(8),
primary key(instruction_code),
foreign key (specific_patient) references patient(patient_id),
foreign key (assigned_nurse) references nurse(nurse_id),
foreign key (responsible_physician) references physician(doctor_id)
);

create table medicine (
name varchar(255),
primary key(name)
);

create table medication (
medicine_name varchar(255),
receiving_patient varchar(16),
admin_nurse varchar(8),
amount varchar(8),
primary key(medicine_name, receiving_patient),
foreign key (medicine_name) references medicine(name),
foreign key (receiving_patient) references patient(patient_id),
foreign key (admin_nurse) references nurse(nurse_id)
);

create table health_records (
record_id varchar(16),
disease varchar(255),
date date,
status varchar(255),
patient_num varchar(16),
description varchar(255),
primary key (record_id),
foreign key (patient_num) references patient(patient_id)
);

create table invoice (
amount int,
responsible_patient varchar(16),
primary key(responsible_patient),
foreign key (responsible_patient) references patient(patient_id)
);

create table payment (
amount int,
payment_date DATE,
patient_paying varchar(16),
foreign key(patient_paying) references patient(patient_id)
);

create table assigned_room (
patient varchar(16),
room_num varchar(5),
duration int,
foreign key(patient) references patient(patient_id),
foreign key(room_num) references room(room_number)
);

delimiter //
create trigger update_invoice_instruction after insert on instruction
for each row
begin
update invoice set amount = amount + new.fee where responsible_patient like new.specific_patient;
end;
//

delimiter ;


delimiter //
create trigger update_invoice_roomstay after insert on assigned_room
for each row begin
update invoice set amount = amount + ((select nightly_fee from room where room_number like new.room_num) * new.duration)
where responsible_patient like new.patient;
end;
//

delimiter ;

delimiter //
create trigger update_invoice_payment after insert on payment
for each row begin
update invoice set invoice.amount = invoice.amount - new.amount where responsible_patient like new.patient_paying;
end;
//
delimiter ;



