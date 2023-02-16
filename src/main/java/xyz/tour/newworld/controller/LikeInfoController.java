package xyz.tour.newworld.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import xyz.tour.newworld.service.LikeInfoService;
import xyz.tour.newworld.vo.LikeInfoVO;
import xyz.tour.newworld.vo.UserInfoVO;

@Controller
public class LikeInfoController {

	@Autowired
	private LikeInfoService likeInfoService;
	
	@GetMapping("/likelist/{uiId}")
	@ResponseBody
	public List<LikeInfoVO> selectLikeInfos(LikeInfoVO likeInfoVO, @PathVariable("uiId") String uiId, HttpSession session){
		likeInfoVO.setUiId(uiId);
		return likeInfoService.selectLikeInfos(uiId);
	}
	
	@GetMapping("/hasLikeCheck/{giCode}")
	@ResponseBody
	public LikeInfoVO selectLikeInfo(LikeInfoVO likeInfoVO, @PathVariable("giCode") String giCode, HttpSession session) {
		likeInfoVO.setGiCode(giCode);
		return likeInfoService.selectLikeInfo(likeInfoVO, session);
	}
	
	@PostMapping("/likeCheck")
	@ResponseBody
	public int insertLikeInfo(@RequestBody LikeInfoVO likeInfoVO, HttpSession session) {
		UserInfoVO userInfo = (UserInfoVO)session.getAttribute("userInfo");
		if(userInfo == null) {
			throw new RuntimeException("찜하기는 로그인이 필요합니다");
		}
		likeInfoVO.setUiId(userInfo.getUiId());
		return likeInfoService.insertLikeInfo(likeInfoVO);
	}
	
	@DeleteMapping("/offLikeCheck/{uiId}/{giCode}")
	@ResponseBody
	public int deleteLikeInfo(@PathVariable("uiId")String uiId, @PathVariable("giCode")String giCode) {
		return likeInfoService.deleteLikeInfoByUserIdAndGiCode(uiId, giCode);
	}
}
