package com.ohyoyo.service.member;

import com.ohyoyo.domain.MemberDTO;

public interface MemberService {
	
	// 회원가입 id중복체크(AJAX)
	public int idOverlap(String id);
	
	// 회원가입 (DB 에 등록)
	public int memInsert(MemberDTO mDto);
}
