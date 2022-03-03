package ff.kh.ns.ez.databasesfordeveloperstask2.entity;


import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(schema="mydb")
public class Person {
    
    @Id
    @Column(name = "idperson")
    @GeneratedValue(strategy  = GenerationType.IDENTITY)
    private Long idPerson;

    @Column(name = "name")
    private String name;
    @Column(name = "phonenumber")
    private String phoneNumber;
    @Column(name = "cprnumber")
    private String cprNumber;
    @Column(name = "address")
    private String address;
    @Column(name = "email")
    private String email;

    
    
    
}
