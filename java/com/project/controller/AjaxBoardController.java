package com.project.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.domain.ReplyVO;
import com.project.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@AllArgsConstructor
@RequestMapping("/Board/ajax")
public class AjaxBoardController {

	private BoardService boardService;
	//댓글 리스트 출력
	@GetMapping(value="/getReplyList/{meet_num}",produces= {MediaType.APPLICATION_JSON_VALUE,MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<List<ReplyVO>> getReplyList(@PathVariable ("meet_num") String meet_num){
		log.info(meet_num);
		return new ResponseEntity<>(boardService.getReplyList(meet_num),HttpStatus.OK);
	}
	//댓글 작성
	@PostMapping(value="writeReply",produces= {MediaType.TEXT_PLAIN_VALUE},consumes="application/json")
	public ResponseEntity<String> writeReply(@RequestBody ReplyVO vo){
		log.info("replyData: "+vo);
		return boardService.writeReply(vo) ? new ResponseEntity<>("Successfully writed comment!",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//댓글 삭제
	@DeleteMapping(value="deleteReply",produces= {MediaType.TEXT_PLAIN_VALUE},consumes="application/json")
	public ResponseEntity<String> deleteReply(@RequestBody ReplyVO vo){
		log.info("replyData: "+vo);
		return boardService.deleteReply(vo) ? new ResponseEntity<>("Successfully deleted comment!",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//댓글 수정
	@PatchMapping(value="modifyReply",produces= {MediaType.TEXT_PLAIN_VALUE},consumes="application/json")
	public ResponseEntity<String> modifyReply(@RequestBody ReplyVO vo){
		log.info("replyData: "+vo);
		return boardService.modifyReply(vo) ? new ResponseEntity<>("Successfully updated comment!",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
