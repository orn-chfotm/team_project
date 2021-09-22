package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.domain.Criteria;
import com.project.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("*")
@AllArgsConstructor
public class IndexController {
	
	BoardService boardService;
	
	@GetMapping("/")
	public String goIndex() {
		return "redirect:/index";
	}
	
	@GetMapping("/index")
	public void index(Model model, Criteria cri) {
		cri.setSubject("P");
		model.addAttribute("popularList", boardService.getListWithPaging(cri).getList());
		cri.setSubject("S");
		model.addAttribute("studyList", boardService.getListWithPaging(cri).getList());
		cri.setSubject("E");
		model.addAttribute("exerciseList", boardService.getListWithPaging(cri).getList());
		cri.setSubject("C");
		model.addAttribute("classList", boardService.getListWithPaging(cri).getList());
		cri.setSubject("H");
		model.addAttribute("volunteerList", boardService.getListWithPaging(cri).getList());
	}
	
	@GetMapping("/login")
	public String login() {
		return "redirect:/Member/login";
	}
	
	@GetMapping("/findUserID")
	public String findUserID() {
		return "redirect:/Member/findUserID";
	}
	
	@GetMapping("/findUserPW")
	public String findUserPW() {
		return "redirect:/Member/findUserPW";
	}
	
	@GetMapping("/sign")
	public String sign() {
		return "redirect:/Member/sign";
	}
	
	@GetMapping("Admin")
	public String admin() {
		return "redirect:/Admin/adminHome";
	}
	
	@GetMapping("/Location")
	public String location() {
		return "redirect:/Location/map";
	}
	
	@GetMapping("/Board")
	public String board() {
		return "redirect:/Board/popular";
	}
	
	@GetMapping("/Question")
	public String question() {
		return "redirect:/Question/list";
	}
	
}
