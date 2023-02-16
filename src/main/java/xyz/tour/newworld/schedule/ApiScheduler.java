package xyz.tour.newworld.schedule;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;
import xyz.tour.newworld.service.BoxOfficeService;
import xyz.tour.newworld.vo.BoxOfficeVO;

@Component
@Slf4j
public class ApiScheduler {

	@Autowired
	private BoxOfficeService boxOfficeService;
	
//	//cron = "초 분 시 일 월 주"
//	@Scheduled(cron="0 10 13 * * *")
//	public void dailyBoxOffice() {
//		List<BoxOfficeVO> boxOfficeList = boxOfficeService.getBoxOffice(1);
//		int result = boxOfficeService.insertBoxOffice(boxOfficeList);
//		log.debug("result=>{}", result);
//	}
}
