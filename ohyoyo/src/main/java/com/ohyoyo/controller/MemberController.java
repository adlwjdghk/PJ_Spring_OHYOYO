package com.ohyoyo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ohyoyo.domain.MemberDTO;
import com.ohyoyo.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member")
@Controller
public class MemberController {
	@Autowired
	MemberService mService;
	
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
	
	
	// 회원가입 ID 중복체크
	@ResponseBody
	@PostMapping(value="/idoverlap",produces="application/text; charset=utf-8")
	public String idOverlap(String id) {
		log.info(">> ID OVERLAP CHECK");
		log.info(" ID : "+id);
		int cnt = mService.idOverlap(id); 
		log.info("cnt: " + cnt);
		String flag = "1";
		if(cnt == 0) {
			flag = "0";
		}
		
		return flag;
	}
}
