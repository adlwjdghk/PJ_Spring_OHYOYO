package com.ohyoyo.service.login;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.ohyoyo.domain.MemberDTO;
import com.ohyoyo.persistence.LoginDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LoginServiceImpl implements LoginService{
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	private SqlSession sqlSession;
	
	private LoginDAO lDao;
	@Autowired
	public void newMemberDAO() {
		lDao = sqlSession.getMapper(LoginDAO.class);
	}
	
	@Override
	public int login(MemberDTO mDto, HttpSession session) {
		// 비즈니스로직 처리
		// 1. DB에 가서 회원인지 아닌지 유무 체크 
		MemberDTO loginDto = lDao.loginUesr(mDto);
		log.info(" ★★★★★★★★★★★★★★★★★ 로그인 결과 ");
		
		// result 결과
		// 0: 등록된 회원이 아닙니다. 회원가입을 진행해주세요.
		// 2: 이메일인증을 해야만 로그인이 가능합니다.
		// 1: 로그인 성공 -> header에서 로그인, 가입하기 > ㅇㅇ회원님 로그아웃
		// 3: 아이디 또는 비밀번호가 잘못되었습니다. 다시 확인해주세요.
		int result = 0; // 로그인 결과값
		
		// 2. DB 결과에 따라 동작
		// id가 없는 경우 ( 회원이 아닌 경우)
		if(loginDto == null) {
			result = 0;
			return result;
		}
		// - 회원인데 인증을 안한 경우 (n이나 난수인 경우) 
		if(!(loginDto.getUseyn().equals("y"))) {
			result = 2;
			return result;
		}	
		// - 회원이고 인증한 경우
		if(loginDto != null) {
			// 아이디와 패스워드가 같은지 체크
//			if(loginDto.getId().equals(mDto.getId()) && loginDto.getPw().equals(mDto.getPw())) {
			if(passwordEncoder.matches(mDto.getPw(), loginDto.getPw())){
				// 회원이 맞으므로 로그인 진행 
				result = 1;
				// 세션에 로그인유저 정보를 저장
				session.removeAttribute("userid");
				session.removeAttribute("name");
				session.setAttribute("userid", loginDto.getId());
				session.setAttribute("name", loginDto.getName());
				
			// id가 있는데 pw가 틀린 경우
			} else {
				result = 3;
			}
		}
		
		return result;
	}

	@Override
	public void logout(HttpSession session) {
		// 비즈니스로직: 로그아웃
		// 저장되어있는 데이터 삭제
		// 세션을 초기화
		session.invalidate();
	}
	
	
}
