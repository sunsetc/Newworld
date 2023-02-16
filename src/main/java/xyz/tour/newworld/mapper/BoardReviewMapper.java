package xyz.tour.newworld.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import xyz.tour.newworld.vo.BoardReviewVO;
import xyz.tour.newworld.vo.ForeignHomeGoodsInfoVO;
import xyz.tour.newworld.vo.ReservationInfoVO;

public interface BoardReviewMapper {

	List<BoardReviewVO> getReview(BoardReviewVO boardReviewVO);
	List<BoardReviewVO> reviewList(BoardReviewVO boardReviewVO);
	List<BoardReviewVO> possibleReview(BoardReviewVO boardReviewVO);
	int foreignReview(BoardReviewVO boardReviewVO);
	int homeReview(BoardReviewVO boardReviewVO);
	ForeignHomeGoodsInfoVO goodsGet(@Param("giCode") String giCode, @Param("uiId") String uiId);
	int checkReview(ReservationInfoVO reservationInfoVO);
	BoardReviewVO checkInsert(BoardReviewVO boardReviewVO);
	int removeReview(BoardReviewVO boardReviewVO);
	int removeReviewUpdate(ReservationInfoVO reservationInfoVO);
	BoardReviewVO reviewInfo(BoardReviewVO boardReviewVO);
}
