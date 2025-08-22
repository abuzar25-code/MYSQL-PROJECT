create database a001;
use a001;

create table Patient 
( Patient_id int primary key auto_increment,
patient_Name varchar(100) not null,
Age int,
Gender enum('male','female'),
contact bigint unique,
address varchar(200));
desc patient;

insert into patient (Patient_name,Age,Gender,Contact,Address) value
("priya verma",45,"female",9933992228,"delhi,india"),
("Anya sharma",38,"female",9988556677, "mumbai, india"),
('neha agarwal',56,'female',7766445382,'chennai,india'),
('pooja reddy',41,'female',2364628734,'hyderabad,india'), 
('Emma Johnson', 47, 'Female', '5432109876', 'New York, USA'),  
('Isabella Martinez', 44, 'Female', '4321098765', 'Madrid, Spain'),  
('Sofia Rossi', 50, 'Female', '3210987654', 'Rome, Italy'),  
('Emily Watson', 39, 'Female', '2109876543', 'London, UK'),  
('Rohan Malhotra', 52, 'Male', '1098765432', 'Pune, India'),  
('Amit Desai', 60, 'Male', '9988776655', 'Ahmedabad, India'),    
('John Smith', 55, 'Male', '8877665544', 'Los Angeles, USA'),  
('Carlos Fernandez', 58, 'Male', '7766554433', 'Buenos Aires, Argentina'),  
('Meera Nair', 30, 'Female', '6655443322', 'Bangalore, India'),  
('Lily Brown', 28, 'Female', '5544332211', 'Toronto, Canada'),  
('Hana Kim', 26, 'Female', '4433221100', 'Seoul, South Korea');  

select * from patient;


create table Medical_History
( History_id int primary key auto_increment,
patient_id int,
Family_history boolean,
Previous_cancer boolean,
other_Diseases varchar(200),
constraint aa foreign key aaa (patient_id) references patient (patient_id));

desc medical_history;

insert into medical_history (patient_id,family_history,Previous_cancer,other_diseases) value 
(10, 0, 0, 'No major illness'),  
(3, 1, 1, 'Osteoporosis'),  
(7, 1, 1, 'Asthma'),  
(14, 1, 1, 'Chronic Kidney Disease'),  
(2, 0, 0, 'Thyroid Disorder'),  
(12, 0, 1, 'Lung Infection'),  
(5, 1, 1, 'High Blood Pressure'),  
(1, 1, 0, 'Diabetes, Hypertension'),  
(9, 1, 1, 'Diabetes, High Cholesterol'),  
(6, 0, 0, 'Obesity, Heart Disease'),  
(15, 0, 0, 'Migraine'),  
(8, 0, 0, 'No major illness'),  
(4, 0, 0, 'No major illness'),  
(11, 1, 0, 'Hypertension'),  
(13, 0, 0, 'Arthritis');
select * from medical_history;

create table  treatment 
( treatment_id int primary key auto_increment,
patient_id int,
diagnosis varchar(225),
treatment varchar(222),
treatment_status varchar(20),
constraint ab foreign key aab (patient_id) references patient(patient_id));
desc treatment;
insert into treatment (patient_id,treatment_id,diagnosis,treatment,treatment_status)
values
(6, 101, 'Breast Cancer Stage 4', 'Targeted Therapy', 'Ongoing'),  
(5, 102, 'Breast Cancer Stage 3', 'Surgery', 'Completed'),  
(14, 103, 'Breast Cancer Stage 3', ' Chemotherapy + Surgery ', 'Ongoing'),  
(7, 104, 'Breast Cancer Stage 2', 'Radiation Therapy', 'Completed'),  
(9, 105, 'Breast Cancer Stage 2', 'Radiation Therapy', 'Ongoing'),  
(3, 106, 'Breast Cancer Stage 1', 'Chemotherapy ', 'Completed'),  
(1, 107, 'Breast Cancer Stage 1', 'Hormone Therapy', 'Completed'),  
(2, 108, 'Fibroadenoma', 'Fluid Aspiration', 'Ongoing'),  
(10, 109, 'Benign Tumor', 'Observation and Lifestyle Changes', 'Completed'),  
(12, 110, 'Breast Cyst', 'Fluid Aspiration', 'Completed'),  
(8, 111, 'Early-Stage Breast Cancer', 'Hormone Therapy', 'Ongoing'),  
(11, 112, 'Ductal Carcinoma In Situ', 'Surgery', 'Completed'),  
(13, 113, 'Breast Fibrosis', 'Observation', 'Ongoing'),  
(4, 114, 'Lobular Carcinoma In Situ', 'Surgery + Radiation', 'Completed'),  
(15, 115, 'Inflammatory Breast Cancer', 'Chemotherapy + Surgery', 'Ongoing');
select* from treatment;


