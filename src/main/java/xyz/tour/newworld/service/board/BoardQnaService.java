package xyz.tour.newworld.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xyz.tour.newworld.mapper.board.BoardQnaMapper;
import xyz.tour.newworld.vo.ReservationInfoVO;
import xyz.tour.newworld.vo.board.BoardQnaVO;

@Service
public class BoardQnaService {
	
	@Autowired
	public BoardQnaMapper boardQnaMapper;
	
	public List<BoardQnaVO> seachBoardQnaList(BoardQnaVO boardQna){
		return boardQnaMapper.seachBoardQnaList(boardQna);
	}
	
	public BoardQnaVO selectBoardQna(int bqNum) {
		return boardQnaMapper.selectBoardQna(bqNum);
	}
	
	public int insertBoardQna(BoardQnaVO boardQna) {
		if(boardQna.getBqTitle() == "" && boardQna.getBqContent() == "") {
			throw new RuntimeException("공백 오류");
		}
		return boardQnaMapper.insertBoardQna(boardQna);
	}
	
	public int updateBoardQna(BoardQnaVO boardQna) {
		return boardQnaMapper.updateBoardQna(boardQna);
	}
	
	public int deleteBoardQna(int bqNum) {
		return boardQnaMapper.deleteBoardQna(bqNum);
	}
	
	public List<ReservationInfoVO> selectReservCode(int uiNum){
		return boardQnaMapper.selectReservCode(uiNum);
	}
	
	public List<ReservationInfoVO> selectReservCodeList(String uiId){  //1:1문의 등록 시 예약번호 조회용
		return boardQnaMapper.selectReservCodeList(uiId);
	}
	
	public BoardQnaVO selectPrevQna(BoardQnaVO boardQna) {
		return boardQnaMapper.selectPrevQna(boardQna);
	}
	
	public BoardQnaVO selectNextQna(BoardQnaVO boardQna) {
		return boardQnaMapper.selectNextQna(boardQna);
	}
}
