package com.project.mapper;

import com.project.domain.MemberVO;

public interface MemberMapper {
	public int sign(MemberVO membervo);

	public String login(MemberVO membervo);

	public int checkID(String user_id);

	public MemberVO userInfo(String user_id);
}
