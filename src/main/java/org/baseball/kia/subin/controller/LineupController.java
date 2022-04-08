package org.baseball.kia.subin.controller;

import java.util.List;

import org.baseball.kia.subin.entity.LineupVo;
import org.baseball.kia.subin.entity.PlayerVo;
import org.baseball.kia.subin.service.LineupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("lineupConroller_subin")
public class LineupController {

	@Autowired
	LineupService lineupService;
	
	@RequestMapping(value = "/admin/lineup")
	public String lineupHandle(Model model) { // 라인업 페이지 호출
		model.addAttribute("scheduleList", lineupService.selectSchedule());// 경기일정 조회
		model.addAttribute("menu", "lineup");
		return "/admin/lineup";
	}

	@RequestMapping(value = "/admin/lineup/insert")
	public String lineupInsertHandle(Model model, @ModelAttribute LineupVo vo, @RequestParam String service) { // 라인업 입력, 수정

		if (service.equals("insert")) { // 라인업 입력
			lineupService.insertLineup(vo);

		} else if (service.equals("update")) { // 라인업 수정
			lineupService.updateLineup(vo);
		}

		model.addAttribute("menu", "lineup");
		return "redirect: /admin/lineup";
	}

	@ResponseBody
	@RequestMapping(value = "/admin/lineup/select")
	public LineupVo lineupSelectHandle(Model model, @RequestParam String gameDate, @RequestParam String gameTime) { // 라인업 조회
		LineupVo vo = new LineupVo();
		vo.setGameDate(gameDate);
		vo.setGameTime(gameTime);
		return lineupService.selectLineup(vo);
	}
	
	@ResponseBody
	@RequestMapping(value="/admin/lineup/findPlayer")
	public List<PlayerVo> lineupFindPlayerHandle(@RequestParam String name) { // 라인업 선수이름 자동완성
		return lineupService.selectNameAutoComplete(name);
	}
}
