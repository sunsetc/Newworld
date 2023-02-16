package xyz.tour.newworld.mapper;

import java.util.List;

import xyz.tour.newworld.vo.CompanionInfoVO;
import xyz.tour.newworld.vo.ForeignHomeGoodsInfoVO;
import xyz.tour.newworld.vo.ReservationInfoVO;

public interface ReservationMapper {
	//공통
	ForeignHomeGoodsInfoVO getGoodsFlight(ForeignHomeGoodsInfoVO foreignGoodsInfoVO);	//예약 페이지에 항공, 상품 테이블에서 정보 불러오기
	ForeignHomeGoodsInfoVO maxGoodsInfos(ForeignHomeGoodsInfoVO foreignGoodsInfoVO);	//패키지 구매 정원 제한
	ForeignHomeGoodsInfoVO maxGoods(ForeignHomeGoodsInfoVO foreignGoodsInfoVO);	//1인당 구매 제한
	ForeignHomeGoodsInfoVO nullCount (ForeignHomeGoodsInfoVO foreignGoodsInfoVO);	//현재 입력한 수로 패키지 정원이랑 비교
	ReservationInfoVO codeCount(ReservationInfoVO reservationInfoVO);	//상품코드로 예약 인원 있는지
	ReservationInfoVO selectReservation (ReservationInfoVO reservationInfoVO);	//패키지 1인 1구매하려고 예약 내역 조회
	
	
	//해외 예약 등록
	int insertReservation(ReservationInfoVO reservationInfoVO); //예약 등록
	
	//예약 상세 페이지 예약 & 상품 정보 불러오기
	ReservationInfoVO getReservations(ReservationInfoVO reservationInfoVO);	//예약 상세 페이지에 예약자 정보 불러오기
	ForeignHomeGoodsInfoVO getGoodsForeign(ForeignHomeGoodsInfoVO foreignGoodsInfoVO);	//예약 상세 페이지에 상품 정보 불러오기
	
	
	//국내 예약 등록
	int insertHomeReservation(ReservationInfoVO reservationInfoVO);	//패키지 예약 등록

	
	
	//동행인
	int insertCompanion(CompanionInfoVO companionInfoVO);	//동행인 DB 저장
	int insertCompanion2(CompanionInfoVO companionInfoVO);
	int insertCompanion3(CompanionInfoVO companionInfoVO);
	int insertCompanion4(CompanionInfoVO companionInfoVO);
	int insertCompanion5(CompanionInfoVO companionInfoVO);
	
	int companionCancel(String riCode);
	
	//예약하면서 동행인 테이블에 예약번호 저장
	int updateCompanion(CompanionInfoVO companionInfoVO);
	
	//예약 상세 페이지 동행인 정보 불러오기
	List<CompanionInfoVO> getCompanion(CompanionInfoVO companionInfoVO);
	
	
	
	
	//예약조회
	
	//로그인한 회원 국내&해외 예약내역 불러오기
	List<ReservationInfoVO> selectReserv(ReservationInfoVO reservationInfoVO);
	
	//로그인한 회원 해당 예약번호의 상품정보,회원정보,항공편정보 불러오기
	ReservationInfoVO selectReservView(ReservationInfoVO reservationInfoVO);
	
	//예약번호로 동행인 정보 불러오기
	List<CompanionInfoVO> selectCompanionByRiCode(CompanionInfoVO companionInfoVO);
	
	//예약취소
	int updateReservationActive(String riCode);
	
	int updateReservationCheck(String riCode);
	
	//예약 상세 페이지에서 결제 정보가 있을 경우 결제내역보기 뜨게함
	ReservationInfoVO reservInfoCheck(ReservationInfoVO reservationInfoVO);
	
	//예약 상세 페이지에서 결제 정보가 없을 경우 결제하기 뜨게함
	ReservationInfoVO reservInfoOrder(ReservationInfoVO reservationInfoVO);
	
	//예약 상세 페이지에서 예약 취소된 건일 경우 버튼 아무것도 안뜸
	ReservationInfoVO reservInfoCancel(ReservationInfoVO reservationInfoVO);
	
	//마이페이지에서 로그인한 회원 국내&해외 예약내역 불러오기
	List<ReservationInfoVO> selectReservMy(ReservationInfoVO reservationInfoVO);
	
	
}
