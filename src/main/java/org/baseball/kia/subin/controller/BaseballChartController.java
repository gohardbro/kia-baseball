package org.baseball.kia.subin.controller;

import java.util.Calendar;
import java.util.Map;

import org.baseball.kia.subin.entity.BaseballChartVo;
import org.baseball.kia.subin.service.BaseballChartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("baseballChartController_subin")
public class BaseballChartController {
	@Autowired
	BaseballChartService baseballChartService;

	@RequestMapping(value = "/admin/ticket")
	public String ticketHandle(Model model) { // 티켓 예매내역 페이지 호출
		model.addAttribute("menu", "ticket");
		return "/admin/ticket";
	}

	@ResponseBody
	@RequestMapping(value = "/admin/ticket/search")
	public Map<String, Object> ticketSearchHandle(@ModelAttribute BaseballChartVo vo, Model model) { // 티켓예매내역 검색
		return baseballChartService.selectBaseballChartData(vo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/ticket/calendar")
	public int monthAndWeekHandle(@RequestParam String gameMonth, Model model) { // 월별 주차 구하기
		String[] gameDate = gameMonth.split("-");
		Calendar calendar = Calendar.getInstance();
		
		calendar.set(Integer.parseInt(gameDate[0]), Integer.parseInt(gameDate[1])-1, 1); // 1일로 세팅
//		System.out.println("마지막 날 : "+calendar.getActualMaximum(Calendar.DATE)); // 마지막 날을 구한다. 
		calendar.set(Integer.parseInt(gameDate[0]), Integer.parseInt(gameDate[1])-1, calendar.getActualMaximum(Calendar.DATE));// 마지막 날짜를 넣어서 셋팅해준다. 
//		System.out.println("마지막 주 : "+calendar.get(Calendar.WEEK_OF_MONTH)); // calendar 현재 주를 구한다.
		return calendar.get(Calendar.WEEK_OF_MONTH);
	}
}
