package kr.or.iei.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.or.iei.reserve.model.service.ReserveService;
import kr.or.iei.tour.model.service.TourService;

@Component
public class ScheduleWork {
	@Autowired
	@Qualifier("tourService")
	private TourService tservice;
	
	@Autowired
	@Qualifier("reserveService")
	private ReserveService rservice;
	
	@Scheduled(cron="0 0 0 * * *")
	public void tourCloseCheck() {
		int result = tservice.tourCloseCheck();
		System.out.println(result+"개 상품이 마감되었습니다");
	}
	
	@Scheduled(cron="0 0/5 * * * *")
	public void reserveCheck() {
		int result = rservice.reserveCheck();
		System.out.println(result+"개의 잘못된 예약이 삭제되었습니다");
	}
}
