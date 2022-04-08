package org.baseball.kia.yg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GoodsController {
	
	@RequestMapping(value = "/goods", method = RequestMethod.GET)
	public String goodsPage(Model model) {
		return "yg/goods/goods";
	}
	
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String goodsInfo(Model model) {
		return "yg/goods/info";
	}
}
