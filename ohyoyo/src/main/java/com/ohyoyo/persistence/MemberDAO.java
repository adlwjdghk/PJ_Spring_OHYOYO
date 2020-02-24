package com.ohyoyo.persistence;

import com.ohyoyo.domain.MemberDTO;

public interface MemberDAO {
	// 회원가입 id중복체크(+AJAX)
	public int idOverlap(String id);
	
	// 회원가입 db에 회원등록
	public int memInsert(MemberDTO mDto);
}
