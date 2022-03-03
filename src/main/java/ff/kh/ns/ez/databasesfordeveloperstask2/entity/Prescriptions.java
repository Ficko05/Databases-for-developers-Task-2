package ff.kh.ns.ez.databasesfordeveloperstask2.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Entity
@Data
@Table(schema="mydb")
public class Prescriptions {

    @Id
    @Column(name = "idprescriptions")
    @GeneratedValue(strategy  = GenerationType.IDENTITY)
    private Long idprescription;

    private String medication_name;
    private Date start_date;
    private Date end_date;
    private Date reminder_date;
    private int quantity_current;
    private int quantity_end;
    @Column(name = "doctor_iddoctor")
    private int doctor_id;



}
