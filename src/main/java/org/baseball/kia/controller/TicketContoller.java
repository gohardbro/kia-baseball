package org.baseball.kia.controller;

import java.util.List;

import org.baseball.kia.entity.TicketVo;
import org.baseball.kia.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TicketContoller {
	

	@Autowired
	TicketService ticketService;
	
	//ticketHome 예매 리스트 뿌리기   
	@RequestMapping(value = "/ticket", method = RequestMethod.GET)
	public String ticketHome(Model model) {
		List<TicketVo> list = ticketService.gamelistAbleRev();
		model.addAttribute("gameList" , list); 
		return "/ticket/ticketMain";
	}
	
	//ticketMiddle 구역과 매수
	@RequestMapping("/ticketDetail")
	public String ticketMiddle(@RequestParam int scheduleNo, Model model) {
		model.addAttribute("gl", ticketService.getOneByScheduleNo(scheduleNo));
		return "/ticket/ticketDetail"; 
	}
	

}
