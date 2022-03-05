package ff.kh.ns.ez.databasesfordeveloperstask2.scheduledTasks;


import ff.kh.ns.ez.databasesfordeveloperstask2.entity.Prescriptions;
import ff.kh.ns.ez.databasesfordeveloperstask2.service.PrescriptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;
import org.springframework.stereotype.Component;


import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;


@Component
public class ScheduledTasks {
    private static final DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");

    @Autowired
    PrescriptionService prescriptionService;



//    @Scheduled(fixedRate = 20000)
    @Scheduled(cron= "1 * * * * *")
    public void testMethod (){
        prescriptionService.getPrescriptionWithCurrentDateAndSendMail();
    }



}
