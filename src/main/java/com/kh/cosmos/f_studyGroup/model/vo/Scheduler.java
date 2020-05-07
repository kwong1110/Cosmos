package com.kh.cosmos.f_studyGroup.model.vo;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Scheduler {
	
	private String year;
	private String month;
	private String day;
	
	// crontab 을 이용한 스케쥴러
	 @Scheduled(cron = "0 39 13 * * *")
	 public void crontest1(){
	  System.out.println("1번 작업이 호출이 되었습니다");
	 }
	 
	 // crontab 을 이용한 스케쥴러
	 @Scheduled(cron = "20 39 13 * * *")
	 public void crontest2(){
	  System.out.println("2번 작업이 호출이 되었습니다");
	  //crontest3();
	 }
	 
	 /*
	 @Scheduled(fixedDelay = 10000) // 1000*10 = 10초 마다 실행
	 public void crontest3(){
	  System.out.println("3번 작업이 호출이 되었습니다");
	 }
	 */
}
