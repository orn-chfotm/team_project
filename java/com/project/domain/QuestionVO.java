package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class QuestionVO {
	// 문의 사항 등록 번호 
	private int question_no;
	// 문의사항 번호
	private int no;
	// 문의 사항 제목
	private String question_title;
	// 문의 사항 내용
	private String question_content;
	// 문의 사항 종류 - 타입
	private String question_type;
	// 문의 사항 작성일
	private String question_date;
	// 문의 사항 답변 여부
	private String question_answer;
	// 문의 사항 조회
	
	//사용자 ID
	private String user_id;
	
	//조회수
	private int cnt;
	//댓글수
	private int replycount;
}
