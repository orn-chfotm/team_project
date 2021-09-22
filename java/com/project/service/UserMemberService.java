package com.project.service;

import com.project.domain.MemberVO;

public interface UserMemberService {
	public boolean sign(MemberVO membervo);

	public String login(MemberVO membervo);

	public boolean checkID(String user_id);
	
	public MemberVO userInfo(String user_id);
}
