package com.project.service;

import java.util.List;

import com.project.domain.BoardAttachVO;
import com.project.domain.Criteria;
import com.project.domain.GenderDTO;
import com.project.domain.MeetingListDTO;
import com.project.domain.MeetingSelectVO;
import com.project.domain.MeetingVO;
import com.project.domain.ReplyVO;


public interface BoardService {
	
	public void insert(MeetingVO meetingvo);
	
	public MeetingListDTO list();
	
	public List<BoardAttachVO> listAttach(int no);
	
	public MeetingVO detail(int no);
	
	public MeetingListDTO detailList(int no);
	
	public int getTotal(Criteria cri);
	
	public MeetingListDTO getListWithPaging(Criteria cri);
	
	public List<ReplyVO> getReplyList(String meet_num);
	
	public boolean writeReply(ReplyVO vo);
	
	public boolean update(MeetingVO meetingvo);
	
	public boolean deleteReply(ReplyVO vo);
	
	public boolean modifyReply(ReplyVO vo);
	
	public int getTotalReply(int no);
	
	public void meetcounting(int no);
	
	public GenderDTO countGender();
	
	public boolean selectcheck(MeetingSelectVO meetingselectvo);
	
	public boolean selectdelete(MeetingSelectVO meetingselectvo);
	
	public boolean meetingselect(MeetingSelectVO meetingselectvo);
	
	// 게시글 삭제
	public boolean postDelete(MeetingVO meetingvo);
}
