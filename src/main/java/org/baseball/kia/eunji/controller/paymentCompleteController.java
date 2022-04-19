package org.baseball.kia.eunji.controller;

import org.baseball.kia.eunji.entity.BuyerInfoVo;
import org.baseball.kia.eunji.service.PaymentCompleteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class paymentCompleteController {

	@Autowired
	PaymentCompleteService paymentCompleteService; 
	
	
	//결제완료시 baseball Table에 insert
	@RequestMapping("/payment/complete")
	public String paymenetComplete (@RequestParam BuyerInfoVo info, Model model) {
		
		//하나씩 RequestParam으로 받아도 되고, 한꺼번에 받으려면 modelAttribute 
		
		// 1. view에서 넘어온 정보들을 vo에 담아서 -> 서비스로 보낸다(insert)
		// view->DB 가는거니까 request라서 requestParam으로 가져와서, vo에 담는다 
		BuyerInfoVo vo = new BuyerInfoVo(); 
		 
		 
		
		
		int no = paymentCompleteService.paymentComplete(info);
		// 2. service에서 넘어온 no를 가지고 select문으로 출력 
		vo = paymentCompleteService.showCompleteInfo(no);
		
		model.addAttribute("vo", vo);
		
		
		
		
		 
}
	
}
