package org.baseball.kia.controller;

import javax.servlet.http.HttpSession;

import org.baseball.kia.entity.AccountVo;
import org.baseball.kia.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
	@Autowired
	AccountService accountService;

	@RequestMapping("/login")
	public String loginHandle() {
		return "taejeong/account/login";
	}
	
	@RequestMapping("/login/accountFind")
	public String accountFindHandle() {
		return "taejeong/account/accountFind";
	}

	@PostMapping("/session")
	public String sessionHandle(HttpSession session, @RequestParam String loginId, @RequestParam String loginPass, Model model) {
		boolean valid = accountService.isValidAccount(loginId, loginPass);
		if (valid) {
			AccountVo vo = accountService.findAccountById(loginId);
			// vo == null ?
			session.setAttribute("loginUser", vo);
			return "redirect:/";
		} else {
			model.addAttribute("err", "error");
			return "login";
		}
	}
	
	@RequestMapping("/logout")
	public String logoutHandle(HttpSession session) {
		session.removeAttribute("loginUser");
		
		session.invalidate();	// 사용자세션을 리셋
		return "redirect:/";
	}

}






