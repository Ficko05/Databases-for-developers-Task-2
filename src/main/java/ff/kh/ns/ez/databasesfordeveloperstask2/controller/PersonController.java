package ff.kh.ns.ez.databasesfordeveloperstask2.controller;

import ff.kh.ns.ez.databasesfordeveloperstask2.entity.Person;
import ff.kh.ns.ez.databasesfordeveloperstask2.repository.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/person")
public class PersonController {

    @Autowired
    private PersonRepository personRepository;

    @GetMapping("/persons")
    public List<Person> getAllPersons (){
        return personRepository.findAll();
    }

    @GetMapping("/")
    public String testApi(){
        return "hello";
    }

}
