package org.baseball.kia.subin.controller;

import org.baseball.kia.subin.service.UniformChartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("uniformChartConroller_subin")
public class UniformChartController {
	
	@Autowired
	UniformChartService uniformChartService;
	
	@RequestMapping(value = "/admin/uniformList")
	public String uniformListHandle(Model model) { // 상품 구매내역 조회 페이지 호출
		model.addAttribute("menu", "uniformList");
		model.addAttribute("uniformList", uniformChartService.selectUniformByPopularity());
		model.addAttribute("playerList", uniformChartService.selectPlayerByPopularity());
		return "/admin/uniformList";
	}
}
