package ff.kh.ns.ez.databasesfordeveloperstask2.repository;

import ff.kh.ns.ez.databasesfordeveloperstask2.entity.Prescriptions;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PrescriptionRepository extends JpaRepository<Prescriptions, Long> {
}
