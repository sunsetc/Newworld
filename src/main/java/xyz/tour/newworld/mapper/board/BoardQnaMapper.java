package xyz.tour.newworld.mapper.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import xyz.tour.newworld.vo.ReservationInfoVO;
import xyz.tour.newworld.vo.board.BoardQnaVO;

@Mapper
public interface BoardQnaMapper {
	List<BoardQnaVO> seachBoardQnaList(BoardQnaVO boardQna);
	BoardQnaVO selectBoardQna(int bqNum);
	int insertBoardQna(BoardQnaVO boardQna);
	int updateBoardQna(BoardQnaVO boardQna);
	int deleteBoardQna(int bqNum);
	List<ReservationInfoVO> selectReservCode(int uiNum);
	List<ReservationInfoVO> selectReservCodeList(String uiId);  //1:1문의 등록 시 예약번호 조회용
	BoardQnaVO selectPrevQna(BoardQnaVO boardQna);
	BoardQnaVO selectNextQna(BoardQnaVO boardQna);
}
