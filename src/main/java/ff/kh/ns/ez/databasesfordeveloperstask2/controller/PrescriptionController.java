package ff.kh.ns.ez.databasesfordeveloperstask2.controller;

import ff.kh.ns.ez.databasesfordeveloperstask2.entity.Prescriptions;
import ff.kh.ns.ez.databasesfordeveloperstask2.repository.PrescriptionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/Prescription")
public class PrescriptionController {


    @Autowired
    private PrescriptionRepository prescriptionRepository;


    @GetMapping(value = "/")
    public List<Prescriptions> getAllPrescriptions(){
        return prescriptionRepository.findAll();

    }

}
