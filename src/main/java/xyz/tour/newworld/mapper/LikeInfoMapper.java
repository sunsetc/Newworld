package xyz.tour.newworld.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import xyz.tour.newworld.vo.LikeInfoVO;

public interface LikeInfoMapper {
	
	
	List<LikeInfoVO> selectLikeInfos(String uiId);	//찜한 목록은 user의 id로 불러온다
	int insertLikeInfo(LikeInfoVO likeInfoVO);	//찜하기 누르면 insert 실행
	int deleteLikeInfoByUserIdAndGiCode(@Param("uiId") String uiId, @Param("giCode") String giCode);	//찜하기 해제시 delete실행 해외
	LikeInfoVO selectLikeInfo(LikeInfoVO likeInfoVO);

}
