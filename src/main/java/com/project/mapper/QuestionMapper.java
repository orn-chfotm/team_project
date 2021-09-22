package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.domain.Criteria;
import com.project.domain.QuestionAnswerVO;
import com.project.domain.QuestionVO;

public interface QuestionMapper {
	
	//리스트 페이징
	public List<QuestionVO> getListWithPaging(Criteria cri);
	//글등록
	public int write(QuestionVO questionvo);
	//업데이트
	public int update(QuestionVO questionvo);
	//상세보기
	public QuestionVO detail(int no);
	
	//리스트 갯수//
	public int getTotal(Criteria cri);
	
	///삭제//
    public int delete(QuestionVO questionvo);
	//조회수
	public void cnt(int question_no);
	
	public void review(QuestionAnswerVO questionanswervo);
	
	public List<QuestionAnswerVO> getAnswer(int no);

	public int answer_delete(QuestionAnswerVO questionanswervo);
	
	public int answer_Update(QuestionAnswerVO questionanswervo);
}

