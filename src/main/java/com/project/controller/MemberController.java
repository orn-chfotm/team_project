package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.MemberVO;
import com.project.service.UserMemberService;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/Member")
@Log4j
@AllArgsConstructor
public class MemberController {
	//Service
	UserMemberService memberservice;
	
	PasswordEncoder pwencoder;
	
	// 페이징 처리 GET
	@GetMapping("/login")
	public void login() {}
	
	@GetMapping("/sign")
	public void sign() {}
	
	@GetMapping("/userInfo")
	public void userInfo() {}
	
	@GetMapping("/findUserID")
	public String findUserID(Model model) {
		model.addAttribute("type", "ID");
		return "/Member/findUser";
	}
	
	@GetMapping("/findUserPW")
	public String findUserPW(Model model) {
		model.addAttribute("type", "PW");
		return "/Member/findUser";
	}
	
	// ---페이징 처리 GET--- 
	
	//회원가입
	@PostMapping("/sign")
	public String sign(MemberVO membervo, RedirectAttributes rttr) {
		membervo.setUser_pw(pwencoder.encode(membervo.getUser_pw()));
		if(memberservice.sign(membervo)) {
			rttr.addFlashAttribute("message", "회원가입 성공");
			return "redirect:/";
		}else {
			rttr.addFlashAttribute("message", "회원가입 실패");
			return "redirect:/sign";
		}
	}
	
	// 로그인
	@PostMapping("/login")
	public String login(MemberVO membervo, HttpServletRequest request, RedirectAttributes rttr) {
		if(pwencoder.matches(membervo.getUser_pw(), memberservice.login(membervo))) {
			HttpSession session = request.getSession();
			session.setAttribute("userid", membervo.getUser_id());
			log.info(memberservice.userInfo(membervo.getUser_id()));
			MemberVO memberInfo = memberservice.userInfo(membervo.getUser_id());
			memberInfo.setUser_pw("");
			session.setAttribute("userInfo", memberInfo);
			return "redirect:/"; 
		}else {
			rttr.addFlashAttribute("message", "가입되지 않은 회원입니다.");
			return "redirect:/index";
		}
	}
	
	// 로그아웃 세션 제거
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("userid");
		return "redirect:/";
	}
	
	// 아이디 중복 체크
	@ResponseBody
	@GetMapping(value = "/checkID/{id}")
	public ResponseEntity<String> checkID(@PathVariable("id") String user_id) {
		try {
			if(memberservice.checkID(user_id)) {
				return new ResponseEntity<>("사용가능", HttpStatus.OK);
			}else {
				return new ResponseEntity<>("사용불가", HttpStatus.OK);
			}
		}catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
}	
