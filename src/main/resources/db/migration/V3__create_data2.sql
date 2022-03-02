insert into mydb.patient(prescriptions_idprescriptions, person_idperson)
values (1, 1),
       (2, 1),
       (3, 3),
       (4, 3);


insert into mydb.patient_has_doctor(patient_idpatient, doctor_iddoctor)
VALUES (1, 1),
       (2, 1),
       (3, 2);

insert into mydb.patient_journal(last_accessed_by, patient_idpatient)
VALUES ('Morten', 2);

insert into mydb.pharmacies(name, address)
VALUES ('pharmacies Herlev', '2730');

insert into mydb.pharmacies_inventory(medication_name, stock, idpharmacies)
VALUES ('Pfizer', 77, 1),
       ('Leo', 5, 1);

insert into mydb.pharmacies_has_patient(pharmacies_idpharmacies, patient_idpatient) VALUES
    (1,1),
    (1,2),
    (1,3);

insert into mydb.role(admin, patient, doctor, patient_idpatient, doctor_iddoctor) VALUES
    (false,true,false,1,null),
    (false,true,false,2,null),
    (false,false,true,null,1),
    (false,false,true,null,2);

insert into mydb.notification_logging(date_reminder, patient_idpatient, prescriptions_idprescriptions, pharmacies_idpharmacies) VALUES
    (CURRENT_DATE,1,1,1),
    (CURRENT_DATE,2,1,1),
    (CURRENT_DATE,3,1,1);