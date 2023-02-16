package xyz.tour.newworld.mapper;

import java.util.List;

import xyz.tour.newworld.vo.UserInfoVO;

public interface UserInfoMapper {

	UserInfoVO selectUserInfoById(String uiId);					// DB에서 유저 정보 id로 불러오기
	UserInfoVO selectUserInfo(int uiNum);						// DB에서 유저 정보 num으로 불러오기
	UserInfoVO selectUserInfoByIdAndPwd(UserInfoVO userInfo);	// DB에서 id와 pwd로 유저정보 불러오기(로그인)
	int insertUserInfo(UserInfoVO userInfo);					// DB에 입력받은 회원가입 정보 저장(회원가입)
	int updateUserInfo(UserInfoVO userInfo);					// DB에 저장된 회원정보 수정(개인정보 수정)
	int deleteUserInfo(int uiNum);								// DB에 저장된 회원정보 삭제(회원 탈퇴)
	List<UserInfoVO> checkDeletePossible(int uiNum);			// 탈퇴 가능 여부 확인
	int updateUserInfoOfPwd(UserInfoVO userInfo);				// DB에 저장된 암호화된 비밀번호 변경(비밀번호 변경)
	List<UserInfoVO> findId(UserInfoVO userInfoVO);				// 아이디 찾기
	UserInfoVO checkEmailById(String uiId);						// 아이디로 이메일 확인
	List<UserInfoVO> checkEmailByName(String uiName);			// 이름으로 이메일 확인
	int updateTemporaryPwd(UserInfoVO userInfo);				// 임시 비밀번호 변경
	int updateEmail(UserInfoVO userInfo);						// 정보수정 이메일 인증시 입력 이메일로 변경 저장(이메일 변경)
}
