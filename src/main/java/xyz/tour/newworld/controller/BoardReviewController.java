package xyz.tour.newworld.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import xyz.tour.newworld.service.BoardReviewService;
import xyz.tour.newworld.vo.BoardReviewVO;
import xyz.tour.newworld.vo.ForeignHomeGoodsInfoVO;
import xyz.tour.newworld.vo.ReservationInfoVO;

@Controller
public class BoardReviewController {

	@Autowired
	private BoardReviewService boardReviewService;
	
	@GetMapping("/get-review/{giCode}")
	@ResponseBody
	public List<BoardReviewVO> getReview(BoardReviewVO boardReviewVO, @PathVariable("giCode") String giCode) {
		return boardReviewService.getReview(boardReviewVO);
	}
	
	@GetMapping("/review-list/{uiId}")
	@ResponseBody
	public List<BoardReviewVO> reviewList(BoardReviewVO boardReviewVO, @PathVariable("uiId") String uiId) {
		return boardReviewService.reviewList(boardReviewVO);
	}
	
	@GetMapping("/review-possible/{uiId}")
	@ResponseBody
	public List<BoardReviewVO> possibleReview(BoardReviewVO boardReviewVO, @PathVariable("uiId") String uiId) {
		return boardReviewService.possibleReview(boardReviewVO);
	}
	
	@PostMapping("/foreign-insert/{giCode}")
	@ResponseBody
	public int foreignReview(@RequestBody BoardReviewVO boardReviewVO, @PathVariable("giCode") String giCode) {
		return boardReviewService.foreignReview(boardReviewVO);
	}
	
	@PostMapping("/home-insert/{giCode}")
	@ResponseBody
	public int homeReview(@RequestBody BoardReviewVO boardReviewVO, @PathVariable("giCode") String giCode) {
		return boardReviewService.homeReview(boardReviewVO);
	}
	
	@GetMapping("/review-get/{giCode}/{uiId}")
	@ResponseBody
	public ForeignHomeGoodsInfoVO goodsGet(@PathVariable("giCode") String giCode, @PathVariable("uiId") String uiId) {
		return boardReviewService.goodsGet(giCode, uiId);
	}
	
	@GetMapping("/reviewdelete/{brNum}")
	@ResponseBody
	public BoardReviewVO reviewInfo(@PathVariable("brNum") int brNum, BoardReviewVO boardReviewVO) {
		return boardReviewService.reviewInfo(boardReviewVO);
	}
	
	@PatchMapping("/check-review")
	@ResponseBody
	public int checkReview(@RequestBody ReservationInfoVO reservationInfoVO) {
		return boardReviewService.checkReview(reservationInfoVO);
	}
	
	@DeleteMapping("/review-remove/{uiId}/{riCode}")
	@ResponseBody
	public int removeReview(BoardReviewVO boardReviewVO, @PathVariable("uiId") String uiId, @PathVariable("riCode") String riCode) {
		return boardReviewService.removeReview(boardReviewVO);
	}
	
	@PatchMapping("/review-remove-update/{uiId}/{riCode}")
	@ResponseBody
	public int removeReviewUpdate(ReservationInfoVO reservationInfoVO, @PathVariable("uiId") String uiId, @PathVariable("riCode") String riCode) {
		return boardReviewService.removeReviewUpdate(reservationInfoVO);
	}
	

}
