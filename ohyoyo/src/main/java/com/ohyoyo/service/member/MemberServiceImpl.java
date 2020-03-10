package com.ohyoyo.service.member;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.ohyoyo.domain.MemberDTO;
import com.ohyoyo.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private SqlSession sqlSession;
	
	private MemberDAO mDao;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	public void newMemberDAO() {
		mDao = sqlSession.getMapper(MemberDAO.class);
	}

	@Override
	public int idOverlap(String id) {
		return mDao.idOverlap(id);
	}

	@Override
	public int memInsert(MemberDTO mDto) {
		return mDao.memInsert(mDto);
	}

	@Override
	public MemberDTO userView(String id) {
		return mDao.userView(id);
	}

	@Override
	public void memUpdate(MemberDTO mDto, HttpSession session) {
		int result = mDao.memUpdate(mDto);
		if(result > 0) { // 수정성공
			// 세션에 로그인유저 정보를  수정된 정보로 변경
			session.removeAttribute("name");
			session.setAttribute("name", mDto.getName());
		}
	}

	@Override
	public int pwCheck(String id, String pw) {
		String encpw = mDao.pwCheck(id);
		int result = 0;
		if(passwordEncoder.matches(pw, encpw)) {
			result = 1;
		} 
		return result;
	}

	@Override
	public void pwUpdate(MemberDTO mDto) {
		mDao.pwUpdate(mDto);
	}
	
	
}
