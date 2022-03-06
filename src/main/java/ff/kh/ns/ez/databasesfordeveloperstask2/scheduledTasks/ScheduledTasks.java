package ff.kh.ns.ez.databasesfordeveloperstask2.scheduledTasks;

import ff.kh.ns.ez.databasesfordeveloperstask2.service.PrescriptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.format.DateTimeFormatter;


@Component
public class ScheduledTasks {
    private static final DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");

    @Autowired
    PrescriptionService prescriptionService;


    //    @Scheduled(fixedRate = 20000)
    @Scheduled(cron = "2 * * * * *")
    public void testMethod() {
        prescriptionService.getPrescriptionWithCurrentDateAndSendMail();
    }


}
