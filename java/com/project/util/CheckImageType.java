package com.project.util;

import java.io.File;
import java.nio.file.Files;

public class CheckImageType {
	public boolean checkImageType(File file) {
		try {
			// 파일 속성 조사(이미지 인지 아닌지 조사)
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
