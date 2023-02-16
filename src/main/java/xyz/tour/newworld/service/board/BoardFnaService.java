package xyz.tour.newworld.service.board;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.tour.newworld.mapper.board.BoardFnaMapper;
import xyz.tour.newworld.vo.board.BoardFnaVO;

@Service
public class BoardFnaService {
	@Autowired
	public BoardFnaMapper boardFnaMapper;
	
	public List<BoardFnaVO> seachBoardFnaList(BoardFnaVO boardFna){
		return boardFnaMapper.seachBoardFnaList(boardFna);
	}
	public BoardFnaVO selectBoardFna(int bfNum) {
		return boardFnaMapper.selectBoardFna(bfNum);
	}
	public int insertBoardFna(BoardFnaVO boardFna) {
		return boardFnaMapper.insertBoardFna(boardFna);
	}
	public int updateBoardFna(int bfNum) {
		return boardFnaMapper.updateBoardFna(bfNum);
	}
	public int deleteBoardFna(int bfNum) {
		return boardFnaMapper.deleteBoardFna(bfNum);
	}
	
	public BoardFnaVO selectPrevFna(int bfNum) {
		return boardFnaMapper.selectPrevFna(bfNum);
	}
	
	public BoardFnaVO selectNextFna(int bfNum) {
		return boardFnaMapper.selectNextFna(bfNum);
	}
}
