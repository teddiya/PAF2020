CREATE DATABASE apidb;

USE apidb;

CREATE TABLE doctor (
    doctor_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    doctor_license_no VARCHAR(255),
    doctor_name VARCHAR(255),
    doctor_address VARCHAR(255),
    doctor_phone VARCHAR(20),
    doctor_gender VARCHAR(10),
    doctor_email VARCHAR(255),
    doctor_specialization VARCHAR(255)
);


CREATE TABLE doctor_logins (
    doctor_id INT,
    doctor_username VARCHAR(255) PRIMARY KEY,
    doctor_password VARCHAR(40),
    doctor_last_login DATETIME,
    docotor_session VARCHAR(40),
    FOREIGN KEY(doctor_id) REFERENCES doctor(doctor_id)
);

CREATE TABLE doctor_schedule (
    schedule_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    schedule_date DATE,
    doctor_id INT,
    time_slot VARCHAR(255)
);

CREATE TABLE patient (
    patient_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    patient_name VARCHAR(255),
    patient_age SMALLINT
);

CREATE TABLE appointment (
    appoint_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    patient_id INT, 
    appoint_date DATE,
    appoint_time TIME,
    appoint_status VARCHAR(20),
    doctor_id INT,
    FOREIGN KEY(patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY(doctor_id) REFERENCES doctor(doctor_id)
);

CREATE TABLE prescription (
    pres_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    patient_id INT,
    pres_date DATE,
    pres_time TIME,
    descript TEXT,
    doctor_id INT,
    appoint_id INT,
    FOREIGN KEY(patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY(doctor_id) REFERENCES doctor(doctor_id),
    FOREIGN KEY(appoint_id) REFERENCES appointment(appoint_id)
);

INSERT INTO doctor (doctor_license_no, doctor_name, doctor_address, doctor_phone, doctor_gender, doctor_email, doctor_specialization)
VALUES ('GMOA1', 'Dr.P.R.Nimeshika', 'Colombo', '0777123456', 'female','nimeshika@gmail.com', 'eye specialists'),
       ('GMOA2', 'Dr.P.G.Jehani', 'Piliyandala', '0711234569', 'female','jehani@gmail.com', 'cardiologists'),
       ('GMOA3', 'Dr.R.M.pavithra', 'Homagama', '0787234569', 'male','nuwanthika@gmail.com', 'Psychiatrist'),
       ('GMOA4', 'Dr.S.L.Kamal', 'Baththaramulla', '0787234569', 'male','nuwanthika@gmail.com', 'Dermatologist');


INSERT INTO doctor_logins(doctor_id, doctor_username, doctor_password, doctor_last_login, docotor_session) 
VALUES ('1', 'nimeshika', sha1('abc123'), NOW(), ''),
       ('2', 'jehani', sha1('abc124'), NOW(), ''),
       ('3', 'pavithra', sha1('abc125'), NOW(), ''),
       ('4', 'kamal', sha1('abc126'), NOW(), '');


INSERT INTO doctor_schedule (schedule_date, doctor_id, time_slot)
VALUES (CURRENT_DATE(), '1', '1600-1700'),
       (CURRENT_DATE(), '3', '2000-2200'),
       (CURRENT_DATE(), '2', '1000-1200'),
       (CURRENT_DATE(), '4', '1000-1200');


INSERT INTO patient (patient_name, patient_age)
VALUES ('Isira', 28),
       ('Kasun', 23),
       ('Dasun', 12),
       ('Amila', 18);

INSERT INTO appointment (patient_id, appoint_date, appoint_time, appoint_status, doctor_id)
VALUES ('1', CURRENT_DATE(), CURTIME(), 'pending', '1'),
       ('2', CURRENT_DATE(), '20:00:00', 'Accept', '2'),
       ('2', CURRENT_DATE(), '10:00:00', 'Cancel', '2');

INSERT INTO prescription (patient_id, pres_date, pres_time, descript, doctor_id, appoint_id)
VALUES  ('1', CURRENT_DATE(), CURTIME(), 'check', '1', '1'),
        ('2', CURRENT_DATE(), CURTIME(), 'give prescription', '2', '2');
