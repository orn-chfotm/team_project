package com.project.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.domain.AdminDeleteDTO;
import com.project.domain.AdminPageDTO;
import com.project.domain.Criteria;
import com.project.domain.GenderDTO;
import com.project.domain.MemberVO;
import com.project.domain.PageDTO;
import com.project.domain.TypeDTO;
import com.project.service.AdminService;
import com.project.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
@RequestMapping("/Admin")
public class AdminController {

	AdminService adminService;
	BoardService boardService;
	
	// --------- GetMapping - page ---------
	@GetMapping({"/", "/adminHome"})
	public void adminHome(Model model, GenderDTO genderdto, TypeDTO typedto) {
		model.addAttribute("gender", boardService.countGender());
		model.addAttribute("type", adminService.countType());
	}
	
	
	@GetMapping("/adminManager")
	public void adminManaget() {}
	
	@GetMapping("/adminUser")
	public void adminUser() {}
	
	// Ajax 처리
	@ResponseBody
	@GetMapping(value = "/adminUser/{page}/{amount}",
	produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<AdminPageDTO> userList(@PathVariable("page") int page, @PathVariable("amount") int amount){
		Criteria cri = new Criteria(page, amount);
		return new ResponseEntity<>(adminService.getUser(cri), HttpStatus.OK);
	}
	
	@ResponseBody
	@GetMapping(value = "/userListPages/{page}/{amount}", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<PageDTO> userListPages(@PathVariable("page") int page, @PathVariable("amount") int amount) {
		int total = adminService.getTotal();
		Criteria cri = new Criteria(page,amount);
		return new ResponseEntity<>(new PageDTO(cri, total), HttpStatus.OK);
	}
	
	@ResponseBody
	@DeleteMapping(value = "/deleteUser")
	public ResponseEntity<String> userListPages(@RequestBody AdminDeleteDTO userids) {
		return  adminService.deleteUser(userids) ==1
				?new ResponseEntity<>("성공",HttpStatus.OK)
				:new ResponseEntity<>("실패",HttpStatus.INTERNAL_SERVER_ERROR);
	}
	// Admin Manager
	
	@ResponseBody
	@GetMapping(value = "/adminList")
	public ResponseEntity<AdminPageDTO> adminList() {
		return new ResponseEntity<>(adminService.getAdmin(),HttpStatus.OK);
	}
	
	@ResponseBody 
	@PostMapping(value = "/insetAdmin")
	public ResponseEntity<String> adminList(@RequestBody MemberVO membervo) {
		// 삼항 연산자 -> HttpStatus.OK 이면 Ajax success / INTERNAL_SERVER_ERROR 이면 error
		return adminService.insertAdmin(membervo)==1
				?new ResponseEntity<>("success",HttpStatus.OK)
				:new ResponseEntity<>("failure",HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 관리자 삭제 처리
	@ResponseBody
	// produces 는 문자열(String)을 리턴하기 때문에 MediaType.TEXT_PLAIN_VALUE
	@DeleteMapping(value = "/deleteAdmin")
	// check 를 선택한 adminid(String)들이 배열로 넘어오기 때문에 List<String> 으로 받아준다.
	public ResponseEntity<String> deleteAdmin(@RequestBody AdminDeleteDTO adminids){
		log.info(adminids);
		//return new ResponseEntity<>("성공",HttpStatus.OK);
		// 삼항연산자.
		return  adminService.deleteAdmin(adminids) ==1
				?new ResponseEntity<>("성공",HttpStatus.OK)
				:new ResponseEntity<>("실패",HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 관리자 정보 수정 처리
	// Ajax type put, patch 는 update(수정) 처리를 담당 -> 같은 기능이기에 RequestMapping으로 method를 두개 모두 받게 설정.
	@ResponseBody
	@RequestMapping(value="/updateAdmin",
					method= {RequestMethod.PUT, RequestMethod.PATCH}
					)
	// Modal 창의 adminid, adminpw 두개의 값이 객체로 넘어오기 때문에 AdminVO 를 이용하여 받는다.
	public ResponseEntity<String> updateAdmin(@RequestBody MemberVO membervo) {
		// 삼항연산자.
		return  adminService.updateAdmin(membervo)==1
				?new ResponseEntity<>("success",HttpStatus.OK)
				:new ResponseEntity<>("failure",HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
