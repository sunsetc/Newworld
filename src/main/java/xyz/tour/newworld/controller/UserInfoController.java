package xyz.tour.newworld.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import lombok.extern.slf4j.Slf4j;
import xyz.tour.newworld.service.EmailService;
import xyz.tour.newworld.service.UserInfoService;
import xyz.tour.newworld.util.SHA256;
import xyz.tour.newworld.vo.UserInfoVO;

@Controller
@Slf4j
public class UserInfoController {

	@Autowired
	private UserInfoService userInfoService;
	
	@Autowired
	private EmailService emailService;
	
	@GetMapping("/userinfo/{uiNum}")	//예약상세페이지에서 유저정보 불러오기
	@ResponseBody
	public UserInfoVO selectUserInfo(@PathVariable("uiNum") int uiNum) {
		return userInfoService.selectUserInfo(uiNum);
	}
	
	@GetMapping("/logout")					//로그아웃
	@ResponseBody
	public boolean logout(UserInfoVO userInfo, HttpSession session) {
		session.invalidate();
		return true;
	}
	
	@GetMapping("/userinfos/check/{uiId}")	//아이디 중복확인
	@ResponseBody
	public boolean existUserId(@PathVariable("uiId") String uiId) {
		return userInfoService.existsUserId(uiId);
	}
	
	@PostMapping("/userinfos")				//회원가입
	@ResponseBody
	public int addUserInfo(@RequestBody UserInfoVO userInfo) {
		return userInfoService.insertUserInfo(userInfo);
	}
	
	@PostMapping("/login")					//로그인
	@ResponseBody
	public UserInfoVO login(@RequestBody UserInfoVO userInfo, HttpSession session) {
		UserInfoVO loginUserInfo = userInfoService.login(userInfo);
		if(loginUserInfo != null) {
			session.setAttribute("userInfo", loginUserInfo);
			loginUserInfo.setUiPwd(null);
		}
		return loginUserInfo;
	}
	
	@PostMapping("/userinfos/{uiId}")		//개인정보 수정 비밀번호 확인
	@ResponseBody
	public boolean checkPassword(@RequestBody UserInfoVO userInfo, @PathVariable("uiId") String uiId) {
		return userInfoService.checkPassword(userInfo, uiId);
	}
	
	@PatchMapping("/userinfos/{uiNum}")		//개인정보 수정(session 정보와 불일치시 접근 제한)
	@ResponseBody
	public boolean modifyUserInfo(@RequestBody UserInfoVO userInfo, @PathVariable("uiNum") int uiNum, HttpSession session) {
		UserInfoVO sessionUserInfo = (UserInfoVO) session.getAttribute("userInfo");
		if(sessionUserInfo==null || sessionUserInfo.getUiNum()!=uiNum) {
			throw new RuntimeException("잘못된 정보 수정 입니다.");
		}
		userInfo.setUiNum(uiNum);
		return userInfoService.updateUserInfo(userInfo, session);
	}
	
	@GetMapping("/oauth")		//이메일 인증번호 전송
	public String oauth(@RequestParam("code")String code, Model model) {
		log.info("code=>{}", code);
		RestTemplate restTemplate = new RestTemplate();
		String url = "https://kauth.kakao.com/oauth/token";
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

		MultiValueMap<String, String> map= new LinkedMultiValueMap<String, String>();
		map.add("grant_type", "authorization_code");
		map.add("client_id", "	427e6ee6922b20a4ab9ff3dce6993391");
		map.add("redirect_uri", "http://localhost/oauth");
		map.add("code", "code");

		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(map, headers);

		ResponseEntity<String> res = restTemplate.postForEntity(url, code, String.class);
		return "views/kakao/oauth";
	}
	


	@DeleteMapping("/userinfos/{uiNum}")	//회원 탈퇴
	@ResponseBody
	public int deleteUserInfo(@PathVariable("uiNum") int uiNum, HttpSession session) {
		return userInfoService.deleteUserInfo(uiNum, session);
	}
	
	@GetMapping("/check/possible/{uiNum}")
	@ResponseBody
	public List<UserInfoVO> checkDeletePossible(@PathVariable("uiNum")int uiNum){  //탈퇴 가능 여부 확인
		return userInfoService.checkDeletePossible(uiNum);
	}
	

	@GetMapping("/userinfos/email")	//이메일 인증
	@ResponseBody
	public String emailCheck(String email) {
		return emailService.mailCheck(email);
	}

	
	@PatchMapping("/update-pwd/{uiNum}")	//비밀번호 변경
	@ResponseBody
	public int updatePwd(@RequestBody UserInfoVO userInfo, @PathVariable("uiNum") int uiNum, HttpSession session) {
		UserInfoVO sessionUserInfo = (UserInfoVO) session.getAttribute("userInfo");
		if(sessionUserInfo==null || sessionUserInfo.getUiNum()!=uiNum) {
			throw new RuntimeException("잘못된 비밀번호 수정 입니다.");
		}
		userInfo.setUiNum(uiNum);
		return userInfoService.updateUserInfoOfPwd(userInfo, session);
	}
	
	@GetMapping("/find-id")  //아이디 찾기
	@ResponseBody
	public List<UserInfoVO> findId(@ModelAttribute UserInfoVO userInfoVO){
		return userInfoService.findId(userInfoVO);
	}
	
	@GetMapping("/checkEmail-id/{uiId}")  //아이디로 이메일 확인
	@ResponseBody
	public UserInfoVO checkEmailById(@PathVariable("uiId") String uiId) {
		return userInfoService.checkEmailById(uiId);
	}
	
	@GetMapping("/checkEmail-name/{uiName}")
	@ResponseBody
	public List<UserInfoVO> checkEmailByName(@PathVariable("uiName") String uiName) {  //이름으로 이메일 확인
		return userInfoService.checkEmailByName(uiName);
	}
	
	@GetMapping("/userinfos/pwd")	//임시 비밀번호 발급
	@ResponseBody
	public String temporaryPwd(String email, String uiId) {
		return emailService.temporaryPwd(email, uiId);
	}
	
	@PatchMapping("/change-email/{uiNum}") //개인정보 수정 이메일 인증
	@ResponseBody
	public boolean changeEmail(@RequestBody UserInfoVO userInfo, @PathVariable("uiNum") int uiNum, HttpSession session) {
		userInfo.setUiNum(uiNum);
		return userInfoService.updateEmail(userInfo, session);
	}
}
