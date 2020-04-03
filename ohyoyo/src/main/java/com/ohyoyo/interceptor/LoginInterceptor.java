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
		// referer 뒤로가기 누른거라 생각하면 됨\ 이동하기전 이전 page url
		String referer = request.getHeader("referer");
		log.info("****** 이전 URL :" + referer);
		
		// 이동하려고 했던 page url
		// 중간에 채온거라서 이동하려던 page를 알수있음 
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		// context root가 짤려서 url만 남음
		String nextUrl = uri.substring(ctx.length());
		String prevUrl = "";
		String finalUrl = "http://localhost:8081/ohyoyo/";
		
		// 비정상적인 접근을 막는 기능!
		if(referer == null) {
			log.info("!!WARNING*********: 비정상적인 접근 ");
			response.sendRedirect(finalUrl);
			return false;
			
		// 뭔가를 클릭해서 온 친구
		} else {
			int indexQuery = referer.indexOf("?");
			if(indexQuery == -1) {
				prevUrl = referer.substring(finalUrl.length()-1);
			} else {
				prevUrl = referer.substring(finalUrl.length()-1, indexQuery);
			}
			log.info("PREV URL ********"+prevUrl);
			log.info("NEXT URL ********"+nextUrl);
			
			// 너가 하려는 게 수정또는 삭제?
			if(nextUrl.equals("/board/update") || nextUrl.equals("/board/delete")) {
				log.info(""+prevUrl.indexOf("board/view"));
				// update -> update 즉, 수정을 하려고 할때 비정상적인 접근이라고 생각 못하게 하려고 
				if(request.getParameter("title") == null) {
					// 전페이지가 상세게시글이 아닐 경우
					if(prevUrl.indexOf("board/view") == -1) {
						log.info("!!WARNING*********: 비정상적인 접근 ");
						response.sendRedirect(finalUrl);
						return false;
					}
				}
			}
		}	
		
		// Login NO 정상적인 접근인 경우 실행
		if(session.getAttribute("userid") == null) {
			if(prevUrl.equals(nextUrl)) {
				log.info("prevUrl == nextUrl");
				response.sendRedirect(finalUrl);
				return false;
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
