package ff.kh.ns.ez.databasesfordeveloperstask2.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;
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
//    @JsonFormat(pattern = "yyy-mm-dd", shape = JsonFormat.Shape.STRING)
//    @DateTimeFormat(pattern = "yyyy-mm-dd")
    @Column(name = "reminder_date")
    private LocalDate reminderDate;
    private int quantity_current;
    private int quantity_end;
    @Column(name = "doctor_iddoctor")
    private int doctor_id;
    @Column(name = "patient_idpatient")
    private long patient_id;


}
