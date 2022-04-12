package org.baseball.kia.eunji.controller;

import java.util.List;

import org.baseball.kia.eunji.entity.SeatChoiceVo;
import org.baseball.kia.eunji.service.SeatChoiceService;
import org.baseball.kia.eunji.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SeatController {

	@Autowired
	TicketService ticketService;
	@Autowired
	SeatChoiceService seatChoiceService;

		// ticketDetail
		@RequestMapping("/ticketDetail")
		public String ticketDetail(@RequestParam int scheduleNo, Model model) {

		// 선택한 1경기
		model.addAttribute("oneGame", seatChoiceService.selectGame(scheduleNo));
		model.addAttribute("menu", "ticketDetail");

		// seat radio(k3,k5..) 반복문
		List<SeatChoiceVo> list = seatChoiceService.seatChoice();
		model.addAttribute("seatChoice", list);

		return "/ticket/ticketDetail";
	}

}
