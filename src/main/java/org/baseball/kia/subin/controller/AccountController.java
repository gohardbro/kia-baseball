package org.baseball.kia.subin.controller;

import org.baseball.kia.subin.entity.AccountPage;
import org.baseball.kia.subin.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("accountController_subin")
public class AccountController {

	@Autowired
	AccountService accountService;
	
	@RequestMapping(value = "/admin")
	public String adminHandle(Model model) { // 계정 관리 페이지 호출
		model.addAttribute("menu", "account");
		return "/admin/account";
	}

	@RequestMapping(value = "/admin/account")
	public String adminAccountHandle(Model model, @ModelAttribute AccountPage page) { // 타입별 계정 정보 조회
		page.setTotalList(accountService.selectAccountCnt()); // 타입별 회원수
		page.setAccountList(accountService.selectAccountByType(page)); // 검색된 회원 정보 리스트
		System.out.println(page); //
		model.addAttribute("page", page);
		return "/admin/account-list";
	}

	@RequestMapping(value = "/admin/account/report")
	public String adminAccountReportHandle(@RequestParam String id) { // 신고 계정 차단 설정
		accountService.reportAccount(id);
		return "redirect: /admin";
	}
	
	@RequestMapping(value = "/admin/account/page")
	public String pageHandle(@RequestParam AccountPage page, Model model) { // 페이지 정보
		model.addAttribute("page", page);
		return "/admin/include/page";
	}
}
