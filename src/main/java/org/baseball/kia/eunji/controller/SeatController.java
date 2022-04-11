package org.baseball.kia.eunji.controller;

import java.util.List;

import org.baseball.kia.eunji.entity.SeatChoiceVo;
import org.baseball.kia.eunji.service.SeatChoiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SeatController {
	
	@Autowired
	SeatChoiceService seatChoiceService;	
	
	//ticketDetail // radio 좌석선택 (k3,k5...) 
	@GetMapping("/ticketDetail")
	public String seatChoice(Model model) {
		List<SeatChoiceVo> list = seatChoiceService.seatChoice();
		model.addAttribute("seatChoice",list);
		return "/ticket/ticketDetail";
	}
	
	
	

}
