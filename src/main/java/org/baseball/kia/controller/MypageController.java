package org.baseball.kia.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.baseball.kia.entity.AccountVo;
import org.baseball.kia.entity.BaseballVo;
import org.baseball.kia.service.BaseballService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

	@Autowired
	BaseballService baseballService;

	@RequestMapping("/home")
	public String homeHandle() {
		return "index";
	}

	@RequestMapping("/mypage")
	public String mypageHandle() {
		return "taejeong/mypage/mypageTicket";
	}

	@RequestMapping("/ticket/search")
	public String ticketSearchHandle(@ModelAttribute BaseballVo baseballVo, HttpSession httpSession, Model model) {
		AccountVo loginUserVo = (AccountVo) httpSession.getAttribute("loginUser");
		baseballVo.setBuyer(loginUserVo.getId());
		List<BaseballVo> list = baseballService.getAllById(baseballVo);

		model.addAttribute("ticketList", list);

		return "taejeong/mypage/mypageTicket";
	}
	
	@RequestMapping("")
	public String searchHandle() {

		return "taejeong/mypage/mypageTicket";
	}

}
