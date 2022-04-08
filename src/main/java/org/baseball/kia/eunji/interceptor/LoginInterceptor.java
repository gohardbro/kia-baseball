package org.baseball.kia.eunji.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		// 로그인하면 session에 loginUser 로 로그인유저 정보 AccountVo타입으로 들어가있어요

		System.out.println("인터셉터");
		HttpSession session = request.getSession();
		if (session == null || session.getAttribute("loginUser") == null) {
			System.out.println("미 로그인 사용자 요청");
			/* AccountVo vo = (AccountVo)session.getAttribute("loginUser"); */
			response.sendRedirect("/login");
			
			return false;

		} else {

			return true;
		}
	}

}
