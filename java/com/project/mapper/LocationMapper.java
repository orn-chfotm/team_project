package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.domain.Criteria;
import com.project.domain.LocationReplyVO;
import com.project.domain.LocationVO;

public interface LocationMapper {

	public List<LocationVO> getList(Criteria cri);
	
	public LocationVO getLocation(int location_num);
	
	public int getCount(Criteria cri);
	
	public List<LocationVO> getListAjax();
	
	public List<LocationReplyVO> getReplyList(@Param ("cri") Criteria cri,@Param("location_num") int location_num);
	
	public int writeReply(LocationReplyVO vo);
	
	public int deleteReply(LocationReplyVO vo);
	
	public int modifyReply(LocationReplyVO vo);
	
	public int getCountByLocation(int location_num);
}
