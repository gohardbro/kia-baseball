package org.baseball.kia.taejeong.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.baseball.kia.taejeong.entity.AccountVo;
import org.baseball.kia.taejeong.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;


public class AutoLoginInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	AccountService accountService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Cookie loginCookie = WebUtils.getCookie(request, "autoLoginCookie"); //request로부터 특정이름쿠키만 가져오기
		
		if(loginCookie != null) {
			String sessionId = loginCookie.getValue(); //쿠키에서 등록했던 세션아디뽑기
			AccountVo accountVo = accountService.getAccountBySessionId(sessionId);
			if(accountVo != null) {
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", accountVo);
			}
		}
		
		return true;
	}
}
