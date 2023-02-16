package xyz.tour.newworld.service.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xyz.tour.newworld.mapper.board.BoardNoteMapper;
import xyz.tour.newworld.vo.board.BoardNoteVO;

@Service
public class BoardNoteService {
	@Autowired
	public BoardNoteMapper boardNoteMapper;
	
	public List<BoardNoteVO> seachBoardNoteList(BoardNoteVO boardNote) {
		List<BoardNoteVO> boardList = boardNoteMapper.seachBoardNoteList(boardNote);
		if(boardList == null) {
			return new ArrayList<BoardNoteVO>();
		}
		return boardList;
	}
	public BoardNoteVO selectBoardNote(int bnNum) {
		return boardNoteMapper.selectBoardNote(bnNum);
	}
	
	public int insertBoardNote(BoardNoteVO boardNote) {
		return boardNoteMapper.insertBoardNote(boardNote);
	}
	
	public int updateBoardNote(int bnNum) {
		return boardNoteMapper.updateBoardNote(bnNum);
	}
	public int deleteBoardNote(int bnNum) {
		return boardNoteMapper.deleteBoardNote(bnNum);
	}
	
	public BoardNoteVO selectPrevNote(int bnNum) {
		return boardNoteMapper.selectPrevNote(bnNum);
	}
	
	public BoardNoteVO selectNextNote(int bnNum) {
		return boardNoteMapper.selectNextNote(bnNum);
	}
}
