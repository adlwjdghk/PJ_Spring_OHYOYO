/*
 * Login이 필요한 기능 수행시
 * Session 체크 하는 Interceptor
 */
package com.ohyoyo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter{
	// URL 전
	@Override // 부모의 메서드를 재정의 하는 것
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// Session 객체생성
		HttpSession session = request.getSession();
		
		// referer 뒤로가기 누른거라 생각하면 됨
		String referer = request.getHeader("referer");
		log.info("****** 이전 URL :" + referer);
		
		// Login NO
		if(session.getAttribute("userid") == null) {
			log.info("****** NOLOGIN..");			
			
			String uri = request.getRequestURI();
			log.info("*******uri*****"+uri);
			
			
			// URL로 바로 접근한 경우 (referer이 없는 경우) 인덱스페이지로 
			if(referer == null) {
				referer = "http://localhost:8081/ohyoyo/";
			} else {
				// 게시글 등록, 수정 로그인이 필요한 view단
				int index = referer.lastIndexOf("/");
				int len = referer.length();
				log.info("************index*************"+index);
				log.info("***********length**************"+len);
				String mapWord = referer.substring(index, len);
				log.info("****************update url*****"+mapWord);
				log.info("****************url*****"+referer);
				
				if(mapWord.equals("/write")) {
					response.sendRedirect(request.getContextPath()+"/board/list");
					return false;
				}
			}
			// response.sendRedirect(referer+"?message=nologin");
			FlashMap fMap = RequestContextUtils.getOutputFlashMap(request);
			fMap.put("message", "nologin");
			fMap.put("uri", uri);
			
			RequestContextUtils.saveOutputFlashMap(referer, request, response);
			response.sendRedirect(referer);
			
			return false; // 이동 x
		} else { // Login OK!
			log.info("******LOGIN !");
			return true; // 원래 가려던 곳으로 이동
		}
	}
	
	// URL 후
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		// TODO Auto-generated method stub
//		super.postHandle(request, response, handler, modelAndView);
//	}

}
