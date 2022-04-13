package org.baseball.kia.yg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NoticeController {
	
	@RequestMapping(value = "/announce", method = RequestMethod.GET)
	public String no(Model model) {
		model.addAttribute("menu", "announce");
		return "/yg/notice/announcement";
	}

}
