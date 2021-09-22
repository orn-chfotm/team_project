package com.project.service;

import org.springframework.stereotype.Service;

import com.project.domain.MemberVO;
import com.project.mapper.MemberMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class UserMemberServiceImpl implements UserMemberService {
	
	MemberMapper memberMapper;
	
	// 회원 가입
	@Override
	public boolean sign(MemberVO membervo) {
		return memberMapper.sign(membervo) == 1;
	}

	// pw 가져오기
	@Override
	public String login(MemberVO membervo) {
		return memberMapper.login(membervo);
	}

	// 아이디 중복 체크
	@Override
	public boolean checkID(String user_id) {
		return memberMapper.checkID(user_id) != 1;
	}

	@Override
	public MemberVO userInfo(String user_id) {
		return memberMapper.userInfo(user_id);
	}
}
