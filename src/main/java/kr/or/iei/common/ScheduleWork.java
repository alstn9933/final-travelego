package kr.or.iei.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.or.iei.tour.model.service.TourService;

@Component
public class ScheduleWork {
	@Autowired
	@Qualifier("tourService")
	private TourService service;
	
	@Scheduled(cron="0 0 0 * * *")
	public void tourCloseCheck() {
		int result = service.tourCloseCheck();
		System.out.println(result+"개 상품이 마감되었습니다");
	}
}
