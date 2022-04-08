package org.baseball.kia.eunji.controller;

import java.util.List;

/*import org.baseball.kia.entity.BaseballVo;*/
import org.baseball.kia.eunji.entity.TicketVo;
import org.baseball.kia.eunji.service.TicketService;
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
	
	/*
	 * //예매 첫 화면 : zoneInfo
	 * 
	 * @GetMapping("/ticket") public String ticketHome(Model model) {
	 * List<BaseballVo> list = ticketService.seatPriceTable();
	 * model.addAttribute("seat",list); model.addAttribute("menu","zoneInfo" );
	 * return "ticket/zoneInfo"; }
	 */
	
	//ticketBuy에 경기목록 뿌려주기 
	@RequestMapping(value = "/ticketBuy", method = RequestMethod.GET)
	public String showGameList(Model model) {
		List<TicketVo> list = ticketService.showGameList();
		model.addAttribute("gameList" , list); 
		model.addAttribute("menu","ticketBuy" );
		return "/eunji.ticket/ticketBuy";
	}
	
	
	//ticketDetail (선택한 경기 정보 1건)
	@RequestMapping("/ticketDetail")
	public String selectGame(@RequestParam int scheduleNo, Model model) {
		System.out.println("controller");
		model.addAttribute("oneGame",ticketService.selectGame(scheduleNo));
		model.addAttribute("menu","ticketDetail" );
		
		return "/eunji.ticket/ticketDetail";
	}

}
