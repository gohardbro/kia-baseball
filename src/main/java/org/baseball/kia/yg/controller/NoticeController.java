package org.baseball.kia.yg.controller;

import org.baseball.kia.yg.entity.PagingVo;
import org.baseball.kia.yg.service.NoticeService;
import org.baseball.kia.yg.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping(value = "/announce", method = RequestMethod.GET)
	public String announceHandle(Model model, Criteria cri) {
		model.addAttribute("menu", "announce");
		model.addAttribute("all", noticeService.getAll(cri));
		
		PagingVo pvo = new PagingVo();
		pvo.setCri(cri);
		pvo.setTotalCount(noticeService.listCount());

		model.addAttribute("pvo", pvo);
		
		return "/yg/notice/announcement";
	}

}
