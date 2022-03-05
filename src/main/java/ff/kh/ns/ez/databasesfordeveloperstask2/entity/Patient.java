package ff.kh.ns.ez.databasesfordeveloperstask2.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "patient", schema = "mydb")
public class Patient {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idpatient", nullable = false)
    private long idPatient;

    @Column(name = "person_idperson")
    private long person_id;

}