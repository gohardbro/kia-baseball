package org.baseball.kia.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.baseball.kia.entity.AccountVo;
import org.baseball.kia.entity.BaseballVo;
import org.baseball.kia.service.BaseballService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MypageController {

	@Autowired
	BaseballService baseballService;

	@RequestMapping("/home")
	public String homeHandle() {
		return "index";
	}

	@RequestMapping("/mypage")
	public String mypageHandle() {
		return "taejeong/mypage/mypageTicket";
	}

	@RequestMapping({"/ticket/search", "/ticket/searchByPeriod"})
	public String ticketHandle(@ModelAttribute BaseballVo baseballVo, HttpSession httpSession, Model model) {
		AccountVo loginUserVo = (AccountVo) httpSession.getAttribute("loginUser");
		baseballVo.setBuyer(loginUserVo.getId());
		
		List<BaseballVo> list = baseballService.getAllById(baseballVo);
		
		int i = 0;
		for (BaseballVo baseballVo2 : list) {
			String gameDate = baseballVo2.getGameDate();
			Calendar calender = Calendar.getInstance();
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	        Date date = null;
	        try {
	            date = df.parse(gameDate);
	        } catch (ParseException e) {
	            e.printStackTrace();
	        }
	        calender.setTime(date);
	        calender.add(Calendar.DATE, -1);
	        
	        model.addAttribute("cancelDate" + (i++), df.format(calender.getTime()));
		}
		model.addAttribute("ticketList", list);


		return "taejeong/mypage/mypageTicket";
	}
	
	

	@RequestMapping("/ticket/ticketDetail")
	public String ticketDetailHandle(@ModelAttribute BaseballVo baseballVo, HttpSession httpSession, Model model) {
		AccountVo loginUserVo = (AccountVo) httpSession.getAttribute("loginUser");
		baseballVo.setBuyer(loginUserVo.getId());
		
		List<BaseballVo> list = baseballService.getAllById(baseballVo);
		model.addAttribute("ticketList", list);
		return "taejeong/mypage/mypageTicketDetail";
	}
	
	@RequestMapping("/ticket/ticketCancel")
	public String ticketCancelHandle(@RequestParam int baseballNo, HttpSession httpSession, Model model) {
		boolean r = baseballService.cancelOneTicket(baseballNo);
		if(r)
			model.addAttribute("ticketCancelMsg", "티켓이 취소 되었습니다.");
		return "taejeong/mypage/mypageTicket";
	}


}























