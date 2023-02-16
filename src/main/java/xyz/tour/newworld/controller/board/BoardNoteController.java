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

import xyz.tour.newworld.service.board.BoardNoteService;
import xyz.tour.newworld.vo.board.BoardNoteVO;
import xyz.tour.newworld.vo.board.BoardQnaVO;

@Controller
public class BoardNoteController {

	@Autowired
	public BoardNoteService boardNoteService;
	
	@GetMapping("/newworlds-note")  //공지사항 목록&검색
	@ResponseBody
	public List<BoardNoteVO> seachBoardNote(@ModelAttribute BoardNoteVO boardNote){
		return boardNoteService.seachBoardNoteList(boardNote);
	}
	
	@GetMapping("/newworlds/note/{bnNum}")
	@ResponseBody
	public BoardNoteVO selectBoardQna(@PathVariable int bnNum) {
		return boardNoteService.selectBoardNote(bnNum);
	}
	
	@PostMapping("/newworlds/note")
	@ResponseBody
	public int insertBoardNote(@RequestBody BoardNoteVO boardNote, HttpSession session) {
		return boardNoteService.insertBoardNote(boardNote);
	}
	
	@PatchMapping("/newworlds/{bnNum}")
	@ResponseBody
	public int updateBoardNote(@RequestBody BoardNoteVO boardNote, @PathVariable("bnNum") int bnNum) {
		return boardNoteService.updateBoardNote(bnNum);
	}
	
	@DeleteMapping("/newworlds/{bnNum}")
	@ResponseBody
	public int deleteBoardNote(@RequestBody int bnNum) {
		return boardNoteService.deleteBoardNote(bnNum);
	}
	
	@GetMapping("/prev-note/{bnNum}")
	@ResponseBody
	public BoardNoteVO selectPrevNote(@PathVariable("bnNum")int bnNum) {
		return boardNoteService.selectPrevNote(bnNum);
	}
	
	@GetMapping("/next-note/{bnNum}")
	@ResponseBody
	public BoardNoteVO selectNextNote(@PathVariable("bnNum")int bnNum) {
		return boardNoteService.selectNextNote(bnNum);
	}
}
