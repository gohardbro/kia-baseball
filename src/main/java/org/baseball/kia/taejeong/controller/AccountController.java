package org.baseball.kia.taejeong.controller;

import javax.servlet.http.HttpSession;

import org.baseball.kia.taejeong.entity.AccountVo;
import org.baseball.kia.taejeong.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AccountController {
	
	@Autowired
	AccountService accountService;
	
	
	@GetMapping("/account")
	public String accountGetHandle() {
		return "taejeong/account/passwordCheck";
	}
	
	@PostMapping("/account")
	public String accountPostHandle(@RequestParam String pw, HttpSession httpSession, Model model) {
		AccountVo vo = (AccountVo) httpSession.getAttribute("loginUser");
		String id = vo.getId();
		boolean valid = accountService.isValidAccount(id, pw);
		if(valid)
			return "taejeong/account/modify";
		else {
			model.addAttribute("pwCheckErrMsg", "비밀번호가 일치하지 않습니다.");
			return "taejeong/account/passwordCheck";
		}
	}
	
	@PostMapping("/modify/password")
	public String modifyPwHandle(@ModelAttribute AccountVo vo, @RequestParam String new_pw_again, HttpSession httpSession, Model model) {
		AccountVo loginUser = (AccountVo) httpSession.getAttribute("loginUser");
		String id = loginUser.getId();
		String pw = vo.getPw();
		boolean valid = accountService.isValidAccount(id, pw);
		if(valid) {
			vo.setId(id);
			vo.setPw(new_pw_again);
			accountService.updatePw(vo);
			model.addAttribute("updatePwMsg","비밀번호가 변경 되었습니다.");
			System.out.println("비밀번호 변경완료");
		} else {
			model.addAttribute("updatePwMsg","기존 비밀번호가 틀립니다.");
		}
		
		return "taejeong/account/modify";
	}
	
	@PostMapping("/modify/nickname")
	public String modifyNicknameHandle(@ModelAttribute AccountVo vo, HttpSession httpSession, Model model) {
		AccountVo loginUser = (AccountVo) httpSession.getAttribute("loginUser");
		String id = loginUser.getId();
		vo.setId(id);
		boolean r = accountService.modifyAccount(vo);
		if(r) {
			loginUser.setNickname(vo.getNickname());
			httpSession.setAttribute("loginUser", loginUser);
			System.out.println("닉네임 변경성공");
			return "taejeong/account/modify";
		}
		
		return "taejeong/account/modify";
	}

	
	@PostMapping("/modify/phone")
	public String modifyPhoneHandle(@ModelAttribute AccountVo vo, HttpSession httpSession, Model model) {
		AccountVo loginUser = (AccountVo) httpSession.getAttribute("loginUser");
		String id = loginUser.getId();
		String convertedPhone = accountService.phone_format(vo.getPhone());
		vo.setPhone(convertedPhone);
		vo.setId(id);
		boolean r = accountService.modifyAccount(vo);
		if(r) {
			loginUser.setPhone(convertedPhone);
			httpSession.setAttribute("loginUser", loginUser);
			model.addAttribute("successMsg", "성공");
			System.out.println("폰번호 변경성공");
			return "taejeong/account/modify";
		}
		
		return "taejeong/account/modify";
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
