package org.baseball.kia.subin.interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.baseball.kia.taejeong.entity.AccountVo;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		AccountVo loginUser = (AccountVo) session.getAttribute("loginUser");
		if (loginUser != null && loginUser.getAdmin().equals("Y")) { // 로그인한 계정이 관리자인 경우
			return true;

		} else {
			response.sendRedirect("/"); // 메인홈페이지로 이동
			return false;
		}
	}
}
