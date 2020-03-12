package com.ohyoyo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ohyoyo.service.index.IndexService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class IndexController {
	// @Inject, @Autowired, @Resource중 1개라도 붙어있으면 의존성 주입
	// @Inject, @Autowired는 타입(변수타입)으로 의존성 주입
	// @Resource는 변수명(이름)으로 가져와서 의존성 주입
	
	// 변수명으로 가져오면 찾을수없음 변수명이 다르기 때문에 
	// 타입으로 가져오면 구현으로 부모 타입으로 동일하기 때문에 가져올수있음
	@Autowired
	IndexService iService; // == indexServiceImpl Beans; Spring이 이렇게 만들어주기 때문에 우리는 그냥 쓰기만 하면 됨
	
	@RequestMapping("/")
	public String indexView(Model model, HttpSession session) {
		log.info(">>> INDEX PAGE 출력");
		
		// view단에 출력할 데이터
//		List<ProductDTO> list = iService.bestPdtList();
		// ( "이름표", 담을 데이터 );
//		model.addAttribute("BestPdt",list);
		
		// 위 두줄을 한줄로 줄이기
		// 1. view단에 출력할 베스트 상품 4건(데이터)
		model.addAttribute("BestPdt", iService.bestPdtList());
		
		// 2. view단에 출력할 신상품 4건
		// 신상품 4건을 출력하는 비즈니스로직을 처리하는 서비스단으로 이동
		model.addAttribute("NewPdt", iService.newPdtList());
		
//		// ** 개발종료시 삭제할것! 강제로 로그인하게 만들기 (관리자 자동로그인)
//		session.removeAttribute("userid");
//		session.removeAttribute("name");
//		session.setAttribute("userid", "as12123");
//		session.setAttribute("name", "히히히");
		
		// 3. 출력할 화면을 결정
		return "index";
	}

}
