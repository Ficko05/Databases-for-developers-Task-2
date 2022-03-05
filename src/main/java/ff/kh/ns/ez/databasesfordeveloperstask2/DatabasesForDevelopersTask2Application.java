package ff.kh.ns.ez.databasesfordeveloperstask2;

import ff.kh.ns.ez.databasesfordeveloperstask2.service.MailSenderService;
import ff.kh.ns.ez.databasesfordeveloperstask2.service.PrescriptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class DatabasesForDevelopersTask2Application {

    @Autowired
    private MailSenderService emailService;

    @Autowired
    private PrescriptionService prescriptionService;

    public static void main(String[] args) {
        SpringApplication.run(DatabasesForDevelopersTask2Application.class, args);
    }

//    @EventListener(ApplicationReadyEvent.class)
//    public void sendMail(){
//        emailService.sendEmail("carlosdummy031@gmail.com", "Deez nuts", "Got'EM");
//    }

    @EventListener(ApplicationReadyEvent.class)
    public void test2(){
        prescriptionService.getPrescriptionWithCurrentDateAndSendMail();
    }

}
