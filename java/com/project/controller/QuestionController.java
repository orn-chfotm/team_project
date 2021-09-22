package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.Criteria;
import com.project.domain.PageDTO;
import com.project.domain.QuestionAnswerVO;
import com.project.domain.QuestionVO;
import com.project.service.QuestionService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/Question")
@AllArgsConstructor
@Log4j
public class QuestionController {

	QuestionService questionService;

	// 리스트+페이징
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		model.addAttribute("list", questionService.getListWithPaging(cri).getList());
		int total = questionService.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	// 상세보기
	@GetMapping("/detail/{no}")
	public String detail(Criteria cri, @PathVariable("no") int no, Model model) {
		questionService.cnt(no);
		model.addAttribute("list", questionService.detail(no));
		model.addAttribute("answerList", questionService.getAnswer(no).getList());
		model.addAttribute("cri", cri);
		return "/Question/detail";
	}

	// 글쓰기 페이지
	@GetMapping("/write")
	public void write() {}

	// 글등록
	@PostMapping("/write")
	public String write(QuestionVO questionvo,RedirectAttributes rttr) {
		if (questionService.write(questionvo)) {
			rttr.addFlashAttribute("message", "등록됨");
			return "redirect:/Question/list";
		}else {
			rttr.addFlashAttribute("message", "등록실패");
			return "redirect:/Question/write";
		}
	}

	// 업데이트
	@PostMapping("/update")
	public String update(QuestionVO questionvo, RedirectAttributes rttr) {
		if (questionService.update(questionvo)) {
			rttr.addFlashAttribute("message", "수정완료");
			return "redirect:/Question/detail/" + questionvo.getQuestion_no();
		} else {
			rttr.addFlashAttribute("message", "수정실패");
			return "redirect:/Question/detail/" + questionvo.getQuestion_no();
		}
	}

	@PostMapping("/delete")
	public String delete(QuestionVO questionvo, RedirectAttributes rttr) {
		boolean result = questionService.delete(questionvo);
		if (result) {
			rttr.addFlashAttribute("message", "삭제됨");
			return "redirect:/Question/list";
		} else {
			rttr.addFlashAttribute("message", "SERVER_ERROR");
			return "redirect:/Question/detail";
		}
	}

	// 댓글 달기
	@PostMapping("/review")
	public String review(QuestionAnswerVO questionAnswer) {
		questionService.review(questionAnswer);
		return "redirect:/Question/detail/" + questionAnswer.getQuestion_no();
	}
	@PostMapping("/answer_delete")
	public String answer_delete(QuestionAnswerVO questionAnswervo, RedirectAttributes rttr) {
		if (questionService.answer_delete(questionAnswervo)) {
			rttr.addAttribute("success", "성공");
		} else {
			rttr.addAttribute("fail", "실패");
		}
		return "redirect:/Question/detail/" + questionAnswervo.getQuestion_no();
	}
	
	@PostMapping("/answer_Update")
	public String answer_Update(QuestionAnswerVO questionAnswervo,RedirectAttributes rttr) {
		if(questionService.answer_Update(questionAnswervo)) {
			rttr.addAttribute("success","수정완료");
		}else {
			rttr.addAttribute("fail","실패");
		}
		return "redirect:/Question/detail/" + questionAnswervo.getQuestion_no();
	}
	

}


