package org.baseball.kia.controller;

import javax.servlet.http.HttpSession;

import org.baseball.kia.entity.AccountVo;
import org.baseball.kia.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String loginPostHandle(HttpSession session, @RequestParam String id, @RequestParam String pw, Model model) {
		boolean valid = accountService.isValidAccount(id, pw);
		if (valid) {
			AccountVo vo = accountService.findAccountById(id);
			// vo == null ?
			session.setAttribute("loginUser", vo);
			return "redirect:/";
		} else {
			model.addAttribute("loginErrMsg", "아이디가 없거나 비밀번호가 일치하지 않습니다.");
			System.out.println("로그인불가");
			return "taejeong/account/login";
		}
	}
	
	@RequestMapping("/logout")
	public String logoutHandle(HttpSession session) {
		session.removeAttribute("loginUser");
		
		session.invalidate();	// 사용자세션을 리셋
		return "redirect:/";
	}

}






