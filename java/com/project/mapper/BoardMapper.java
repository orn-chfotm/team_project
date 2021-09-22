package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.domain.BoardAttachVO;
import com.project.domain.Criteria;
import com.project.domain.GenderDTO;
import com.project.domain.MeetingSelectVO;
import com.project.domain.MeetingVO;
import com.project.domain.ReplyVO;


public interface BoardMapper {
	
	// 등록
	public int insert(MeetingVO meetingvo);
	
	// 게시판 불러오기
	public List<MeetingVO> list();
	
	// 게시판 사진 불러오기
	public List<BoardAttachVO> listAttach(int no);
	
	// 게시판 상세보기
	public MeetingVO detail(int no);
	
	// 게시판 상세보기 내에서의 게시판
	public List<MeetingVO> detailList(int no);
	
	// 첨부파일 처리(등록)
	public void insertAttach(BoardAttachVO vo);
	
	// 첨부파일 처리(상세보기)
	public List<BoardAttachVO> findByBno(int no);
	
	// 페이징 처리
	public int getTotal(Criteria cri);
	
	//리스트 페이징
	public List<MeetingVO> getListWithPaging(Criteria cri);
	
	//댓글 리스트 출력
	public List<ReplyVO> getReplyList(@Param("meet_num") String meet_num);
	
	//댓글 작성
	public int writeReply(ReplyVO vo);
	
	//댓글 삭제
	public int deleteReply(ReplyVO vo);
	
	//댓글 수정
	public int modifyReply(ReplyVO vo);
	
	//댓글 카운팅
	public int getTotalReply(int no);
	
	// 조회수 증가
	public void meetcounting(int no);
	
	// 수정
	public int update(MeetingVO meetingvo);
	
	//성별비율 처리
	public GenderDTO gender();
	
	// 게시글 삭제
	public int postDelete(MeetingVO meetingvo);
	
	//미팅 선택 등록
	public int meetingselect(MeetingSelectVO meetingselectvo);
	
	public int selectcheck(MeetingSelectVO meetingselectvo);
	
	public int selectdelete(MeetingSelectVO meetingselectvo);
	
}
