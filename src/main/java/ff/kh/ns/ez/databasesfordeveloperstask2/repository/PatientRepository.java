package ff.kh.ns.ez.databasesfordeveloperstask2.repository;

import ff.kh.ns.ez.databasesfordeveloperstask2.entity.Patient;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PatientRepository extends JpaRepository<Patient, Long> {

    Patient findPatientByIdPatient(long patientId);

}
