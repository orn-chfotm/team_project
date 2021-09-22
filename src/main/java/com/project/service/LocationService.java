package com.project.service;

import java.util.List;

import com.project.domain.Criteria;
import com.project.domain.LocationReplyPageDTO;
import com.project.domain.LocationReplyVO;
import com.project.domain.LocationVO;

public interface LocationService {

	public List<LocationVO> getList(Criteria cri);
	
	public LocationVO getLocation(int location_num);
	
	public int getCountLocation(Criteria cri);
	
	public List<LocationVO> getListAjax();
	
	public LocationReplyPageDTO getReplyList(Criteria cri,int Location_num);
	
	public int writeReply(LocationReplyVO vo);
	
	public int deleteReply(LocationReplyVO vo);
	
	public int modifyReply(LocationReplyVO vo);
}
