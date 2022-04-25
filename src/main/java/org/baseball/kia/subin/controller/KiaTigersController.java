package org.baseball.kia.subin.controller;

import java.util.HashMap;
import java.util.Map;

import org.baseball.kia.subin.entity.CalendarVo;
import org.baseball.kia.subin.entity.LineupVo;
import org.baseball.kia.subin.entity.ScoreVo;
import org.baseball.kia.subin.service.CalendarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class KiaTigersController {

	@Autowired
	CalendarService calendarService;
	
	@RequestMapping({"/kiaTigers", "/kiaTigers/intro"})
	public String ScheduleHandle(Model model) { // 경기일정 페이지
		model.addAttribute("menu", "intro");
		return "/yg/introteam";
	}
	
	@RequestMapping("/kiaTigers/calendar")
	public String calendarHandle(Model model) {
		model.addAttribute("menu", "schedule");
		return "/subin/kiaTigers/calendar";
	}
	
	
	@ResponseBody
	@RequestMapping("/kiaTigers/calendar/search")
	public Map<String, CalendarVo> scheduleSearchHandle(@RequestParam String gameMonth) { // 월별 경기일정 불러오기
		return calendarService.selectScheduleByMonth(gameMonth);
	}

	@ResponseBody
	@RequestMapping("/kiaTigers/calendar/popup")
	public Map<String, Object> schedulePopupHandle(@RequestParam int scheduleNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schedule", calendarService.selectScheduleByNo(scheduleNo));

		LineupVo lineup = calendarService.selectLineup(scheduleNo);
		if (lineup == null) {
			map.put("lineup", lineup);
		} else {
			map.put("lineup", lineup.setHitterList());
		}
		
		ScoreVo score = calendarService.selectScoreVo(scheduleNo);
		if (score == null) {
			map.put("score", score);
		} else {
			map.put("score", score.setArray());
		}
		return map;
	}
	
	@RequestMapping("/kiaTigers/map")
	public String mapHandle(Model model) { // 지도 페이지 호출
		model.addAttribute("menu", "map");
		return "/subin/kiaTigers/map";
	}
	
	@RequestMapping("/chatting")
	public String chatHandle() { // 실시간 채팅 페이지 호출
		return "/subin/chatting";
	}

}
