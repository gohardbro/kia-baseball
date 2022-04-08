package org.baseball.kia.taejeong.controller;

import java.sql.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.baseball.kia.taejeong.entity.AccountVo;
import org.baseball.kia.taejeong.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.WebUtils;

@Controller
public class LoginController {
	@Autowired
	AccountService accountService;

	@GetMapping("/login")
	public String loginGetHandle() {
		return "taejeong/account/login";
	}

	@RequestMapping("/login/accountFind")
	public String accountFindHandle() {
		return "taejeong/account/accountFind";
	}

	@PostMapping("/login")
	public String loginPostHandle(@RequestParam String id, @RequestParam String pw,
			@RequestParam(defaultValue = "false") boolean autoLogin, HttpSession session, Model model,
			HttpServletResponse response) {
		boolean valid = accountService.isValidAccount(id, pw);
		if (valid) {
			AccountVo accountVo = accountService.findAccountById(id);
			if (autoLogin) {
				Cookie loginCookie = new Cookie("autoLoginCookie", session.getId());
				loginCookie.setPath("/");
				long limitTime = 60 * 60 * 24 * 90; // 90일시간

				loginCookie.setMaxAge((int) limitTime);
				response.addCookie(loginCookie);
				// 추가 4월8일 3:35
				long expiredDate = System.currentTimeMillis() + (limitTime * 1000); // 현재시간 + 3개월
				Date limitDate = new Date(expiredDate);
				accountVo.setSessionId(session.getId());
				accountVo.setLimitTime(limitDate);
				accountVo.setId(id);
				accountService.updateSessionIdAndLimitTime(accountVo);
				// 추가
				session.setAttribute("loginUser", accountVo);
				System.out.println("로그인성공! 로그인유지체크");
				return "redirect:/";
			}
			session.setAttribute("loginUser", accountVo);
			System.out.println("로그인성공! 로그인유지체크 안함");

			return "redirect:/";
		} else {
			model.addAttribute("loginErrMsg", "아이디가 없거나 비밀번호가 일치하지 않습니다.");
			System.out.println("로그인불가");
			return "taejeong/account/login";
		}
	}

	@RequestMapping("/logout")
	public String logoutHandle(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		AccountVo accountVo = (AccountVo) session.getAttribute("loginUser");
		Cookie loginCookie = WebUtils.getCookie(request, "autoLoginCookie");
		
		if (loginCookie != null) {
			loginCookie.setMaxAge(0);
			response.addCookie(loginCookie);

			accountVo.setSessionId("none");
			accountVo.setLimitTime(null);
			accountService.updateSessionIdAndLimitTime(accountVo);
		}
		
		session.removeAttribute("loginUser");
		session.invalidate();
		return "redirect:/";
	}

}
