package org.baseball.kia.yg.controller;

import javax.servlet.http.HttpSession;

import org.baseball.kia.taejeong.entity.AccountVo;
import org.baseball.kia.yg.entity.UniformInfoVo;
import org.baseball.kia.yg.entity.UniformVo;
import org.baseball.kia.yg.service.UniformInfoService;
import org.baseball.kia.yg.service.UniformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class GoodsController {
	
	@Autowired
	UniformInfoService uniInfoService;
	
	@Autowired
	UniformService uniformService;
	
	@RequestMapping(value = "/goods", method = RequestMethod.GET)
	public String goodsPage(Model model, UniformInfoVo vo) {
		model.addAttribute("uniInfo", uniInfoService.goodsList(vo));
		return "yg/goods/goods";
	}
	
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String goodsInfo(Model model, @RequestParam("uniInfoNo") int no) {
		UniformInfoVo vo = uniInfoService.goodsInfo(no);
		System.out.println(vo.getUniInfoNo());
		model.addAttribute("uniInfo",vo);
		return "yg/goods/info";
	}
	
	@RequestMapping(value = "/basket", method = RequestMethod.GET)
	public String goodsBascket(Model model, HttpSession httpSession, @RequestParam("uniInfoNo") int no) {
		AccountVo loginUserVo = (AccountVo) httpSession.getAttribute("loginUser");
		UniformInfoVo infovo = uniInfoService.goodsInfo(no);
		//UniformVo univo = uniformService.getBasketList(infovo);
		
		return "yg/goods/uniformbasket";
	}
}
