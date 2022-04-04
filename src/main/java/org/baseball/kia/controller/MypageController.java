package org.baseball.kia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MypageController {
	
	
	
	@RequestMapping("/home")
	public String homeHandle() {
		return "index";
	}
	
	
	@RequestMapping("/mypage")
	public String mypageHandle() {
		return "taejeong/mypage/mypageTicket";
	}
	
	@RequestMapping("/ticket/search")
	public String TicketSearchHandle() {
		
		
		return "taejeong/mypage/mypageTicket";
	}
	
	
}
