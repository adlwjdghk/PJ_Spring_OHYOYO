package com.ohyoyo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		
		// 비정상적인 접근일경우 약관동의페이지로 이동
		if(!flag.equals("1")) {
			return "member/constract";
		}
		
		model.addAttribute("uri","/ohyoyo/");
		// 회원가입창에서 로그인을 했을때 main으로 가게 하는 코드를 만들고 싶었는데
		// 한번만 이용되는 flash를 이용했을때 login창으로 ajax를 통해 
		// RedirectAttributes rttr 리다이렉트방식으로 보내는 거라서 받을수없음
		// rttr.addFlashAttribute("uri","/ohyoyo/");
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
	public String join(@ModelAttribute("memberDTO") MemberDTO mDto, SessionStatus sessionStatus, HttpServletRequest request, RedirectAttributes rttr) {
		// View단에서 Controller단으로 이동을 잘 했는지 확인됨
		log.info(">>> MEMBER/JOIN POST DB에 회원정보 저장");
		
		// View단에서 전송된 데이터가 잘 전달됐는지 확인
		log.info(mDto.toString());
		
		log.info(mDto.getPw()); // 사용자가 입력한 값
		
		// 1. 사용자 암호 hash변환
		String encPw = passwordEncoder.encode(mDto.getPw());
		mDto.setPw(encPw); // 암호화된 pw를 DTO에 넣는 과정
		log.info("hash: "+mDto.getPw()); // 사용자가 입력한 pw를 hash로 바꾼 값
		
		// 2. DB에 회원등록
		// 객체생성을 하지않아도 사용가능 @Autowired로 의존성주입이 되어있음(타입으로함)
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
		
		// 서버단,Controller단에서 View단으로 갈때 2가지 방식 
		// forward 포워드방식 원페이지에 새페이지를 덮어쓰는 방식 , url주소 안 바뀜 데이터가 남아있음 
		//  새로고침을 하면 윈페이지도 같이 새로고침됨 그래서 가입하기 버튼도 다시 눌림 
		//  DB에 같은 정보를 또 넣게 되어서 에러남  DB 값이 바뀌는 작업일때는 리다이렉트해야함
		// 	forward가 디폴트!
		// sendredirct 샌드리다이렉트방식 페이지를 새로만들어서 보내는것, url주소 바뀜
		// redirect:  이게 샌드리다이렉트방식보내는 것 
		
		// 회원가입 후 메시지 출력을 위한 값 전달 
		rttr.addFlashAttribute("id", mDto.getId()); 
		rttr.addFlashAttribute("email", mDto.getEmail());
		rttr.addFlashAttribute("key", "join");
				
		return "redirect:/";
	}
	
	@GetMapping("/constract")
	public String viewConstract(Model model, RedirectAttributes rttr) {
		log.info(">>> MEMBER/CONSTRACT PAGE 출력");
		model.addAttribute("uri","/ohyoyo/");
		// rttr.addFlashAttribute("uri","/ohyoyo/");
		return "member/constract";
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

		String flag = "1";
		if(cnt == 0) {
			flag = "0";
		}
		
		return flag;
	}
	// 마이페이지
	@GetMapping("/mypage")
	public String mypage() {
		log.info(">>> GET: MYPAGE PAGE");
//		String id = (String) session.getAttribute("userid");
//		
//		// 로그인이 안되있으면 비정상적인 접근으로 간주하여 인텍스페이지로 이동!
//		if(id == null) {
//			return "redirect:/";
//		}
		return "member/mypage";
	}
	
	// 회원정보수정
	@GetMapping("/update")
	public String memUpdate(HttpSession session, Model model) {
		log.info(">>> GET: MEMBER UPDATE PAGE");
		
		// 현재 로그인 상태 확인 
		// session.getAttribute("userid"); session에 들어가면 타입이 가장상위인 object타입으로 바뀜
		// 그래서 형변환을 해줘야함
		String id = (String) session.getAttribute("userid");
		
		// 로그인된 유저의 정보를 GET
		// 회원정보수정 페이지로 보내기
		model.addAttribute("user", mService.userView(id));
	
		return "/member/join";
	}
	
	// 수정한 회원정보 db에 저장하기
	@PostMapping("/update")
	public String memUpdate(MemberDTO mDto, HttpSession session) {
		log.info(">>> POST: MEMBER UPDATE ACTION");
		log.info(mDto.toString());
		
		mService.memUpdate(mDto, session);
		
		return "redirect:/";
	}
	
	// 비밀번호 변경
	@GetMapping("/pwupdate")
	public String pwUpdate() {
		log.info(">>> GET: MEMBER PASSWORD UPDATE PAGE");		
//		String id = (String) session.getAttribute("userid");
//		
//		// 로그인이 안되있으면 비정상적인 접근으로 간주하여 인텍스페이지로 이동!
//		if(id == null) {
//			return "redirect:/";
//		}
		
		return "/member/pwupdate";
	}
	
	// 입력한 비밀번호 변경하러 보내기
	@PostMapping("/pwupdate")
	public String pwUpdate(MemberDTO mDto, HttpSession session) {
		log.info(">>> POST: MEMBER PASSWORD UPDATE ACTION");
		
		String encPw = passwordEncoder.encode(mDto.getPw());
		mDto.setPw(encPw); 
		
		String id = (String) session.getAttribute("userid");
		mDto.setId(id);
		log.info(mDto.toString());
		
		mService.pwUpdate(mDto);
		
		return "redirect:/";
	}
	
	// 비밀번호 유효성체크: 기존에 db에 저장되잇는 정보와 동일한지 확인
	@ResponseBody
	@PostMapping("/pwcheck")
	public Integer pwCheck(String pw, HttpSession session) {
		log.info(">>> POST: PWCHECK(AJAX)");
		
		String id = (String) session.getAttribute("userid");
		
		return mService.pwCheck(id, pw);
	}
	
	// 회원탈퇴
	@GetMapping("/drop")
	public String drop(Model model) {
		log.info(">>> MEMBER/DROP PAGE 출력");
//		String id = (String) session.getAttribute("userid");
//		// 로그인이 안되있으면 비정상적인 접근으로 간주하여 인텍스페이지로 이동!
//		if(id == null) {
//			return "redirect:/";
//		}

		model.addAttribute("key", "drop");
		
		return "member/drop";
	}
	
	// 회원탈퇴 : DB에 저장
	@GetMapping("/dropAction")
	public String dropAction(HttpSession session, RedirectAttributes rttr) {
		log.info("*********** GET: DROP UPDATE ");
		String id = (String) session.getAttribute("userid");
		
		rttr.addFlashAttribute("id", id);
		rttr.addFlashAttribute("key", "dropResult");
		
		mService.memDrop(session, id);
		
		return "redirect:/";
	}
	
}
