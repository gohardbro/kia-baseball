package org.baseball.kia.controller;

import java.util.List;

import org.baseball.kia.entity.TicketVo;
import org.baseball.kia.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TicketContoller {
	

	@Autowired
	TicketService ticketService;
	
	//예매 첫 화면 : zoneInfo
	@GetMapping("/ticket")
	public String ticketHome(Model model) {
		model.addAttribute("menu","zoneInfo" );
		return "ticket/zoneInfo";
	}
	
	
	//ticketBuy에 경기 리스트 뿌려주기 
	@RequestMapping(value = "/ticketBuy", method = RequestMethod.GET)
	public String showGameList(Model model) {
		List<TicketVo> list = ticketService.showGameList();
		model.addAttribute("gameList" , list); 
		model.addAttribute("menu","ticketBuy" );
		return "/ticket/ticketBuy";
	}
	
	//ticketDetail (선택한 경기 정보 + 구역 + 매수 결정)
	@RequestMapping("/ticketDetail")
	public String selectGame(@RequestParam int no, Model model) {
		
		model.addAttribute("oneGame",ticketService.selectOne(no));
		model.addAttribute("menu","ticketDetail" );
		
		return "/ticket/ticketDetail";
	}

}
