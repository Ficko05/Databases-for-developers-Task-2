package ff.kh.ns.ez.databasesfordeveloperstask2.repository;

import ff.kh.ns.ez.databasesfordeveloperstask2.entity.Prescriptions;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;


public interface PrescriptionRepository extends JpaRepository<Prescriptions, Long> {

    ArrayList<Prescriptions> findPrescriptionsByReminderDate(LocalDate reminder_date);
    Optional<Prescriptions> findPrescriptionsByIdprescription(long Idprescription);
}
