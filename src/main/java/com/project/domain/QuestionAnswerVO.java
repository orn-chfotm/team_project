package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class QuestionAnswerVO {
	// 문의 사항 답변 번호
	private int content_no;
	//게시글 번호
	private int question_no;
	// 문의 사항 답변 내용
	private String answer_content;
	// 문의 사항 답변 작성일
	private String answer_date;

	
}
