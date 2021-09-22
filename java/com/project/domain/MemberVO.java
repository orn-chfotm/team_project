package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class MemberVO {
	// 회원 아이디
	private String user_id;
	// 회원 비밀번호
	private String user_pw;
	// 회원 이름 
	private String user_name;
	// 회원 성별
	private String user_gender;
	// 회원 생년월일
	private String user_birth;
	// 회원 모임 관심주소
	private String user_location;
	// 회원 관심사 
	private String hobby;
	// 회원 권한
	private String authority;
}
