package com.ohyoyo.persistence;

import com.ohyoyo.domain.MemberDTO;

public interface LoginDAO {
	// 로그인
	public MemberDTO loginUesr(MemberDTO mDto);
}
