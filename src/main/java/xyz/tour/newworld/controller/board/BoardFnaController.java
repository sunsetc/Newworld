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

import xyz.tour.newworld.service.board.BoardFnaService;
import xyz.tour.newworld.vo.board.BoardFnaVO;

@Controller
public class BoardFnaController {

	@Autowired
	public BoardFnaService boardFnaService;
	
	@GetMapping("/newworlds/fna")
	@ResponseBody
	public List<BoardFnaVO> seachBoardFna(@ModelAttribute BoardFnaVO boardFna){
		return boardFnaService.seachBoardFnaList(boardFna);
	}
	
	@GetMapping("/newworlds/fna/{bfNum}")
	@ResponseBody
	public BoardFnaVO selectBoardFna(@PathVariable int bfNum) {
		return boardFnaService.selectBoardFna(bfNum);
	}
	
	@PostMapping("/newworlds/fna")
	@ResponseBody
	public int insertBoardFna(@RequestBody BoardFnaVO boardFna, HttpSession session) {
		return boardFnaService.insertBoardFna(boardFna);	
	}
	
	@PatchMapping("/newworlds/{bfNum}")
	@ResponseBody
	public int updateBoardFna(@RequestBody BoardFnaVO boardFna, @PathVariable("bfNum") int bfNum) {
		boardFna.setBfNum(bfNum);
		return boardFnaService.updateBoardFna(bfNum);
	}
	
	@DeleteMapping("/newworlds/{bfNum}")
	@ResponseBody
	public int deleteBoardFna(@RequestBody int bfNum) {
		return boardFnaService.deleteBoardFna(bfNum);
	}
	
	@GetMapping("/prev-fna/{bfNum}")
	@ResponseBody
	public BoardFnaVO selectPrevFna(@PathVariable("bfNum")int bfNum) {
		return boardFnaService.selectPrevFna(bfNum);
	}
	
	@GetMapping("/next-fna/{bfNum}")
	@ResponseBody
	public BoardFnaVO selectNextFna(@PathVariable("bfNum")int bfNum) {
		return boardFnaService.selectNextFna(bfNum);
	}
}
