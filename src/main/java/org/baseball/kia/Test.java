package org.baseball.kia;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class Test {
	
	@RequestMapping
	public String testHandle() {
		return "test/login";
	}
	
	@RequestMapping("/home")
	public String homeHandle() {
		return "index";
	}
	
	
	@RequestMapping("/mypage")
	public String mypageHandle() {
		return "test/mypage";
	}
	
	@RequestMapping("/login/signup")
	public String signupHandle() {
		return "test/signup/signup";
	}
	@RequestMapping("/login/accountFind")
	public String accountFindHandle() {
		return "test/accountFind";
	}
	
	@GetMapping("/mypage/account")
	public String accountInfoGetHandle() {
		return "test/account/passwordCheck";
	}
	@PostMapping("/mypage/account")
	public String accountInfoPostHandle() {
		return "test/account/info";
	}
	
	@RequestMapping("/mypage/accountInfo2")
	public String testaHandle() {
		return "test/signup/signup";
	}
}
