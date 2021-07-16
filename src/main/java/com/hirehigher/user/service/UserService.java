package com.hirehigher.user.service;

import java.util.ArrayList;

import com.hirehigher.command.UserVO;

public interface UserService {
	
	public UserVO login(UserVO vo);//로그인
	public ArrayList<UserVO> findIdA(String userName, String birthDay);//생년월일로 아이디찾기
	public int idCheck(String userId);//아이디 중복확인
	public int nickNameCheck(String nickName);//닉네임 중복확인
	public int emailCheck(String userEmail);//이메일 중복확인
	public int join(UserVO vo);//회원가입
	public UserVO getUserInfo(String userId);//유저정보+글정보
}
