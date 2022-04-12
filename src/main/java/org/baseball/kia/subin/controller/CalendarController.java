package org.baseball.kia.subin.controller;

import java.util.List;

import org.baseball.kia.subin.entity.CalendarVo;
import org.baseball.kia.subin.entity.ScheduleVo;
import org.baseball.kia.subin.service.CalendarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CalendarController {
	
	@Autowired
	CalendarService calendarService;
	
	@RequestMapping({"/kiaTigers/calendar", "/kiaTigers"})
	public String ScheduleHandle(Model model) { // 경기일정 페이지
		model.addAttribute("menu", "schedule");
		return "/kiaTigers/calendar";
	}
	
	@ResponseBody
	@RequestMapping("/kiaTigers/calendar/search")
	public List<CalendarVo> scheduleSearchHandle(@RequestParam String gameMonth) { // 월별 경기일정 불러오기
		return calendarService.selectScheduleByMonth(gameMonth);
	}
}
