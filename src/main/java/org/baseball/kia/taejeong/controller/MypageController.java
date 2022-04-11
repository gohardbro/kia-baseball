package org.baseball.kia.taejeong.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.baseball.kia.taejeong.entity.AccountVo;
import org.baseball.kia.taejeong.entity.BaseballVo;
import org.baseball.kia.taejeong.entity.InquiryVo;
import org.baseball.kia.taejeong.entity.TUniformVo;
import org.baseball.kia.taejeong.service.BaseballService;
import org.baseball.kia.taejeong.service.InquiryService;
import org.baseball.kia.taejeong.service.TUniformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MypageController {

	@Autowired
	BaseballService baseballService;

	@Autowired
	TUniformService tUniformService;

	@Autowired
	InquiryService inquiryService;

	@RequestMapping("/home")
	public String homeHandle() {
		return "index";
	}

	@RequestMapping("/mypage")
	public String mypageHandle() {
		return "taejeong/mypage/mypageTicket";
	}

	@RequestMapping({ "/ticket/search", "/ticket/searchByPeriod" })
	public String ticketHandle(@ModelAttribute BaseballVo baseballVo, HttpSession httpSession, Model model) {
		AccountVo loginUserVo = (AccountVo) httpSession.getAttribute("loginUser");
		baseballVo.setBuyer(loginUserVo.getId());
		List<BaseballVo> list = baseballService.getAllById(baseballVo);
		int i = 0;
		for (BaseballVo baseballVo2 : list) {
			String gameDate = baseballVo2.getGameDate();
			Calendar calender = Calendar.getInstance();
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date date = null;
			try {
				date = df.parse(gameDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			calender.setTime(date);
			calender.add(Calendar.DATE, -1);

			model.addAttribute("cancelDate" + (i++), df.format(calender.getTime()));
		}
		model.addAttribute("ticketList", list);

		return "taejeong/mypage/mypageTicket";
	}

	@RequestMapping("/ticket/ticketDetail")
	public String ticketDetailHandle(@ModelAttribute BaseballVo baseballVo, HttpSession httpSession, Model model) {
		AccountVo loginUserVo = (AccountVo) httpSession.getAttribute("loginUser");
		baseballVo.setBuyer(loginUserVo.getId());

		List<BaseballVo> list = baseballService.getAllById(baseballVo);
		model.addAttribute("ticketList", list);
		return "taejeong/mypage/mypageTicketDetail";
	}

	@RequestMapping("/ticket/ticketCancel")
	public String ticketCancelHandle(@RequestParam int baseballNo, HttpSession httpSession, Model model,
			HttpServletResponse response) {
		boolean r = baseballService.cancelOneTicket(baseballNo);

		return "taejeong/mypage/mypageTicket";
	}

	@RequestMapping("/purchaseHistory")
	public String purchaseHistoryHandle() {

		return "taejeong/mypage/purchaseHistory";
	}

	@RequestMapping({ "/purchaseHistory/search", "/purchaseHistory/searchByPeriod" })
	public String purchaseHistorySearchHandle(@ModelAttribute TUniformVo tUniformVo, HttpSession httpSession, Model model) {
		AccountVo loginUserVo = (AccountVo) httpSession.getAttribute("loginUser");
		tUniformVo.setBuyer(loginUserVo.getId());
		List<TUniformVo> list = tUniformService.getAllByBuyer(tUniformVo);
		model.addAttribute("uniformList", list);

		return "taejeong/mypage/purchaseHistory";
	}

	@RequestMapping("/inquiry")
	public String inquiryHandle() {
		return "taejeong/mypage/inquiry";
	}

	@PostMapping("/inquiry/write")
	public String inquiryPostHandle(@ModelAttribute InquiryVo inquiryVo, HttpSession httpSession,
			RedirectAttributes ra) {
		AccountVo loginUserVo = (AccountVo) httpSession.getAttribute("loginUser");
		inquiryVo.setWriter(loginUserVo.getId());
		int r = inquiryService.writeInquiry(inquiryVo);
		if (r == 1) {
			ra.addFlashAttribute("inquryMsg", "success");
			return "redirect:/inquiry";
		}
		return "taejeong/mypage/inquiry";
	}

	@RequestMapping("/inquiry/history")
	public String inquiryHistoryHandle() {
		return "taejeong/mypage/inquiryHistory";
	}

	@PostMapping("/inquiry/history")
	public String inquiryHistoryPostHandle(@ModelAttribute InquiryVo inquiryVo, HttpSession httpSession, Model model) {
		AccountVo loginUserVo = (AccountVo) httpSession.getAttribute("loginUser");
		inquiryVo.setWriter(loginUserVo.getId());
		List<InquiryVo> list = inquiryService.getHistory(inquiryVo);
		model.addAttribute("historyList", list);

		return "taejeong/mypage/inquiryHistory";
	}
	
	@RequestMapping("/cart")
	public String cartHandle(@ModelAttribute TUniformVo tUniformVo, HttpSession httpSession, Model model) {
		AccountVo loginUserVo = (AccountVo) httpSession.getAttribute("loginUser");
		tUniformVo.setBuyer(loginUserVo.getId());
		List<TUniformVo> list = tUniformService.getAllByBuyer(tUniformVo);
		System.out.println(tUniformVo.toString());
		model.addAttribute("uniformCartList", list);
		return "taejeong/mypage/cart";
	}

}

































