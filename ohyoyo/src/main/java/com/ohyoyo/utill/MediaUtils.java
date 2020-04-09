package com.ohyoyo.utill;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

public class MediaUtils {
	private static Map<String, MediaType> mediaMap; // 변수 생성
	// 클래스를 로딩할때 제일 먼저 실행되는 코드
	// static 블럭 : 안에있는 모든걸 static을 하고싶을때 사용함 
	static {
		mediaMap = new HashMap<>(); // 객체생성
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
		// MediaType.IMAGE_PNG png타입의 이미지라는걸 알려주는 것
	}
	public static MediaType getMediaType(String type) {
		// toUpperCase() 대문자로 변환
		return mediaMap.get(type.toUpperCase());
	}
}