CREATE TABLE Doctor (
    Doctor_ID INT AUTO_INCREMENT PRIMARY KEY,
    Doctor_Name VARCHAR(255) NOT NULL,
    contact_no bigint,
    Experience INT,  
    Hospital VARCHAR(255),
    specialization varchar(222)
);
desc doctor;
INSERT INTO Doctor (Doctor_Name, contact_no, Experience, Hospital, specialization)  
values 
('Dr. A Sharma',9876543210, 15, 'AIIMS Delhi','Chemotherapy Specialist'),  
('Dr. B Mehta', 8765432109,12, 'Tata Memorial Hospital','Surgical Oncologist' ),  
('Dr. C Gupta',7654321098,12, 'Apollo Hospitals','Radiation Therapy Specialist'),  
('Dr. D Kapoor',6543210987,8, 'Fortis Hospital','Hormone Therapy Expert'),  
('Dr. E Singh',5432109876,20, 'Max Healthcare','Targeted Therapy Specialist'),  
('Dr. F Patel',4321098765,14, 'Kokilaben Hospital','General Oncologist');
desc doctor;
select * from doctor;

select * from treatment;

CREATE TABLE Hospital (
    Hospital_ID INT PRIMARY KEY AUTO_INCREMENT,
    Hospital_Name VARCHAR(255) ,
    Location VARCHAR(255) ,
    Contact_Number bigint unique 
);
INSERT INTO Hospital (Hospital_Name, Location, Contact_Number)  
VALUES  
('Apollo Cancer Institute', 'New Delhi, India', 9876543210),  
('Tata Memorial Hospital', 'Mumbai, India', 8765432109),  
('AIIMS Oncology Center', 'Chennai, India', 7654321098),  
('Fortis Cancer Care', 'Bangalore, India', 7543210987),  
('Medanta Cancer Institute', 'Hyderabad, India', 7432109876),
('gandhi cancer care ','kerala,india',3466477838);
select * from hospital;
select * from doctor;
select * from patient;

CREATE TABLE Records (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Patient_ID INT,
    Hospital_ID INT,
    Doctor_ID INT,
    CONSTRAINT ae  FOREIGN KEY aae (Patient_ID) REFERENCES Patient(Patient_ID),
    CONSTRAINT af FOREIGN KEY aaf (Hospital_ID) REFERENCES Hospital(Hospital_ID),
    CONSTRAINT ag FOREIGN KEY aag (Doctor_ID) REFERENCES Doctor(Doctor_ID)
);
desc records;
truncate table records;
select * from records;
INSERT INTO Records (Patient_ID, Doctor_ID, Hospital_ID) VALUES
(1, 4, 5),
(2, 6, 4),
(3, 1, 3),
(4, 2, 4),
(5, 2, 3),
(6, 5, 2),
(7, 3, 1),
(8, 4, 1),
(9, 3, 5),
(10, 6, 2),
(11, 2, 2),
(12, 6, 3),
(13, 6, 3),
(14,1,4),
(15,1,4),
(2,6,1),
(4,2,1);
select d.doctor_name,p.patient_name,h.hospital_name,other_diseases,p.patient_id from patient p
join records r on r.patient_id=p.patient_id
join doctor d on d.doctor_id = r.doctor_id
join hospital h on h.hospital_id= r.hospital_id
join medical_history mh on mh.patient_id= p.patient_id
where p.patient_id=8;

select * from medical_history;

SELECT p.Patient_Name, COUNT(DISTINCT r.Hospital_ID) AS Total_Hospitals
FROM Patient p
JOIN Records r ON p.Patient_ID = r.Patient_ID
GROUP BY p.Patient_ID
HAVING COUNT(DISTINCT r.Hospital_ID) > 1;

SELECT h.Hospital_Name, p.Patient_Name
FROM Hospital h
RIGHT JOIN Records r ON h.Hospital_ID = r.Hospital_ID
RIGHT JOIN Patient p ON r.Patient_ID = p.Patient_ID;

SELECT h.Hospital_Name, COUNT(r.Patient_ID) AS Total_Patients
FROM Hospital h
LEFT JOIN Records r ON h.Hospital_ID = r.Hospital_ID
GROUP BY h.Hospital_Name;

desc hospital;
SELECT distinct d1.Doctor_Name AS Doctor1, d2.Doctor_Name AS Doctor2, h.Hospital_Name
FROM Records r1
JOIN Records r2 ON r1.Hospital_ID = r2.Hospital_ID AND r1.Doctor_ID < r2.Doctor_ID
JOIN Doctor d1 ON r1.Doctor_ID = d1.Doctor_ID
JOIN Doctor d2 ON r2.Doctor_ID = d2.Doctor_ID
JOIN Hospital h ON r1.Hospital_ID = h.Hospital_ID;

SELECT DISTINCT 
    LEAST(d1.Doctor_Name, d2.Doctor_Name) AS Doctor1, 
    GREATEST(d1.Doctor_Name, d2.Doctor_Name) AS Doctor2, 
    h.Hospital_Name
FROM Records r1
JOIN Records r2 ON r1.Hospital_ID = r2.Hospital_ID AND r1.Doctor_ID < r2.Doctor_ID
JOIN Doctor d1 ON r1.Doctor_ID = d1.Doctor_ID  -- Ensure correct reference
JOIN Doctor d2 ON r2.Doctor_ID = d2.Doctor_ID  -- Ensure correct reference
JOIN Hospital h ON r1.Hospital_ID = h.Hospital_ID;


SELECT Patient_ID, Patient_Name, Address 
FROM Patient 
WHERE Patient_ID IN (
    SELECT Patient_ID FROM Patient WHERE Address NOT LIKE '%India%'
);


