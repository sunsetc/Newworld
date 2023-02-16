package xyz.tour.newworld.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import xyz.tour.newworld.mapper.ReservationMapper;
import xyz.tour.newworld.vo.CompanionInfoVO;
import xyz.tour.newworld.vo.ForeignHomeGoodsInfoVO;
import xyz.tour.newworld.vo.ReservationInfoVO;

@Service
@Slf4j
public class ReservationService {

	@Autowired
	private ReservationMapper reservationMapper;
	
	//공통
	public ForeignHomeGoodsInfoVO getGoodsFlight(ForeignHomeGoodsInfoVO foreignGoodsInfoVO) {	//예약 페이지에 항공, 상품 테이블에서 정보 불러오기
		return reservationMapper.getGoodsFlight(foreignGoodsInfoVO);
	}
	
	public ForeignHomeGoodsInfoVO getGoodsForeign(ForeignHomeGoodsInfoVO foreignGoodsInfoVO) {	//예약 상세 페이지에 상품 정보 불러오기
		return reservationMapper.getGoodsForeign(foreignGoodsInfoVO);
	}
	
	//해외
	public int insertReservation(ReservationInfoVO reservationInfoVO) {	//패키지 예약 등록
		ForeignHomeGoodsInfoVO foreignHomeGoodsInfoVO = new ForeignHomeGoodsInfoVO();
		foreignHomeGoodsInfoVO.setGiCode(reservationInfoVO.getGiCode());	//해외상품테이블에 상품코드 저장
		foreignHomeGoodsInfoVO.setRiAdultCount(reservationInfoVO.getRiAdultCount());	//해외상품테이블에 어른예약수 저장
		foreignHomeGoodsInfoVO.setRiKidsCount(reservationInfoVO.getRiKidsCount());	//해외상품테이블에 아동예약수 저장
		foreignHomeGoodsInfoVO.setRiBabyCount(reservationInfoVO.getRiBabyCount());	//해외상품테이블에 아기예약수 저장
		ForeignHomeGoodsInfoVO maxGoodsInfos = reservationMapper.maxGoodsInfos(foreignHomeGoodsInfoVO);	//패키지 구매 정원 제한
		ForeignHomeGoodsInfoVO maxGoods = reservationMapper.maxGoods(foreignHomeGoodsInfoVO);	//1인당 구매 제한
		ForeignHomeGoodsInfoVO nullCount = reservationMapper.nullCount(foreignHomeGoodsInfoVO);	//현재 입력한 수로 패키지 정원이랑 비교
		ReservationInfoVO codeCount = reservationMapper.codeCount(reservationInfoVO);	//상품코드로 예약 인원 있는지
		ReservationInfoVO selectReservation = reservationMapper.selectReservation(reservationInfoVO);	//패키지 1인 1구매하려고 예약 내역 조회
		if(maxGoods == null) {
			throw new RuntimeException("1인당 구매 갯수를 초과했습니다.");
		}else if(selectReservation != null) {
			throw new RuntimeException("패키지는 1인당 1패키지만 구매 가능합니다.");
		}else if(codeCount == null) {
			if(nullCount != null) {
				reservationMapper.insertReservation(reservationInfoVO);
				return 1;
			}
		}else if(codeCount != null) {
			if(maxGoodsInfos == null) {
				throw new RuntimeException("패키지 정원 초과하였습니다.");
			}
		}
		return reservationMapper.insertReservation(reservationInfoVO);
	}
	
	public ReservationInfoVO getReservations(ReservationInfoVO reservationInfoVO) {	//예약 상세 페이지에 예약자 정보 불러오기
		return reservationMapper.getReservations(reservationInfoVO);
	}

	
	//동행인
	public int insertCompanion(CompanionInfoVO companionInfoVO) {	//동행인 DB 저장
		if(companionInfoVO.getCoName2() == "") {
			reservationMapper.insertCompanion(companionInfoVO);
		}else if(companionInfoVO.getCoName3() == "") {
			reservationMapper.insertCompanion2(companionInfoVO);
		}else if(companionInfoVO.getCoName4() == "") {
			reservationMapper.insertCompanion3(companionInfoVO);
		}else if(companionInfoVO.getCoName5() == "") {
			reservationMapper.insertCompanion4(companionInfoVO);
		}else {
			reservationMapper.insertCompanion5(companionInfoVO);
		}
		return 0;
	}
	
	public int updateCompanion(CompanionInfoVO companionInfoVO) {	//예약하면서 동행인 테이블에 예약번호 저장
		return reservationMapper.updateCompanion(companionInfoVO);
	}
	
