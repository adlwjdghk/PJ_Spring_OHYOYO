package com.ohyoyo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ohyoyo.domain.MemberDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member")
@Controller
public class MemberController {
	@GetMapping("/join")
	public String getJoin(MemberDTO mDto) {
		log.info("GET방식");
		log.info(mDto.toString());
		
		return "member/join";
	}
//	@PostMapping("/join")
//	public String viewJoin(Model model) {
//		return "member/join";
//	}
	@GetMapping("/constract")
	public String viewConstract(Model model) {
		
		log.info(">>> MEMBER/CONSTRACT PAGE 출력");
		return "member/constract";
	}
//	@GetMapping("/drop")
//	public String viewDrop(Model model) {
//		log.info(">>> MEMBER/DROP PAGE 출력");
//		return "member/drop";
//	}
}
