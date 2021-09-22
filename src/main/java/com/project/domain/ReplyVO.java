package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import oracle.sql.DATE;

@Setter
@Getter
public class ReplyVO {
	// 댓글 번호
	private int reply_no;
	// 회원 아이디
	private String user_id;
	//게시글 번호
	private String meet_num;
	// 댓글 내용
	private String reply_content;
	// 댓글 작성일
	private String reply_date;
	
	
}
