package org.baseball.kia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@RequestMapping(value = "/admin")
	public String adminAccountHandle(Model model) { // 계정 관리
		model.addAttribute("menu", "account");
		return "/admin/account";
	}

	@RequestMapping(value = "/admin/uniform")
	public String uniformHandle(Model model) { // 상품 관리
		model.addAttribute("menu", "uniform");
		return "/admin/uniform";
	}

	@RequestMapping(value = "/admin/lineup")
	public String lineupHandle(Model model) { // 라인업 입력
		model.addAttribute("menu", "lineup");
		return "/admin/lineup";
	}

	@RequestMapping(value = "/admin/ticket")
	public String ticketHandle(Model model) { // 티켓 예매내역 조회
		model.addAttribute("menu", "ticket");
		return "/admin/ticket";
	}

	@RequestMapping(value = "/admin/uniformList")
	public String uniformListHandle(Model model) { // 상품 구매내역 조회
		model.addAttribute("menu", "uniformList");
		return "/admin/uniformList";
	}
	
}
