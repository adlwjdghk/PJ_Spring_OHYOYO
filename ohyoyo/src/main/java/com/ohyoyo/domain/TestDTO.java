package com.ohyoyo.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// @Data  쓰지 말라, 필요없는 것도 만들어줌 효율이 좋지않음
@NoArgsConstructor // 기본생성자 만들어줌
@AllArgsConstructor // 변수 전체다 들어있는 생성자 만들어줌
@Getter
@Setter
@ToString
public class TestDTO {
	String name;
	int score;
}
