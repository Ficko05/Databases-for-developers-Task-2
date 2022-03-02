CREATE SCHEMA IF NOT EXISTS mydb;
-- -----------------------------------------------------
-- Table `mydb`.`Person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Person
(
    idPerson    SERIAL      NOT NULL,
    name        VARCHAR(45) NOT NULL,
    phoneNumber VARCHAR(45) NOT NULL,
    cprNumber   VARCHAR(45) NOT NULL,
    address     VARCHAR(45) NULL,
    email       VARCHAR(45) NULL,
    PRIMARY KEY (idPerson)
);



-- -----------------------------------------------------
-- Table `mydb`.`Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Doctor
(
    idDoctor SERIAL      NOT NULL,
    name     VARCHAR(45) NOT NULL,
    PRIMARY KEY (idDoctor)
);



-- -----------------------------------------------------
-- Table `mydb`.`Prescriptions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Prescriptions
(
    idPrescriptions  SERIAL      NOT NULL,
    medication_name  VARCHAR(45) NOT NULL,
    start_Date       DATE        NOT NULL DEFAULT CURRENT_DATE,
    end_Date         DATE        NOT NULL DEFAULT CURRENT_DATE,
    reminder_Date    DATE        NULL     DEFAULT CURRENT_DATE,
    quantity_current INT         NOT NULL,
    quanitty_end     INT         NOT NULL,
    Doctor_idDoctor  INT         NOT NULL,
    PRIMARY KEY (idPrescriptions),
    CONSTRAINT fk_Prescriptions_Doctor1
        FOREIGN KEY (Doctor_idDoctor)
            REFERENCES mydb.Doctor (idDoctor)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);



-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Patient
(
    idPatient                     SERIAL NOT NULL,
    Prescriptions_idPrescriptions INT    NOT NULL,
    Person_idPerson               INT    NOT NULL,
    PRIMARY KEY (idPatient),
    CONSTRAINT fk_Patient_Prescriptions1
        FOREIGN KEY (Prescriptions_idPrescriptions)
            REFERENCES mydb.Prescriptions (idPrescriptions)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT fk_Patient_Person1
        FOREIGN KEY (Person_idPerson)
            REFERENCES mydb.Person (idPerson)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);


-- -----------------------------------------------------
-- Table `mydb`.`Pharmacies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Pharmacies
(
    idPharmacies SERIAL      NOT NULL,
    name         VARCHAR(45) NOT NULL,
    address      VARCHAR(45) NOT NULL,
--     idPharmacies_Inventory INT         NOT NULL,
    PRIMARY KEY (idPharmacies)
);
--     CONSTRAINT fk_Pharmacies_Pharmacies_Inventory1
--     FOREIGN KEY (idPharmacies_Inventory)
--     REFERENCES mydb.Pharmacies_Inventory (idPharmacies_Inventory)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `mydb`.`Pharmacies_Inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Pharmacies_Inventory
(
    idPharmacies_Inventory SERIAL      NOT NULL,
    medication_name        VARCHAR(45) NULL,
    stock                  VARCHAR(45) NULL,
    idPharmacies           INT         NOT NULL,
    PRIMARY KEY (idPharmacies_Inventory),
    CONSTRAINT fk_Pharmacies
        FOREIGN KEY (idPharmacies)
            REFERENCES mydb.Pharmacies (idPharmacies)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);


-- -----------------------------------------------------
-- Table `mydb`.`Patient_Journal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Patient_Journal
(
    idPatient_Journal SERIAL      NOT NULL,
    Last_Accessed_By  VARCHAR(45) NULL,
    Patient_idPatient INT         NOT NULL,
    PRIMARY KEY (idPatient_Journal),

    CONSTRAINT fk_Patient_Journal_Patient1
        FOREIGN KEY (Patient_idPatient)
            REFERENCES mydb.Patient (idPatient)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);



-- -----------------------------------------------------
-- Table `mydb`.`Notification_Logging`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Notification_Logging
(
    idnotification_Logging        SERIAL NOT NULL,
    date_reminder                 DATE   NOT NULL,
    Patient_idPatient             INT    NOT NULL,
    Prescriptions_idPrescriptions INT    NOT NULL,
    Pharmacies_idPharmacies       INT    NOT NULL,
    PRIMARY KEY (idnotification_Logging),
    CONSTRAINT fk_Notification_Logging_Patient1
        FOREIGN KEY (Patient_idPatient)
            REFERENCES mydb.Patient (idPatient)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT fk_Notification_Logging_Prescriptions1
        FOREIGN KEY (Prescriptions_idPrescriptions)
            REFERENCES mydb.Prescriptions (idPrescriptions)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT fk_Notification_Logging_Pharmacies1
        FOREIGN KEY (Pharmacies_idPharmacies)
            REFERENCES mydb.Pharmacies (idPharmacies)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);


-- -----------------------------------------------------
-- Table `mydb`.`Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Role
(
    idrole            SERIAL NOT NULL,
    Admin             bool   NULL,
    patient           bool   NULL,
    doctor            bool   NULL,
    Patient_idPatient INT    NULL,
    Doctor_idDoctor   INT    NULL,
    PRIMARY KEY (idrole),
    CONSTRAINT fk_Role_Patient1
        FOREIGN KEY (Patient_idPatient)
            REFERENCES mydb.Patient (idPatient)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT fk_Role_Doctor1
        FOREIGN KEY (Doctor_idDoctor)
            REFERENCES mydb.Doctor (idDoctor)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);



-- -----------------------------------------------------
-- Table `mydb`.`Pharmacies_has_Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Pharmacies_has_Patient
(
    Pharmacies_idPharmacies SERIAL NOT NULL,
    Patient_idPatient       INT    NOT NULL,
    PRIMARY KEY (Pharmacies_idPharmacies, Patient_idPatient),
    CONSTRAINT fk_Pharmacies_has_Patient_Pharmacies1
        FOREIGN KEY (Pharmacies_idPharmacies)
            REFERENCES mydb.Pharmacies (idPharmacies)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT fk_Pharmacies_has_Patient_Patient1
        FOREIGN KEY (Patient_idPatient)
            REFERENCES mydb.Patient (idPatient)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);



-- -----------------------------------------------------
-- Table `mydb`.`Patient_has_Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Patient_has_Doctor
(
    Patient_idPatient SERIAL NOT NULL,
    Doctor_idDoctor   INT    NOT NULL,
    PRIMARY KEY (Patient_idPatient, Doctor_idDoctor),

    CONSTRAINT fk_Patient_has_Doctor_Patient1
        FOREIGN KEY (Patient_idPatient)
            REFERENCES mydb.Patient (idPatient)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT fk_Patient_has_Doctor_Doctor1
        FOREIGN KEY (Doctor_idDoctor)
            REFERENCES mydb.Doctor (idDoctor)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);


