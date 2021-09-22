package com.project.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Folder {
	public String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		
		return str.replace("-", File.separator); // window에서는 file separator를 '//'로 되어있기 때문에 '-'로 바꿔 준다.
	}
}