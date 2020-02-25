package com.ohyoyo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ohyoyo.domain.MemberDTO;
import com.ohyoyo.service.mail.MailService;
import com.ohyoyo.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;
/*
 * SessionAttributes로 설정된 변수(객체)는 
 * response를 하기전에 서버의 기억장소 어딘가에 임시로 보관을 해둔다
 * web browser와 server간에 한번이라도 연결이 이루어졌으면 
 * Session.. 에 등록된 변수는 서버가 중단될때까지 그 값이 그대로 유지된다
 * web은 클라이언트의 req를 서버가 받아서
 * res를 수행하고 나면 모든 정보가 사라지는 특성이 있다
 * 이런 특성과는 달리  Spring 기반의 web은 일부데이터들을 메모리에 보관했다가 재사용하는 기법이 있다
 * 그중 SessionAttributes라는 기능이 있다
 * 
 * sessionAttributes()에 설정하는 문자열 (이름)은 
 * 클래스의 표준객체생성 패턴에 의해 만들어진 이름
 * MemoDTO memoDTO
 * 
 * 이름을 표준패턴이 아닌 임의의 이름으로 바꾸고 싶다
 * */
@SessionAttributes({"memberDTO"})
@Slf4j
@RequestMapping("/member")
@Controller
public class MemberController {
	@Autowired
	MemberService mService;
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	/*
	 * SessionAttributes를 사용하기 위해서는 
	 * 반드시 해당 변수를 생성하는 method가 controller에 있어야하고 
	 * 해당 메서드에는 @ModelAttribute("변수명")가 있어야한다 
	 */
	
	/* 
	 * 초기화 하는 방식 
	 * 지정만 하면 찌꺼기 데이터가 남아있음 그래서 초기화 해줘야함 
	 *  안해주면 에러남
	 */
	@ModelAttribute("memberDTO")
	public MemberDTO newMember() {
		return new MemberDTO();
	}
//	@GetMapping("/join")
//	public String getJoin(MemberDTO mDto) {
//		log.info("GET방식");
//		log.info(mDto.toString());
//		
//		return "member/join";
//	} 
	@GetMapping("/join")
	// constract 페이지를 통해서 왔을때는 flag값으로 1들어오는데
	// 비정상적인 접근일 경우 flag값이 0이 된다
	public String join(@ModelAttribute("memberDTO") MemberDTO mDto, @RequestParam(value="flag",defaultValue="0") String flag, Model model) {
		log.info(">>> MEMBER/JOIN GET PAGE 출력");
		log.info(mDto.toString());
//		model.addAttribute("flag", flag);
		if(!flag.equals("1")) {
			return "member/constract";
		}
		
		return "member/join";
	}
	
	/*
	 * insert POST가 memoDTO를 수신할때
	 * 입력 form에서 사용자가 입력한 값들이 있으면
	 * 그 값들을 memoDTO의 필드변수에 setting을 하고
	 * 
	 * 만약 없으면
	 * 메모리 어딘가에 보관중인 SessionAttributes로 설정된
	 * memoDTO변수에서 값을 가져와서 비어있는
	 * 필드변수를 채워서서 매개변수에 주입한다.
	 * 
	 * 따라서 form에서 보이지 않아도 되는 값들은
	 * 별도의 코딩을 하지 않아도
	 * 자동으로 insert POST로 전송되는 효과를 낸다.
	 * 단, 이 기능을 효율적으로 사용하려면
	 * jsp 코드에서 Spring-form tag로 input 를 코딩해야 한다.
	 */
	
	// @Model.. 이되어있으면 mDto에 null값이 있다 하면 
	// memberDTO이름의 저장소에 가보고 같은 변수명이 있으면 null값이 있는데다가 채워줌
	// 원래 8개만 왔다가 null값이 있으니까 저장소 가서 찾아봄 4개 값이 있음 
	// 그래서 4개값을 넣어서 12개가 됨 but 해당 값이 Spring input태그로 되어있어야함 
	@PostMapping("/join")
	public String join(@ModelAttribute("memberDTO") MemberDTO mDto, SessionStatus sessionStatus, HttpServletRequest request) {
		log.info(">>> MEMBER/JOIN POST DB에 회원정보 저장");
		log.info(mDto.toString());
		
		log.info(mDto.getPw()); // 사용자가 입력한 값
		
		// 1. 사용자 암호 hash변환
		String encPw = passwordEncoder.encode(mDto.getPw());
		mDto.setPw(encPw);
		log.info("hash: "+mDto.getPw()); // 사용자가 입력한 값
		
		// 2. DB에 회원등록
		int result = mService.memInsert(mDto);
		// 3. 회원 등록 결과
		if(result > 0) {
			log.info(">>>>" + mDto.getId()+"님이 회원가입되었습니다");
		}		
		// 4. 회원가입 인증 메일 보내기
		mailService.mailSendUser(mDto.getEmail(), mDto.getId(), request);
		
		// 자원반납하는 코드
		// SessionAttributes를 사용할때 insert, update가 완료되고
		// view로 보내기전 반드시 setComplet()를 실행하여 
		// session에 담긴 값을 clear 해주어야한다
		sessionStatus.setComplete();
		
		return "redirect:/";
	}
	
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
	
	@GetMapping("/drop")
	public String drop(Model model) {
		
		log.info(">>> MEMBER/DROP PAGE 출력");
		return "member/drop";
	}
	
	// 회원가입 후 email인증
	@GetMapping("/keyauth")
	public String keyAuth(String id, String key, RedirectAttributes rttr) {
		mailService.keyAuth(id, key);
		
		// 인증후 메시지 출력을 위한 값 전달
		rttr.addFlashAttribute("id",id);
		rttr.addFlashAttribute("key","auth");
		
		return "redirect:/";
	}
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
