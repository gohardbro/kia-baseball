package org.baseball.kia;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "index";
	}
	
	// 기본 템플릿 참고용
	@RequestMapping(value = "/announce", method = RequestMethod.GET)
	public String no() {
		return "/yg/announcement";
	}
	@RequestMapping(value = "/left", method = RequestMethod.GET)
	public String left() {
		return "/template/left-sidebar";
	}
	@RequestMapping(value = "/right", method = RequestMethod.GET)
	public String right() {
		return "/template/right-sidebar";
	}
	
}
