package xyz.tour.newworld.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserInfoVO {

	private int uiNum;			//유저 번호
	private String uiId;		//유저 아이디
	private String uiPwd;		//유저 비밀번호
	private String uiName;		//유저 이름
	private String uiEmail;		//유저 이메일
	private String uiZip;		//유저 우편번호
	private String uiAddr1;		//유저 주소1
	private String uiAddr2;		//유저 주소2
	private String uiPhone;		//유저 핸드폰번호
	private String uiGender;	//유저 성별
	private String uiBirth;		//유저 생년월일
}
