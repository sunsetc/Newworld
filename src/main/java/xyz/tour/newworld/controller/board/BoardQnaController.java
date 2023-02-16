
package xyz.tour.newworld.controller.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import xyz.tour.newworld.service.board.BoardQnaService;
import xyz.tour.newworld.vo.ReservationInfoVO;
import xyz.tour.newworld.vo.UserInfoVO;
import xyz.tour.newworld.vo.board.BoardQnaVO;

@Controller
public class BoardQnaController {

	@Autowired
	public BoardQnaService boardQnaService;
	
	@GetMapping("/newworlds-qna")  //1대1문의 목록&검색
	@ResponseBody
	public List<BoardQnaVO> seachBoardQna(@ModelAttribute BoardQnaVO boardQna){
		return boardQnaService.seachBoardQnaList(boardQna);
	}
	
	@GetMapping("/newworlds-qna/{bqNum}")  //1대1문의 상세보기
	@ResponseBody
	public BoardQnaVO selectBoardQna(@PathVariable int bqNum) {
		return boardQnaService.selectBoardQna(bqNum);
	}
	
	@PostMapping("/newworlds-qna")
	@ResponseBody
	public int insertBoardQna(@RequestBody BoardQnaVO boardQna, HttpSession session) {
		UserInfoVO userInfo = (UserInfoVO)session.getAttribute("userInfo");
		if(userInfo == null) {
			throw new RuntimeException("로그인이 필요합니다.");
		}
		boardQna.setUiNum(userInfo.getUiNum());
		return boardQnaService.insertBoardQna(boardQna);	
	}
	
	@PatchMapping("/newworlds-qna/{bqNum}")
	@ResponseBody
	public int updateBoardQna(@RequestBody BoardQnaVO boardQna, @PathVariable("bqNum") int bqNum) {
		boardQna.setBqNum(bqNum);
		return boardQnaService.updateBoardQna(boardQna);
	}
	
	@DeleteMapping("/newworlds-qna/{bqNum}")
	@ResponseBody
	public int deleteBoardQna(@PathVariable("bqNum") int bqNum) {
		return boardQnaService.deleteBoardQna(bqNum);
	}
	
	@GetMapping("/newworlds-code/{uiNum}")
	@ResponseBody
	public List<ReservationInfoVO> selectReservCode(@PathVariable("uiNum")int uiNum){
		return boardQnaService.selectReservCode(uiNum);
	}
	
	@GetMapping("/reservCode-list/{uiId}")
	@ResponseBody
	public List<ReservationInfoVO> selectReservCodeList(@PathVariable("uiId")String uiId){  //1:1문의 등록 시 예약번호 조회용
		return boardQnaService.selectReservCodeList(uiId);
	}
	
	@GetMapping("/prev-qna")
	@ResponseBody
	public BoardQnaVO selectPrevQna(BoardQnaVO boardQna) {
		return boardQnaService.selectPrevQna(boardQna);
	}
	
	@GetMapping("/next-qna")
	@ResponseBody
	public BoardQnaVO selectNextQna(BoardQnaVO boardQna) {
		return boardQnaService.selectNextQna(boardQna);
	}
}
