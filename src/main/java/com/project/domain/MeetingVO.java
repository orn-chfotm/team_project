package com.project.domain;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import oracle.sql.DATE;

@Setter
@Getter
@ToString
public class MeetingVO {
	// row number
	private String meet_num;
	// 모임 타입
	private String meet_type;
	// 모임 장소
	private String meet_location;
	// 모임 최대 인원
	private String meet_regulation;
	// 모임 제목
	private String meet_title;
	// 모임 설명 내용
	private String meet_content;
	// 모임 날짜
	private DATE meet_date;
	// 작성 날짜
	private DATE meet_writedate;
	// 모임 대표 이미지 파일 이름
	private String meet_image;
	// 모임 참가 인원
	private String meet_using;
	// 작성자
	private String meet_writer;
	// 모임 조회 수
	private int meet_count;
	// 첨부파일 목록
	private List<BoardAttachVO> attach_list;
	
}
