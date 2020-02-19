package com.ohyoyo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ohyoyo.domain.SampleDTO;

import lombok.extern.slf4j.Slf4j;


// Spring이 동작시 DispatherServlet 생성과정에서
// servlet-context.xml의 환경설정을 읽어들이는데 
// servlet-context.xml내의 component-scan이 설정된 경로를 돌아다니며 @Controller가 붙어있는
// Class들을 전부 Spring Context에 Beans로 등록 시키기 위해 사용!
// Spring Context에 Beans로 등록되어야 
// DispatherServlet이 Handler Mapping과 Handler Adapter를 통해 요청처리를 시킬수 있음

// Spring Context에 Beans로 등록되었다 
// Spring이 객체 제어권을 개발자로부터 넘겨받음 (IOC패턴)

// Spring context에 Beans로 등록되어있는 객체들만 의존성주입 가능(DI패턴)
@Controller
// lombok라이브러리의 log기능을 사용하기 위해서 적은 부분
@Slf4j
@RequestMapping("/sample")
public class SampleController {
	
	// sample.jsp출력
	@RequestMapping("/")
	public String print() {
		return "sample";
	}
	
//	@RequestMapping(value="/sample/view",method=RequestMethod.GET)
	@GetMapping("/view")
	public String view(String user, String pass) {
		log.info("GET 방식 호출");
		log.info("user: "+ user+" pass: "+pass);
		return "result";
	}
	
//	@RequestMapping(value="/sample/view",method=RequestMethod.POST)
	@PostMapping("/view")
//	public String view(@RequestParam String user, @RequestParam String pass) {
	// @RequsetParam 생략가능!
	// ++ 추추가문제점을 Spring 에서 해결하는 방식 : defaultValue !! 아주 편함 
	// 이걸쓸때는 @RequestParam은 생략불가(명시해야함)
	// 화면단에서 name이 user인 것을 찾아서 있으면 user에 바로 집어넣고 없으면 defaultValue값을 집어넣음
// public String view(@RequestParam(value="user", defaultValue="도비") String user, String pass) {
	public String view(SampleDTO sDto) {
		// input 2개의 값을 전달 (name속성값으로 되어있는 것)
		log.info("POST 방식 호출");
//		log.info(user+ ", "+pass);
		log.info(sDto.toString());
		return "result";
	}
	
	// 과거 view단으로 부터 데이터를 받는 방법
	// Model2에서 쓰던 방식
//	@PostMapping("/view")
	public String view(HttpServletRequest request) {
		
		// 100개 필요하면 100개를 받아야함 도망나와야하는 방식
		// + 추가문제점
		// request.getParameter(" ")는 데이터가 어떤 타입으로 되어있든 String타입으로 받아옴
		// 그래서 개발자가 형변환하는 작업이 필수!!
		// ++ 추추가문제점
		// 값을 View단에서 넘겨주지않으면 Null값이 들어가 하단에 매개변수 사용하는 부분에서 전부 Error발생
		// 그래서 Null값 체크해주는 코드(if문등) 필수!!
		String user = request.getParameter("user");
		String pass = request.getParameter("pass");
		if(user == "null") {
			user = "도비";
		}
		log.info("POST 방식 호출");
		
		
		return "result";
	}
	
}
