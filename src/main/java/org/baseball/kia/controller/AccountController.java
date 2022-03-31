package org.baseball.kia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AccountController {

	@GetMapping("/mypage/account")
	public String accountInfoGetHandle() {
		return "taejeong/account/passwordCheck";
	}
	@PostMapping("/mypage/account")
	public String accountInfoPostHandle() {
		return "taejeong/account/info";
	}
}
