package org.baseball.kia.controller;

import java.util.Map;

import javax.validation.Valid;

import org.baseball.kia.entity.AccountVo;
import org.baseball.kia.service.AccountService;
import org.baseball.kia.service.MailService;
import org.baseball.kia.service.SignUpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SignUpController {

	@Autowired
	SignUpService signUpService;
	@Autowired
	MailService mailService;
	@Autowired
	AccountService accountService;

	@ModelAttribute
	public AccountVo defaultModel() {
		return new AccountVo();
	}

	@GetMapping("/signup")
	public String signupGetHandle() {
		return "taejeong/signup/signup";
	}


	@PostMapping("/signup")
	public String signupPostHandle(@ModelAttribute("accountVo") @Valid AccountVo vo, BindingResult result,
			Model model) {
		String phone = vo.getPhone();
		String convertedPhone = accountService.phone_format(phone); //그냥숫자 폰번호양식으로 변환. ex) 01022224444 -> 010-2222-4444
		vo.setPhone(convertedPhone);
		
		
		if (result.hasErrors()) {
			return "taejeong/signup/signup";
		}
		
		boolean r = signUpService.registerAccount(vo);
		System.out.println("회원가입 등록 : " + r);

		return "taejeong/account/login";
	}

	@RequestMapping("/signup/auth")
	@ResponseBody
	public String authHandle(@RequestParam String email) {
		Map<String, Object> map = mailService.sendAuthMailTo(email);
		String authKey = (String) map.get("authKey");
		return authKey;
	}

	// 닉네임 중복체크
	@RequestMapping("/signup/nicknameCheck")
	@ResponseBody
	public int nickNameCheckHandle(@RequestParam String nickname) {
		int cnt = signUpService.nickNameCheck(nickname);
		return cnt;
	}

}
