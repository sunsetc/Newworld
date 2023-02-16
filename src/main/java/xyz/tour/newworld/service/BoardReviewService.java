package xyz.tour.newworld.service;

import java.util.List;

import javax.management.RuntimeErrorException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xyz.tour.newworld.mapper.BoardReviewMapper;
import xyz.tour.newworld.vo.BoardReviewVO;
import xyz.tour.newworld.vo.ForeignHomeGoodsInfoVO;
import xyz.tour.newworld.vo.ReservationInfoVO;


@Service
public class BoardReviewService {

	@Autowired
	private BoardReviewMapper boardReviewMapper;
	
	public List<BoardReviewVO> getReview(BoardReviewVO boardReviewVO) {
		return boardReviewMapper.getReview(boardReviewVO);
	}
	
	public List<BoardReviewVO> reviewList(BoardReviewVO boardReviewVO) {
		return boardReviewMapper.reviewList(boardReviewVO);
	}
	
	public List<BoardReviewVO> possibleReview(BoardReviewVO boardReviewVO) {
		return boardReviewMapper.possibleReview(boardReviewVO);
	}
	
	public int foreignReview(BoardReviewVO boardReviewVO) {
		BoardReviewVO check = boardReviewMapper.checkInsert(boardReviewVO);
		if(check != null) {
			throw new RuntimeException("이미 리뷰가 등록되어 있습니다.");
		}
		return boardReviewMapper.foreignReview(boardReviewVO);
	}
	
	public int homeReview(BoardReviewVO boardReviewVO) {
		return boardReviewMapper.homeReview(boardReviewVO);
	}
	
	public ForeignHomeGoodsInfoVO goodsGet(String giCode, String uiId) {
		return boardReviewMapper.goodsGet(giCode, uiId);
	}
	
	public int checkReview(ReservationInfoVO reservationInfoVO) {
		return boardReviewMapper.checkReview(reservationInfoVO);
	}
	
	public int removeReview(BoardReviewVO boardReviewVO) {
		return boardReviewMapper.removeReview(boardReviewVO);
	}
	
	public int removeReviewUpdate(ReservationInfoVO reservationInfoVO) {
		return boardReviewMapper.removeReviewUpdate(reservationInfoVO);
	}
	
	public BoardReviewVO reviewInfo(BoardReviewVO boardReviewVO) {
		return boardReviewMapper.reviewInfo(boardReviewVO);
	}

}
