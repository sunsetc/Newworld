package xyz.tour.newworld.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import xyz.tour.newworld.service.ReservationService;
import xyz.tour.newworld.vo.CompanionInfoVO;
import xyz.tour.newworld.vo.ForeignHomeGoodsInfoVO;
import xyz.tour.newworld.vo.ReservationInfoVO;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService reservationService;
	
	//공통
	@GetMapping("/reservation/{giCode}")	//예약 페이지에 항공, 상품 테이블에서 정보 불러오기
	@ResponseBody
	public ForeignHomeGoodsInfoVO getGoodsFlight(ForeignHomeGoodsInfoVO foreignGoodsInfoVO, @PathVariable("giCode") String giCode) {
		return reservationService.getGoodsFlight(foreignGoodsInfoVO);
	}
	
	@GetMapping("/order/{giCode}")	//예약 상세 페이지에 상품 정보 불러오기
	@ResponseBody
	public ForeignHomeGoodsInfoVO getGoodsForeign(ForeignHomeGoodsInfoVO foreignGoodsInfoVO, @PathVariable("giCode") String giCode) {
		return reservationService.getGoodsForeign(foreignGoodsInfoVO);
	}
	
	//해외
	@PostMapping("/reservation")	//패키지 예약 등록
	@ResponseBody
	public int insertReservation(@RequestBody ReservationInfoVO reservationInfoVO) {
		return reservationService.insertReservation(reservationInfoVO);
	}
	
	@GetMapping("/order/{uiId}/{giCode}")	//예약 상세 페이지에 예약자 정보 불러오기
	@ResponseBody
	public ReservationInfoVO getReservations(ReservationInfoVO reservationInfoVO, @PathVariable("uiId") String uiId, @PathVariable("giCode") String giCode) {
		return reservationService.getReservations(reservationInfoVO);
	}

	


	//동행인
	@PostMapping("/reservation/companion")	//동행인 DB 저장
	@ResponseBody
	public int insertCompanion(@RequestBody CompanionInfoVO companionInfoVO) {
		return reservationService.insertCompanion(companionInfoVO);
	}
	
	@PatchMapping("/companion/update")	//예약하면서 동행인 테이블에 예약번호 저장
	@ResponseBody
	public int updateCompanion(@RequestBody CompanionInfoVO companionInfoVO) {
		return reservationService.updateCompanion(companionInfoVO);
	}
	
	@GetMapping("/orderCompanion/{uiId}/{giCode}")	//예약 상세 페이지 동행인 정보 불러오기
	@ResponseBody
	public List<CompanionInfoVO> getCompanion(CompanionInfoVO companionInfoVO, @PathVariable("uiId") String uiId, @PathVariable("giCode") String giCode) {
		return reservationService.getCompanion(companionInfoVO);
	}
	
	@PatchMapping("/cancel-companion/{riCode}")
	@ResponseBody
	public int companionCancel(@PathVariable("riCode") String riCode) {
		return reservationService.companionCancel(riCode);
	}
	
	
	//국내	
	@PostMapping("/reservation/home")	//패키지 예약 등록
	@ResponseBody
	public int insertHomeReservation(@RequestBody ReservationInfoVO reservationInfoVO) {
		return reservationService.insertHomeReservation(reservationInfoVO);
	}
	
	
	
	
	//예약조회
	
	//로그인한 회원 국내&해외 예약내역 불러오기
	@GetMapping("/reserv-list/{uiId}")
	@ResponseBody
	public List<ReservationInfoVO> getReservList(ReservationInfoVO reservationInfoVO, @PathVariable("uiId")String uiId){
		return reservationService.getReservList(reservationInfoVO);
	}
	
	@GetMapping("/reserv-list-my/{uiId}")
	@ResponseBody
	public List<ReservationInfoVO> selectReservMy(ReservationInfoVO reservationInfoVO, @PathVariable("uiId")String uiId) {
		return reservationService.selectReservMy(reservationInfoVO);
	}
	
	//로그인한 회원 해당 예약번호의 상품정보,회원정보 불러오기
	@GetMapping("/reserv-view/{riCode}")
	@ResponseBody
	public ReservationInfoVO getReservView(ReservationInfoVO reservationInfoVO, @PathVariable("riCode")String riCode) {
		return reservationService.getReservView(reservationInfoVO);
	}
	
	//예약번호로 동행인 정보 불러오기
	@GetMapping("/reserv-Companion/{riCode}")
	@ResponseBody
	public List<CompanionInfoVO> getCompanionByRiCode(CompanionInfoVO companionInfoVO, @PathVariable("riCode")String riCode){
		return reservationService.getCompanionByRiCode(companionInfoVO);
	}
	
	@PatchMapping("/reserve-cancel/{riCode}") //예약취소
	@ResponseBody
	public int cancelReserve(@PathVariable("riCode")String riCode) {
		return reservationService.updateReservationActive(riCode);
	}
	
	@PatchMapping("/reserve-cancel-check/{riCode}")
	@ResponseBody
	public int updateReservationCheck(@PathVariable("riCode") String riCode) {
		return reservationService.updateReservationCheck(riCode);
	}
	
	//예약 상세 페이지에서 결제 정보가 있을 경우 결제내역보기 뜨게함
	@GetMapping("/reserv-check/{uiId}/{riCode}")
	@ResponseBody
	public ReservationInfoVO reservInfoCheck(ReservationInfoVO reservationInfoVO, @PathVariable("uiId") String uiId, @PathVariable("riCode") String riCode) {
		return reservationService.reservInfoCheck(reservationInfoVO);
	}
	
	//예약 상세 페이지에서 결제 정보가 없을 경우 결제하기 뜨게함
	@GetMapping("/reserv-order/{uiId}/{riCode}")
	@ResponseBody
	public ReservationInfoVO reservInfoOrder(ReservationInfoVO reservationInfoVO, @PathVariable("uiId") String uiId, @PathVariable("riCode") String riCode) {
		return reservationService.reservInfoOrder(reservationInfoVO);
	}
	
	//예약 상세 페이지에서 예약 취소된 건일 경우 버튼 아무것도 안뜸
	@GetMapping("/reserv-cancel/{uiId}/{riCode}")
	@ResponseBody
	public ReservationInfoVO reservInfoCancel(ReservationInfoVO reservationInfoVO) {
		return reservationService.reservInfoCancel(reservationInfoVO);
	}

	
	
}
