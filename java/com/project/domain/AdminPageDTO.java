package com.project.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter 
@AllArgsConstructor
public class AdminPageDTO {
	private List<MemberVO> userList;
}
