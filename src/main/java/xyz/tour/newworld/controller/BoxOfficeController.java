package xyz.tour.newworld.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;
import xyz.tour.newworld.service.BoxOfficeService;
import xyz.tour.newworld.vo.BoxOfficeVO;

@RestController
@Slf4j
public class BoxOfficeController {

//	@Autowired
//	private BoxOfficeService boxOfficeService;
//	
//	@GetMapping("/boxoffices")
//	public List<BoxOfficeVO> selectBoxOffice(BoxOfficeVO boxOfficeVO) {
//		log.info("boxOffice=>{}", boxOfficeVO);
//		List<BoxOfficeVO> list = boxOfficeService.selectBoxOffice();
//		log.info("list=>{}", list);
//		return list;
//	} //? 기준 키밸류, 폼데이터
//	
//	@GetMapping("/test1")
//	public String getTest1(@RequestParam("a")String a) {
//		return a;
//	}
//	@GetMapping("/test2")
//	public String getTest2(@RequestParam("b")String a) {
//		return a;
//	}
//	@PostMapping("/test2")
//	public BoxOfficeVO getTest2(@RequestBody BoxOfficeVO boxOfficeVO) {
//		return boxOfficeVO;
//	} //@RequestBody 컨텐트타입 반드시 어플리케이션json이어야 한다
}