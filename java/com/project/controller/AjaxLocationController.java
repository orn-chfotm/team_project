package com.project.controller;


import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.domain.Criteria;
import com.project.domain.LocationPageDTO;
import com.project.domain.LocationReplyPageDTO;
import com.project.domain.LocationReplyVO;
import com.project.domain.PageDTO;
import com.project.service.LocationService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@AllArgsConstructor
@RequestMapping("/Location/ajax/")
public class AjaxLocationController {

	private LocationService locationService;
	@PostMapping(value="/information",produces={MediaType.APPLICATION_JSON_UTF8_VALUE},consumes="application/json")
	public ResponseEntity<LocationPageDTO> getList(@RequestBody Criteria cri){
		
		log.info("Criteria"+cri);
		int cnt=locationService.getCountLocation(cri);
		PageDTO pageMaker=new PageDTO(cri,cnt);
		LocationPageDTO locationPageDTO=new LocationPageDTO(locationService.getList(cri),pageMaker);
		
		return new ResponseEntity<>(locationPageDTO,HttpStatus.OK);
	}
	
	@GetMapping(value="/getReplyList/{location_num}/{page}",produces= {MediaType.APPLICATION_JSON_UTF8_VALUE,MediaType.APPLICATION_ATOM_XML_VALUE})
	public ResponseEntity<LocationReplyPageDTO> getReplyList(@PathVariable("page") int page,@PathVariable("location_num") int location_num){
		Criteria cri = new Criteria(page,10);
		
		log.info("get Reply List location_num: "+location_num);
		
		return new ResponseEntity<>(locationService.getReplyList(cri,location_num),HttpStatus.OK);
	}
	
	@PostMapping(value="/writeReply",produces= {MediaType.TEXT_PLAIN_VALUE},consumes="application/json")
	public ResponseEntity<String> writeReply(@RequestBody LocationReplyVO vo){
		log.info(vo);
		return locationService.writeReply(vo)==1 ? new ResponseEntity<>("Successfully complete write comment!",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value="/deleteReply",produces= {MediaType.TEXT_PLAIN_VALUE},consumes="application/json")
	public ResponseEntity<String> deleteReply(@RequestBody LocationReplyVO vo){
		log.info(vo);
		return locationService.deleteReply(vo)==1 ? new ResponseEntity<>("Successfully complete delete",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PutMapping(value="/modifyReply",produces= {MediaType.TEXT_PLAIN_VALUE},consumes="application/json")
	public ResponseEntity<String> updateReply(@RequestBody LocationReplyVO vo){
		log.info(vo);
		return locationService.modifyReply(vo)==1 ? new ResponseEntity<>("SuccessFully complete update!",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