	public List<CompanionInfoVO> getCompanion(CompanionInfoVO companionInfoVO) {	//예약 상세 페이지 동행인 정보 불러오기
		return reservationMapper.getCompanion(companionInfoVO);
	}
	
	public int companionCancel(String riCode) {
		return reservationMapper.companionCancel(riCode);
	}
	
	
	//국내
	public int insertHomeReservation(ReservationInfoVO reservationInfoVO) {	//패키지 예약 등록
		ForeignHomeGoodsInfoVO foreignHomeGoodsInfoVO = new ForeignHomeGoodsInfoVO();
		foreignHomeGoodsInfoVO.setGiCode(reservationInfoVO.getGiCode());	//국내 상품 테이블에 상품코드 저장
		foreignHomeGoodsInfoVO.setRiAdultCount(reservationInfoVO.getRiAdultCount());	//국내 상품테이블에 어른예약수 저장
		foreignHomeGoodsInfoVO.setRiKidsCount(reservationInfoVO.getRiKidsCount());	//국내상품테이블에 아동예약수 저장
		foreignHomeGoodsInfoVO.setRiBabyCount(reservationInfoVO.getRiBabyCount());	//국내상품테이블에 아기예약수 저장
		ForeignHomeGoodsInfoVO maxGoodsInfos = reservationMapper.maxGoodsInfos(foreignHomeGoodsInfoVO);	//패키지 구매 정원 초과 제한
		ForeignHomeGoodsInfoVO maxGoods = reservationMapper.maxGoods(foreignHomeGoodsInfoVO);	//1인당 구매 제한
		ForeignHomeGoodsInfoVO nullCount = reservationMapper.nullCount(foreignHomeGoodsInfoVO);	//현재 입력한 수로 패키지 정원이랑 비교
		ReservationInfoVO codeCount = reservationMapper.codeCount(reservationInfoVO);	//DB에 같은 상품코드로 현재 예약인원이 있는지 확인
		ReservationInfoVO selectReservation = reservationMapper.selectReservation(reservationInfoVO);	//패키지 1인 1구매하려고 예약 내역 조회
		if(maxGoods == null) {
			throw new RuntimeException("1인당 구매 갯수를 초과했습니다.");
		}else if(selectReservation != null) {
			throw new RuntimeException("패키지는 1인당 1패키지만 구매 가능합니다.");
		}else if(codeCount == null) {
			if(nullCount != null) {
				reservationMapper.insertHomeReservation(reservationInfoVO);
				return 1;
			}
		}else if(codeCount != null) {
			if(maxGoodsInfos == null) {
				throw new RuntimeException("패키지 정원을 초과하였습니다.");
			}
		}
		return reservationMapper.insertHomeReservation(reservationInfoVO);
	}

	
	
	
	
	//예약조회
	public List<ReservationInfoVO> getReservList(ReservationInfoVO reservationInfoVO){
		return reservationMapper.selectReserv(reservationInfoVO);
	}
	
	public ReservationInfoVO getReservView(ReservationInfoVO reservationInfoVO) {
		return reservationMapper.selectReservView(reservationInfoVO);
	}
	
	public List<CompanionInfoVO> getCompanionByRiCode(CompanionInfoVO companionInfoVO){
		return reservationMapper.selectCompanionByRiCode(companionInfoVO);
	}
		
	//예약 취소
	public int updateReservationActive(String riCode) {
		return reservationMapper.updateReservationActive(riCode);
	}
	
	public int updateReservationCheck(String riCode) {
		return reservationMapper.updateReservationCheck(riCode);
	}
	
	//예약 상세 페이지에서 결제 정보가 있을 경우 결제내역보기 뜨게함
	public ReservationInfoVO reservInfoCheck(ReservationInfoVO reservationInfoVO) {
		return reservationMapper.reservInfoCheck(reservationInfoVO);
	}
	
	//예약 상세 페이지에서 결제 정보가 없을 경우 결제하기 뜨게함
	public ReservationInfoVO reservInfoOrder(ReservationInfoVO reservationInfoVO) {
		return reservationMapper.reservInfoOrder(reservationInfoVO);
	}
	
	//예약 상세 페이지에서 예약 취소된 건일 경우 버튼 아무것도 안뜸
	public ReservationInfoVO reservInfoCancel(ReservationInfoVO reservationInfoVO) {
		return reservationMapper.reservInfoCancel(reservationInfoVO);
	}
	
	//마이페이지에서 로그인한 회원 국내&해외 예약내역 불러오기
	public List<ReservationInfoVO> selectReservMy(ReservationInfoVO reservationInfoVO) {
		return reservationMapper.selectReservMy(reservationInfoVO);
	}
	

}
