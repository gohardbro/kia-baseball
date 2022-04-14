package org.baseball.kia;

import java.util.Locale;

import org.baseball.kia.subin.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	HomeService homeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		model.addAttribute("uniformTop10", homeService.selectUniformInfoTop10()); // 인기 유니폼 정보
		model.addAttribute("boardHot5", homeService.selectBoardHot5());
		return "index";
	}
	
}