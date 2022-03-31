package org.baseball.kia.controller;

import org.baseball.kia.entity.LineupVo;
import org.baseball.kia.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value = "/admin")
	public String adminAccountHandle(Model model) { // 계정 관리 페이지 호출
		model.addAttribute("menu", "account");
		return "/admin/account";
	}

	@RequestMapping(value = "/admin/uniform")
	public String uniformHandle(Model model) { // 상품 관리 페이지 호출
		model.addAttribute("menu", "uniform");
		return "/admin/uniform";
	}

	@RequestMapping(value = "/admin/lineup")
	public String lineupHandle(Model model) { // 라인업 페이지 호출
		model.addAttribute("scheduleList", adminService.selectSchedule());// 경기일정 조회
		model.addAttribute("menu", "lineup");
		return "/admin/lineup";
	}

	@RequestMapping(value = "/admin/lineup/insert")
	public String lineupInsertHandle(Model model, @ModelAttribute LineupVo vo, @RequestParam String service) { // 라인업 입력, 수정
		
		if (service.equals("insert")) { // 라인업 입력
			adminService.insertLineup(vo);
			
		} else if (service.equals("update")) { // 라인업 수정
			adminService.updateLine(vo);
			
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
		return adminService.selectLineup(vo);
	}
	
	@RequestMapping(value = "/admin/ticket")
	public String ticketHandle(Model model) { // 티켓 예매내역 조회 페이지 호출
		model.addAttribute("menu", "ticket");
		return "/admin/ticket";
	}

	@RequestMapping(value = "/admin/uniformList")
	public String uniformListHandle(Model model) { // 상품 구매내역 조회 페이지 호출
		model.addAttribute("menu", "uniformList");
		return "/admin/uniformList";
	}
	
}
