package ff.kh.ns.ez.databasesfordeveloperstask2.controller;

import ff.kh.ns.ez.databasesfordeveloperstask2.entity.Prescriptions;
import ff.kh.ns.ez.databasesfordeveloperstask2.repository.PrescriptionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(value = "/Prescription")
public class PrescriptionController {


    @Autowired
    private PrescriptionRepository prescriptionRepository;


    @GetMapping(value = "/all")
    public List<Prescriptions> getAllPrescriptions(){
        return prescriptionRepository.findAll();

    }

    @GetMapping(value = "/test/{reminder_date}")
    public List<Prescriptions> getAllPrescriptionsWithCurrentDate(@PathVariable("reminder_date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date reminder_date){
        return prescriptionRepository.findPrescriptionsByReminderDate(reminder_date);

    }

    @GetMapping(value = "/test2/{id}")
    public Optional<Prescriptions> getAllPrescriptionsWithCurrentDate(@PathVariable long id){
        return prescriptionRepository.findPrescriptionsByIdprescription(id);

    }
}
