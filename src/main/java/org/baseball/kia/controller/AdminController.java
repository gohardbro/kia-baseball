package org.baseball.kia.controller;

import org.baseball.kia.entity.LineupVo;
import org.baseball.kia.entity.UniformInfoVo;
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
	public String adminHandle(Model model) { // 계정 관리 페이지 호출
		model.addAttribute("accountList", adminService.selectAccountByType("all"));
		model.addAttribute("menu", "account");
		return "/admin/account";
	}

	@RequestMapping(value = "/admin/account")
	public String adminAccountHandle(Model model, @RequestParam String type) { // 타입별 계정 정보 조회
		model.addAttribute("accountList", adminService.selectAccountByType(type));
		return "/admin/account-list";
	}
	
	@RequestMapping(value = "/admin/account/report")
	public String adminAccountReportHandle(@RequestParam String id) { // 신고 계정 차단 설정
		adminService.reportAccount(id);
		return "redirect: /admin";
	}
	

	@RequestMapping(value = "/admin/uniformInfo")
	public String uniformHandle(Model model) { // 상품 관리 페이지 호출
		model.addAttribute("uniformInfoList", adminService.selectUniformInfo(null));
		model.addAttribute("menu", "uniform");
		return "/admin/uniformInfo";
	}
	
	@RequestMapping(value = "/admin/uniformInfo/search")
	public String uniformInfoSearchHandle(@RequestParam String type, @RequestParam String word, Model model) { // 유니폼 검색
		UniformInfoVo vo = new UniformInfoVo();
		if (type.equals("uniformName")) {
			vo.setUniformName(word);
		
		} else if(type.equals("color")) {
			vo.setColor(word);
		
		} else if(type.equals("playerName")) {
			vo.setPlayerName(word);
		}
		
		model.addAttribute("uniformInfoList", adminService.selectUniformInfo(vo));
		return "/admin/uniformInfo-list";
	}
	
	@RequestMapping(value = "/admin/uniformInfo/update")
	public String uniformInfoUpdateHandle(@ModelAttribute UniformInfoVo vo) { // 유니폼 정보 수정
		adminService.updateUniformInfo(vo);
		return "redirect: /admin/uniformInfo";
	}

	@RequestMapping(value = "/admin/uniformInfo/insert")
	public String uniformInfoInsertHandle(@ModelAttribute UniformInfoVo vo) { // 유니폼 정보 등록
		System.out.println(vo);
		adminService.insertUniformInfo(vo);
		return "redirect: /admin/uniformInfo";
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
			adminService.updateLineup(vo);
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
