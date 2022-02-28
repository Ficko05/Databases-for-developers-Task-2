package ff.kh.ns.ez.databasesfordeveloperstask2.entity;


import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class Person {
    
    @Id
    @Column(name = "idPerson")
    @GeneratedValue(strategy  = GenerationType.IDENTITY)
    private Long idPerson;

    private String name;
    private String phoneNumber;
    private String cprNumber;
    private String address;
    private String email;

    
    
    
}
