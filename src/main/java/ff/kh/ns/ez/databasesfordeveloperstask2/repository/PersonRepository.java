package ff.kh.ns.ez.databasesfordeveloperstask2.repository;

import ff.kh.ns.ez.databasesfordeveloperstask2.entity.Person;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PersonRepository extends JpaRepository<Person, Long> {
}
