package com.project.service;

import com.project.domain.Criteria;
import com.project.domain.QuestionAnswerDTO;
import com.project.domain.QuestionAnswerVO;
import com.project.domain.QuestionListDTO;
import com.project.domain.QuestionVO;

public interface QuestionService {
	
   public QuestionListDTO getListWithPaging(Criteria cri);
   
   public boolean write(QuestionVO questionvo);
   
   public boolean update(QuestionVO questionvo);
   
   public QuestionVO detail(int no);
   
   public int getTotal(Criteria cri);
   
   public boolean delete(QuestionVO questionvo);

   public void cnt(int question_no);

   public void review(QuestionAnswerVO questionanswervo);

   public QuestionAnswerDTO getAnswer(int no);

   public boolean answer_delete(QuestionAnswerVO questionanswervo);
   
   public boolean answer_Update(QuestionAnswerVO questionanswervo);
}
