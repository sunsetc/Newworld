package xyz.tour.newworld.mapper.board;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import xyz.tour.newworld.vo.board.BoardFnaVO;

@Mapper
public interface BoardFnaMapper {
	List<BoardFnaVO> seachBoardFnaList(BoardFnaVO boardFna);
	BoardFnaVO selectBoardFna(int bfNum);
	int insertBoardFna(BoardFnaVO boardFna);
	int updateBoardFna(int bfNum);
	int deleteBoardFna(int bfNum);
	BoardFnaVO selectPrevFna(int bfNum);
	BoardFnaVO selectNextFna(int bfNum);
}
