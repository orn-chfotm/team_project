package com.project.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class LocationReplyPageDTO {

	private int replyCnt;
	private List<LocationReplyVO> list;
}
