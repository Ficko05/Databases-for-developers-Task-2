insert into mydb.person(name, phonenumber, cprnumber, address, email) values
    ('Filip Filipovic','12312312', '021295-1234','lundebjerg 43 1b', 'test123@gmail.com'),
    ('Ender Hansen','56756756', '031298-5678','ballerup 123', 'test1234@gmail.com'),
    ('nur Hansen','89089089', '121212-5678','Herlev 123', 'test12345@gmail.com'),
    ('Peter Hansen','89089089', '121212-5678','Herlev 123', 'test12345@gmail.com'),
    ('Albtert Hansen','89089089', '121212-5678','Herlev 123', 'test12345@gmail.com'),
    ('Kimon Hansen','89089089', '121212-5678','Herlev 123', 'test12345@gmail.com'),
    ('Jonas Hansen','89089089', '121212-5678','Herlev 123', 'test12345@gmail.com'),
    ('Steven Hansen','89089089', '121212-5678','Herlev 123', 'test12345@gmail.com'),
    ('Thomas Hansen','89089089', '121212-5678','Herlev 123', 'test12345@gmail.com');

insert into mydb.doctor(name) VALUES
    ('docName'),
    ('docName2'),
    ('docName3'),
    ('docName4'),
    ('docName5'),
    ('docName6'),
    ('docName7');

insert into mydb.prescriptions(medication_name, start_date, end_date, reminder_date, quantity_current, quanitty_end, doctor_iddoctor) VALUES
    ('Pfizer','2022-01-01','2022-02-01',CURRENT_DATE,5,5,1),
    ('Pills','2022-01-01','2022-02-01',CURRENT_DATE,5,5,1),
    ('Nova','2022-01-01','2022-02-01',CURRENT_DATE,5,5,1),
    ('Eye Drops','2022-01-01','2022-02-01',CURRENT_DATE,5,5,1),
    ('Pfizer2','2022-01-01','2022-02-01',CURRENT_DATE,5,5,1),
    ('Leo','2022-01-01','2022-02-01',CURRENT_DATE,5,5,1);





