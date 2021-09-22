package com.project.service;

import org.springframework.stereotype.Service;

import com.project.domain.Criteria;
import com.project.domain.QuestionAnswerDTO;
import com.project.domain.QuestionAnswerVO;
import com.project.domain.QuestionListDTO;
import com.project.domain.QuestionVO;
import com.project.mapper.QuestionMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class QuestionServiceImpl implements QuestionService {

	QuestionMapper questionMapper;

	@Override
	public QuestionListDTO getListWithPaging(Criteria cri) {
		return new QuestionListDTO(questionMapper.getListWithPaging(cri));
	}

	
	@Override
	public boolean write(QuestionVO questionvo) {
	
		log.info("QuestionVO");
	return questionMapper.write(questionvo) == 1;

	}
	

	@Override
	public boolean update(QuestionVO questionvo) {

		return questionMapper.update(questionvo) == 1;

	}

	
	@Override
	public QuestionVO detail(int no) {
		return questionMapper.detail(no);
	}
	

	@Override
	public int getTotal(Criteria cri) {
		return questionMapper.getTotal(cri);
	}


	@Override
	   public boolean delete(QuestionVO questionvo) {
	      
	      return questionMapper.delete(questionvo) ==1 ;
	   }



	@Override
	public void cnt(int question_no) {
		questionMapper.cnt(question_no);
	}


	@Override
	public void review(QuestionAnswerVO questionanswervo) {
		questionMapper.review(questionanswervo);
		
	}


	@Override
	public QuestionAnswerDTO getAnswer(int no) { 
		return new QuestionAnswerDTO(questionMapper.getAnswer(no));
	}
	@Override
	public boolean answer_delete(QuestionAnswerVO questionanswervo) {
		
		return questionMapper.answer_delete(questionanswervo)==1;
	}


	@Override
	public boolean answer_Update(QuestionAnswerVO questionanswervo) {
		
		return questionMapper.answer_Update(questionanswervo)==1;
	} 





		
}



