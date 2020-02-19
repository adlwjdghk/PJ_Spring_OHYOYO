package com.ohyoyo.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class MemberDTO {
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private String postcode;
	private String addr1; // 주소
	private String addr2; // 상세주소
	private String useon; // 이용약관동의 유무
	private String primaryon; // 개인정보수집및 이용동의 유무
	private String snson; // sns 쇼핑정보수신동의 유무
	private String emailon;	// 이메일 쇼핑정보수신동의 유무
	private String useyn; // id 사용유무
	private Date regdate; // 가입일자
}
