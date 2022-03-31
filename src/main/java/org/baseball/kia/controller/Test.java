package org.baseball.kia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Test {
	
	
	
	@RequestMapping("/home")
	public String homeHandle() {
		return "index";
	}
	
	
	@RequestMapping("/mypage")
	public String mypageHandle() {
		return "taejeong/mypage";
	}
	
	
	
	
}
