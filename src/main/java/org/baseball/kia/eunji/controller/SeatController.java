package org.baseball.kia.eunji.controller;

import java.util.List;

import org.baseball.kia.eunji.entity.SeatChoiceVo;
import org.baseball.kia.eunji.service.SeatChoiceService;
import org.baseball.kia.eunji.service.SeatChoiceServiceImpl;
import org.baseball.kia.eunji.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SeatController {

	@Autowired
	TicketService ticketService;
	@Autowired
	SeatChoiceServiceImpl seatChoiceService;

	// ticketDetail
	@RequestMapping("/ticketDetail")
	public String ticketDetail(@RequestParam int scheduleNo,  Model model) {

		// 선택한 1경기
		model.addAttribute("oneGame", seatChoiceService.selectGame(scheduleNo));
		model.addAttribute("menu", "ticketDetail");

		// seat radio(k3,k5..) 반복문
		List<SeatChoiceVo> list = seatChoiceService.seatChoice();
		model.addAttribute("seatChoice", list);
		System.out.println(list.size());
		

		return "/ticket/ticketDetail";
		
	}

	

	@RequestMapping("/ticketPrice")
	@ResponseBody
	public int weekPrice(@RequestParam String yoil, @RequestParam String baseballZone, Model model) {
		
		
		SeatChoiceVo weekPrice = seatChoiceService.weekPrice(baseballZone);
		
	 
		
		switch(yoil){
			case "월요일": 
			case "화요일":
			case "수요일":
			case "목요일":
			case "금요일":
				return weekPrice.getPriceWeekday();

			default:
			return weekPrice.getPriceWeekend();
		 
		}
		
		
	}

	
	

}
