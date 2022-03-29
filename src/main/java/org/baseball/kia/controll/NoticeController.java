package org.baseball.kia.controll;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NoticeController {
	@RequestMapping(value = "/intro", method = RequestMethod.GET)
	public String introduction() {
		return "/yg/intro";
	}
}
