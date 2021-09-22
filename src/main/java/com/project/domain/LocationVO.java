package com.project.domain;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class LocationVO {
	private int location_num;
	// 공공 장소 주소  시/도
	private String name_1;
	// 공공 장소 주소 구
	private String name_2;
	// 공공 장소 유형  - 시설 타입
	private String facility_type;
	// 공공 장소 휴관일
	private String closed_days;
	// 공공 장소 평일 open 시간
	private String weekdays_open;
	// 공공 장소 평일 close 시간
	private String weekdays_closed;
	// 공공 장소 주말 open 시간
	private String weekend_open;
	// 공공 장소 주말 close 시간
	private String weekend_closed;
	// 공공 장소 유료 / 무료 여부
	private String is_pay;
	// 공공 장소 사용 가능 시간
	private String use_time;
	// 공공 장소 사용 금액
	private String fee;
	// 공공 장소 최대 사용 인원
	private String max_person;
	// 공공 장소 면적
	private String space_area; 
	// 공공 장소 부대 시설
	private String use_option;
	// 공공 장소 예약 방법
	private String apply_way;
	// 공공 장소 대표 번호
	private String phone_num;
	// 공공 장소 홈페이지 url
	private String home_page;
	// 공공 장소 지도 위도
	private String latitude;
	// 공공 장소 지도 경도
	private String longtitude;
	// 공공 장소 제공 기관
	private String provider;
	
}
