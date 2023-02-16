package xyz.tour.newworld.mapper.board;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import xyz.tour.newworld.vo.board.BoardNoteVO;

@Mapper
public interface BoardNoteMapper {
	List<BoardNoteVO> seachBoardNoteList(BoardNoteVO boardNote);
	BoardNoteVO selectBoardNote(int bnNum);
	int insertBoardNote(BoardNoteVO boardNote);
	int updateBoardNote(int bnNum);
	int deleteBoardNote(int bnNum);
	BoardNoteVO selectPrevNote(int bnNum);
	BoardNoteVO selectNextNote(int bnNum);
}
