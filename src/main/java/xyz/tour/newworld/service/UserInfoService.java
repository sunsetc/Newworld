package xyz.tour.newworld.service;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import xyz.tour.newworld.mapper.UserInfoMapper;
import xyz.tour.newworld.util.SHA256;
import xyz.tour.newworld.vo.UserInfoVO;

@Service
@Slf4j
public class UserInfoService {

	@Autowired
	private UserInfoMapper userInfoMapper;
	
	public boolean existsUserId(String uiId) {		//아이디 중복 확인
		if(userInfoMapper.selectUserInfoById(uiId)==null) {
			return false;
		}
		return true;
	}
	
	public int insertUserInfo(UserInfoVO userInfo) {	//회원가입 insert, 암호 복호화
		String uiPwd = userInfo.getUiPwd();
		String encodePwd = SHA256.encode(uiPwd);
		userInfo.setUiPwd(encodePwd);
		return userInfoMapper.insertUserInfo(userInfo);
	}
	
	public UserInfoVO login(UserInfoVO userInfo) {	//로그인 아이디 패스워드 가져오기
		String uiPwd = userInfo.getUiPwd();
		String encodePwd = SHA256.encode(uiPwd);
		userInfo.setUiPwd(encodePwd);
		log.info("userInfo=>{}", userInfo);
		return userInfoMapper.selectUserInfoByIdAndPwd(userInfo);
	}
	
	public boolean checkPassword(UserInfoVO userInfo, String uiId) {	//개인정보 접근할때 비밀번호 체크
		UserInfoVO tmpUserInfo = userInfoMapper.selectUserInfoById(uiId);
		if(tmpUserInfo != null) {
			String uiPwd = userInfo.getUiPwd();
			String encodePwd = SHA256.encode(uiPwd);
			if(encodePwd.equals(tmpUserInfo.getUiPwd())) {
				return true;
			}
		}
		return false;
	}
	
	public boolean updateUserInfo(UserInfoVO userInfo, HttpSession session) {	//개인정보 수정
		if(userInfoMapper.updateUserInfo(userInfo)==1) {
			UserInfoVO tmpUserInfo = userInfoMapper.selectUserInfo(userInfo.getUiNum());
			session.setAttribute("userInfo", tmpUserInfo);
		}
		return true;
	}
	
	public int deleteUserInfo(int uiNum, HttpSession session) {	//회원 탈퇴
		session.invalidate();
		return userInfoMapper.deleteUserInfo(uiNum);
		
	}
	
	public List<UserInfoVO> checkDeletePossible(int uiNum){  //탈퇴 가능 여부 확인
		return userInfoMapper.checkDeletePossible(uiNum);
	}
	
	public UserInfoVO selectUserInfo(int uiNum) {	//예약 상세페이지에서 유저정보 불러오기
		return userInfoMapper.selectUserInfo(uiNum);
	}
	
	public int updateUserInfoOfPwd(UserInfoVO userInfo, HttpSession session) {	//비밀번호 변경
	
			String uiPwd = userInfo.getUiPwd();
			log.debug("uiPwd=>{}",uiPwd);
			String encodePwd = SHA256.encode(uiPwd);
			userInfo.setUiPwd(encodePwd);
			session.invalidate();
			return userInfoMapper.updateUserInfoOfPwd(userInfo);
			
	}
	
	public List<UserInfoVO> findId(UserInfoVO userInfoVO){  //아이디 찾기
		return userInfoMapper.findId(userInfoVO);
	}
	
	public UserInfoVO checkEmailById(String uiId) {  //아이디로 이메일 확인
		return userInfoMapper.checkEmailById(uiId);
	}
	
	public List<UserInfoVO> checkEmailByName(String uiName) {  //이름으로 이메일 확인
		return userInfoMapper.checkEmailByName(uiName);
	}
	
	public boolean updateEmail(UserInfoVO userInfo, HttpSession session) { //이메일 인증 성공시 uiNum 정보 가져와서 세션에 저장
		if(userInfoMapper.updateEmail(userInfo)==1) {
			UserInfoVO tmpUserInfo = userInfoMapper.selectUserInfo(userInfo.getUiNum());
			session.setAttribute("userInfo", tmpUserInfo);
		}
		return true;
	}

}
