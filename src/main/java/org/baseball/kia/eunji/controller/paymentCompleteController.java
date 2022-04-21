package org.baseball.kia.eunji.controller;

import org.baseball.kia.eunji.entity.BuyerInfoVo;
import org.baseball.kia.eunji.service.PaymentCompleteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class paymentCompleteController {

	@Autowired
	PaymentCompleteService paymentCompleteService;

	// 결제완료시 baseball Table에 insert
	@PostMapping("/progress/payment")
	public String paymenetComplete(@ModelAttribute BuyerInfoVo info, Model model) {
		
		// 1. view에서 넘어온 정보들을 vo에 담아서 -> 서비스로 보낸다(insert)
		paymentCompleteService.paymentComplete(info);
		
		
		// 2. service에서 넘어온 no를 가지고 select문으로 출력
		BuyerInfoVo result = paymentCompleteService.showCompleteInfo(info.getBaseballNo());
		model.addAttribute("result", result);
		
		return "/ticket/paymentResult";
	}
	
		//test
		@GetMapping("/progress/payment")
		public String paymenetComplete2(@ModelAttribute BuyerInfoVo info, Model model) {
			
			return "/ticket/paymentResult";
		}

}
