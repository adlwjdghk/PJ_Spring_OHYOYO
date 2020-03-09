package com.ohyoyo.service.member;

import javax.servlet.http.HttpSession;

import com.ohyoyo.domain.MemberDTO;

public interface MemberService {
	
	// 회원가입 id중복체크(AJAX)
	public int idOverlap(String id);
	
	// 회원가입 (DB 에 등록)
	public int memInsert(MemberDTO mDto);
	
	// 회원수정 (DB에 수정)
	public void memUpdate(MemberDTO mDto, HttpSession session);
	
	// 1명의 회원정보
	public MemberDTO userView(String id);
	
}
