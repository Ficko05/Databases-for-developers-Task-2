insert into patient(prescriptions_idprescriptions, person_idperson) values
                                                                        (1,1),
                                                                        (2,2),
                                                                        (3,3);

insert into patient_has_doctor(patient_idpatient, doctor_iddoctor) VALUES
                                                                       (5,1),
                                                                       (2,1),
                                                                       (1,2);

insert into patient_journal(last_accessed_by, patient_idpatient) VALUES
    ('Morten',2);

insert into pharmacies(name, address) VALUES
    ('pharmacies Herlev','2730');

insert into pharmacies_inventory(medication_name, stock, idpharmacies) VALUES
                                                                           ('Pfizer',77,1),
                                                                           ('Leo', 5,1);
