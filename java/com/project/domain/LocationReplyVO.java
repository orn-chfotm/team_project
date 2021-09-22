package com.project.domain;

import java.util.Date;

import lombok.Data;

@Data
public class LocationReplyVO {

	private int reply_num;
	private String user_id;
	private int location_num;
	private String reply_content;
	private String regdate;
}
