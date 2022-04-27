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
	public String ticketDetail(@RequestParam int scheduleNo, Model model) {

		// 선택한 1경기
		model.addAttribute("oneGame", seatChoiceService.selectGame(scheduleNo));
		model.addAttribute("menu", "ticketDetail");

		// seat radio 6개
		List<SeatChoiceVo> list = seatChoiceService.seatChoice();
		model.addAttribute("seatChoice", list);
		System.out.println(list.size());

		return "/ticket/ticketDetail";

	}

	@RequestMapping("/ticketPrice")
	@ResponseBody
	public int weekPrice(@RequestParam String yoil, @RequestParam String baseballZone, Model model) {
		System.out.println("ajax controller도착 ");
		System.out.println(yoil);
		System.out.println(baseballZone);
		SeatChoiceVo weekPrice = seatChoiceService.weekPrice(baseballZone);
		System.out.println( weekPrice );
		
		if(yoil.equals("토요일") || yoil.equals("일요일")) {
			return weekPrice.getPriceWeekend();
		}else {
			return weekPrice.getPriceWeekday();
		}
		 
		 
	}
	

}
