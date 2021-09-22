package com.project.domain;

import java.util.List;

import lombok.Data;
import lombok.Getter;

@Data
@Getter
public class LocationPageDTO {

	private List<LocationVO> list;
	private PageDTO pageMaker;
	
	public LocationPageDTO(List<LocationVO> list,PageDTO pageMaker) {
		
		this.list=list;
		this.pageMaker=pageMaker;
	}
}
