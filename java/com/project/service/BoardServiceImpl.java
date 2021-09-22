package com.project.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.BoardAttachVO;
import com.project.domain.Criteria;
import com.project.domain.GenderDTO;
import com.project.domain.MeetingListDTO;
import com.project.domain.MeetingSelectVO;
import com.project.domain.MeetingVO;
import com.project.domain.ReplyVO;
import com.project.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class BoardServiceImpl implements BoardService {
 
	BoardMapper boardMapper;
	
	@Transactional
	@Override
	public void insert(MeetingVO meetingvo) {
		// log.info(meetingvo);
		boardMapper.insert(meetingvo);
		
		if(meetingvo.getAttach_list() == null || meetingvo.getAttach_list().size() <= 0) {
			return;
		}
		
		meetingvo.getAttach_list().forEach(attach -> {
			attach.setMeet_num(meetingvo.getMeet_num());
			boardMapper.insertAttach(attach);
		});
	} 
	

	@Override
	public MeetingListDTO list() {
		// log.info(boardMapper.list());
		return new MeetingListDTO(boardMapper.list());
	}

	@Override
	public MeetingVO detail(int no) {
		// log.info(boardMapper.detail(no));
		return boardMapper.detail(no);
	}

	@Override
	public MeetingListDTO detailList(int no) {
		// log.info(boardMapper.detailList(no));
		return new MeetingListDTO(boardMapper.detailList(no));
	}
	@Override
	public List<BoardAttachVO> listAttach(int no) {
		log.info(boardMapper.findByBno(no));
		return boardMapper.findByBno(no);
	}
	@Override
	public int getTotal(Criteria cri) {
		return boardMapper.getTotal(cri);
	}


	@Override
	public MeetingListDTO getListWithPaging(Criteria cri) {
		log.info(cri);
		return new MeetingListDTO(boardMapper.getListWithPaging(cri));
	}


	@Override
	public List<ReplyVO> getReplyList(String meet_num) {
		return boardMapper.getReplyList(meet_num);
	}


	@Override
	public boolean writeReply(ReplyVO vo) {
		// TODO Auto-generated method stub
		return boardMapper.writeReply(vo)==1;
	}
	
	@Override
	public boolean update(MeetingVO meetingvo) {
		
		return boardMapper.update(meetingvo) == 1;
	}


	@Override
	public boolean deleteReply(ReplyVO vo) {
		// TODO Auto-generated method stub
		return boardMapper.deleteReply(vo)==1;
	}


	@Override
	public boolean modifyReply(ReplyVO vo) {
		// TODO Auto-generated method stub
		return boardMapper.modifyReply(vo)==1;
	}


	@Override
	public int getTotalReply(int no) {
		// TODO Auto-generated method stub
		return boardMapper.getTotalReply(no);
	}
	
	// 게시글 삭제
	@Override
	public boolean postDelete(MeetingVO meetingvo) {
		return boardMapper.postDelete(meetingvo)==1;
	}
	
	// 조회 수
	@Override
	public void meetcounting(int no) {
		boardMapper.meetcounting(no);
	}
	
	@Override
	public GenderDTO countGender() {
		// TODO Auto-generated method stub
		return boardMapper.gender();
	}
	
	@Override
	public boolean meetingselect(MeetingSelectVO meetingselectvo) {
		return boardMapper.meetingselect(meetingselectvo)==1;
		
	} 


	@Override
	public boolean selectcheck(MeetingSelectVO meetingselectvo) {
		log.info(boardMapper.selectcheck(meetingselectvo));
		return boardMapper.selectcheck(meetingselectvo) != 1;
	}


	@Override
	public boolean selectdelete(MeetingSelectVO meetingselectvo) {
		
		return boardMapper.selectdelete(meetingselectvo) ==1;
	}
	
}
