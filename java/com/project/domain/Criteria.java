package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class Criteria {
	private int pageNum;//페이지번호
	private int amount; //페이지당 글의 수
	private String type;
	private String keyword;
	private String subject;
	
	public Criteria() {
		this(1,8); // 페이지번호 1, amount 8
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum=pageNum;
		this.amount=amount;
	}
	
//	public Criteria(int pageNum,int amount,String subject) {
//		this.pageNum=pageNum;
//		this.amount=amount;
//		this.subject=subject;
//	}
	
	public String[] getTypeArr() {
	    return type == null? new String[] {}: type.split("");
	}
	
	public String[] getSubjectArr() {
		return subject == null? new String[] {}:subject.split("");
	}
}
