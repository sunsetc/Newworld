package xyz.tour.newworld.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xyz.tour.newworld.mapper.LikeInfoMapper;
import xyz.tour.newworld.vo.LikeInfoVO;
import xyz.tour.newworld.vo.UserInfoVO;

@Service
public class LikeInfoService {

	@Autowired
	private LikeInfoMapper likeInfoMapper;
	
	public List<LikeInfoVO> selectLikeInfos(String uiId) {
		return likeInfoMapper.selectLikeInfos(uiId);
	}
	
	public LikeInfoVO selectLikeInfo(LikeInfoVO likeInfoVO, HttpSession session) {
		UserInfoVO userInfo = (UserInfoVO)session.getAttribute("userInfo");
		if(userInfo == null) {
			likeInfoVO.setUiId(null);
			
		}else if(userInfo != null) {
			likeInfoVO.setUiId(userInfo.getUiId());
		}
		return likeInfoMapper.selectLikeInfo(likeInfoVO);
	}
	
	public int insertLikeInfo(LikeInfoVO likeInfoVO) {
		LikeInfoVO getLike = likeInfoMapper.selectLikeInfo(likeInfoVO);
		if(getLike != null) {	//null이 아니라면 이미 데이터가 (찜이 되어있음) 존재하는 경우
			throw new RuntimeException("이미 찜 목록에 추가되어 있는 상품입니다.");
		}else if(getLike == null) {
			likeInfoMapper.insertLikeInfo(likeInfoVO);
		}
		return 1;
	}
	
	public int deleteLikeInfoByUserIdAndGiCode(String uiId, String foGiCode) {//해외 찜하기 삭제
		
		return likeInfoMapper.deleteLikeInfoByUserIdAndGiCode(uiId, foGiCode);
	}
}
