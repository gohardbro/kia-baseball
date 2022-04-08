package org.baseball.kia.subin.controller;

import org.baseball.kia.subin.entity.AccountPage;
import org.baseball.kia.subin.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String adminAccountHandle(Model model, @RequestParam String type) { // 타입별 계정 정보 조회
		AccountPage page = new AccountPage();
		page.setType(type); // 검색할 계정 타입 설정
		page.setPageList(10); // 페이지당 보여질 목록 수
		page.setCurPage(1); // 요청 페이지 번호
		page.setBlockPage(3); // 블럭당 보여질 페이지의 수
		page.setTotalList(accountService.selectAccountCnt()); // 전체 회원수
		page.setAccountList(accountService.selectAccountByType(page)); // 검색된 회원 정보 리스트
		model.addAttribute("accountInfo", page);
		return "/admin/account-list";
	}

	@RequestMapping(value = "/admin/account/report")
	public String adminAccountReportHandle(@RequestParam String id) { // 신고 계정 차단 설정
		accountService.reportAccount(id);
		return "redirect: /admin";
	}
}
