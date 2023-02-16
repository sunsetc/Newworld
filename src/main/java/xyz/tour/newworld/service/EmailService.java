package xyz.tour.newworld.service;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import xyz.tour.newworld.mapper.UserInfoMapper;
import xyz.tour.newworld.util.SHA256;
import xyz.tour.newworld.vo.UserInfoVO;

@Service
@AllArgsConstructor
@ResponseBody
@Slf4j
public class EmailService {

	private final JavaMailSender javaMailSender;
	@Autowired
	private UserInfoMapper userInfoMapper;
	
	public String mailCheck(String email) {
		Random random = new Random();
		String key = "";
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email);
		message.setFrom("wndud2070@naver.com");
		
		for(int i = 0; i < 3; i++) {
			int index = random.nextInt(25)+65;
			
			key += (char)index;
		}
		int numIndex = random.nextInt(9999)+1000;
		
		key += numIndex;
		message.setSubject("인증 번호 전송");
		message.setText("인증 번호 : " + key);
		
		javaMailSender.send(message);
		return key;
	}
	
	
	
	
	public String temporaryPwd(String email, String uiId) {   //임시 비밀번호 전송
		String key = "";
		
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
		int idx = 0;
		for(int i = 0; i < 15; i++) {
			idx = (int) (charSet.length * Math.random());
			key += charSet[idx];
		}
		String str = key;
		
		if(uiId != null) {
			UserInfoVO userInfo = new UserInfoVO();
			userInfo.setUiId(uiId);
			String uiPwd = str;
			String encodePwd = SHA256.encode(uiPwd);
			userInfo.setUiPwd(encodePwd);
			log.debug("pwd=>{}",encodePwd);
			userInfoMapper.updateTemporaryPwd(userInfo);
			log.debug("update result=>{}",userInfoMapper.updateTemporaryPwd(userInfo));
		}else {
			throw new RuntimeException("아이디 공백.");
		}
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email);
		message.setFrom("wndud2070@naver.com");
		
		message.setSubject("임시 비밀번호 발급");
		message.setText(
				"비밀번호 찾기를 통한 임시 비밀번호 입니다.\r\n"
				+ "임시 비밀번호: " + str 
				+ "\r\n해당 임시 비밀번호로 로그인 후 비밀번호를 변경해 주시기 바랍니다.");
		
		javaMailSender.send(message);
		return str;
	}
}
