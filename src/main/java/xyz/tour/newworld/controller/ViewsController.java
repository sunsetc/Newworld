package xyz.tour.newworld.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;
import xyz.tour.newworld.anno.CheckAuth;

@Controller //왜 restcontroller 안돼?  
public class ViewsController {
	
	@GetMapping("/")
	public String home() {
		return "views/newworld/main";
	}
	
	@GetMapping("/views/**")
	public String goPage(HttpServletRequest request) {
		String uri = request.getRequestURI();
		return uri.substring(1);
	}
	
	//로그인안했으면 이동 못하게 페이지 막기
	
	@GetMapping("/views/newworld/mypage")	//마이페이지
	@CheckAuth
	public String page1() {
		return "/views/newworld/mypage";
	}
	
	@GetMapping("/views/newworld/updatecheck")	//개인정보 변경할 때 비밀번호 체크
	@CheckAuth
	public String page2() {
		return "/views/newworld/updatecheck";
	}
	
	@GetMapping("/views/newworld/updatepassword")	//비밀번호 변경
	@CheckAuth
	public String page3() {
		return "/views/newworld/updatepassword";
	}
	
	@GetMapping("/views/newworld/updateuserinfo")	//회원 정보 변경
	@CheckAuth
	public String page4() {
		return "/views/newworld/updateuserinfo";
	}
	
	@GetMapping("/views/newworld/reservationlist")	//예약 전체 리스트
	@CheckAuth
	public String page5() {
		return "/views/newworld/reservationlist";
	}
	
	@GetMapping("/views/newworld/reservationapply")	//예약 페이지
	@CheckAuth
	public String page6() {
		return "/views/newworld/reservationapply";
	}
	
	@GetMapping("/views/newworld/reservationcountrylist")	//예약 해외 패키지 조회 리스트
	@CheckAuth
	public String page7() {
		return "/views/newworld/reservationcountrylist";
	}
	
	@GetMapping("/views/newworld/reservationview")	//예약 상세 페이지
	@CheckAuth
	public String page8() {
		return "/views/newworld/reservationview";
	}
	
	@GetMapping("/views/newworld/reservatiokorealist")	//예약 국내 패키지 조회 리스트
	@CheckAuth
	public String page9() {
		return "/views/newworld/reservatiokorealist";
	}
	
	@GetMapping("/views/newworld/boardqnainsert")	//qna 등록 화면
	@CheckAuth
	public String page10() {
		return "/views/newworld/boardqnainsert";
	}
	
	@GetMapping("/views/newworld/deleteuserinfo")	//회원 탈퇴 화면
	@CheckAuth
	public String page11() {
		return "/views/newworld/deleteuserinfo";
	}
	
	@GetMapping("/views/newworld/reviewview_list")	//리뷰 리스트
	@CheckAuth
	public String page12() {
		return "/views/newworld/reviewview_list";
	}
	
	@GetMapping("/views/newworld/reviewinsert_list")	//작성 가능한 리뷰 리스트
	@CheckAuth
	public String page13() {
		return "/views/newworld/reviewinsert_list";
	}
	
	@GetMapping("views/newworld/collectlist")	//찜목록
	@CheckAuth
	public String page14() {
		return "/views/newworld/collectlist";
	}
	
}
