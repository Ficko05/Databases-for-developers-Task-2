package ff.kh.ns.ez.databasesfordeveloperstask2.service;

import ff.kh.ns.ez.databasesfordeveloperstask2.entity.Patient;
import ff.kh.ns.ez.databasesfordeveloperstask2.entity.Person;
import ff.kh.ns.ez.databasesfordeveloperstask2.entity.Prescriptions;
import ff.kh.ns.ez.databasesfordeveloperstask2.repository.PatientRepository;
import ff.kh.ns.ez.databasesfordeveloperstask2.repository.PersonRepository;
import ff.kh.ns.ez.databasesfordeveloperstask2.repository.PrescriptionRepository;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;


@Service
public class PrescriptionService {

    @Autowired
    private PrescriptionRepository prescriptionRepository;

    @Autowired
    private PersonRepository personRepository;

    @Autowired
    private PatientRepository patientRepository;

    @Autowired
    private MailSenderService mailSenderService;


    public void getPrescriptionWithCurrentDateAndSendMail() {
        LocalDate myObj = LocalDate.now();
        ArrayList<Prescriptions> perMail = prescriptionRepository.findPrescriptionsByReminderDate(myObj);
        for (int i = 0; i < perMail.size(); i++) {
            Patient patient = patientRepository.findPatientByIdPatient(perMail.get(1).getPatient_id());
            Person person = personRepository.findPersonByIdPerson(patient.getPerson_id());
            mailSenderService.sendEmail(person.getEmail(), "Reminder", "your prescription " + perMail.get(i).getMedication_name() + " is about to be run out");
        }
    }


}
