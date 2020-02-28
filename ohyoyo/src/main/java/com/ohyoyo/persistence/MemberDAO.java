package com.ohyoyo.persistence;

import com.ohyoyo.domain.MemberDTO;

public interface MemberDAO {
	// 회원가입 id중복체크(+AJAX)
	public int idOverlap(String id);
	
	// 회원가입 db에 회원등록
	public int memInsert(MemberDTO mDto);
	
	// 회원가입 진행시 난수 생성및 useyn 컬럼에 난수 입력
	public int getKey(String id, String key);
	
	// 회원가입 이메일인증후 useyn컬럼y로 값변경
	public int alterKey(String id, String key);
	
	// 1명의 회원정보
	public MemberDTO userView(String id);
}
