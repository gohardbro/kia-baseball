package org.baseball.kia.taejeong.controller;

import java.util.Map;

import javax.validation.Valid;

import org.baseball.kia.taejeong.entity.AccountVo;
import org.baseball.kia.taejeong.service.AccountService;
import org.baseball.kia.taejeong.service.MailService;
import org.baseball.kia.taejeong.service.SignUpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String signupPostHandle(@ModelAttribute AccountVo vo, BindingResult result,
			Model model, RedirectAttributes redirectAttributes) {
		String phone = vo.getPhone();
		String convertedPhone = accountService.phone_format(phone); //그냥숫자 폰번호양식으로 변환. ex) 01022224444 -> 010-2222-4444
		vo.setPhone(convertedPhone);
		
		
		if (result.hasErrors()) {
			return "taejeong/signup/signup";
		}
		
		boolean r = signUpService.registerAccount(vo);
		if(r==true)
			System.out.println("회원가입 등록 : " + r);
			redirectAttributes.addFlashAttribute("registerAccount", "success");
		

		return "redirect:/login";
	}
	
	//이메일 인증키 발송
	@RequestMapping("/signup/auth")
	@ResponseBody
	public String authHandle(@RequestParam String email) {
		Map<String, Object> map = mailService.sendAuthMailTo(email);
		return (String) map.get("authKey");
	}

	// 닉네임 중복체크
	@RequestMapping("/signup/nicknameCheck")
	@ResponseBody
	public int nickNameCheckHandle(@RequestParam String nickname) {
		int cnt = signUpService.nickNameCheck(nickname);
		return cnt;
	}
	
	//아이디 중복시 예외처리
	@ExceptionHandler(DuplicateKeyException.class)
	public Object errAlreadyExistId(Model model, RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("errAlreadyExistId", "1");
		return "redirect:/signup";
	}

}
