package com.project.domain;

import lombok.Data;

@Data
public class BoardAttachVO {
	private String uuid;
	private String upload_path;
	private String file_name;
	private boolean file_type;
	private String meet_num;
}
