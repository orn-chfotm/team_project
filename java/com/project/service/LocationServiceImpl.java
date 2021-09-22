package com.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project.domain.Criteria;
import com.project.domain.LocationReplyPageDTO;
import com.project.domain.LocationReplyVO;
import com.project.domain.LocationVO;
import com.project.mapper.LocationMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class LocationServiceImpl implements LocationService {
	
	private LocationMapper locationMapper;
	
	@Override
	public List<LocationVO> getList(Criteria cri) {
		log.info("getList 메소드 호출");
		return locationMapper.getList(cri); 
	}

	@Override
	public LocationVO getLocation(int location_num) {
		log.info("넘어온 값:"+location_num);
		log.info("mapper호출 :"+locationMapper.getLocation(location_num));
		return locationMapper.getLocation(location_num);
		
	}

	@Override
	public int getCountLocation(Criteria cri) {
		return locationMapper.getCount(cri);
	}

	@Override
	public List<LocationVO> getListAjax() {
		return locationMapper.getListAjax();
	}

	@Override
	public LocationReplyPageDTO getReplyList(Criteria cri,int location_num) {
		return new LocationReplyPageDTO(locationMapper.getCountByLocation(location_num),locationMapper.getReplyList(cri, location_num));
	}

	@Override
	public int writeReply(LocationReplyVO vo) {
		return locationMapper.writeReply(vo);
	}

	@Override
	public int deleteReply(LocationReplyVO vo) {
		return locationMapper.deleteReply(vo);
	}

	@Override
	public int modifyReply(LocationReplyVO vo) {
		return locationMapper.modifyReply(vo);
	}

}
