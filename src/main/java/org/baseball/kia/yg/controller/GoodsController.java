package org.baseball.kia.yg.controller;

import javax.servlet.http.HttpSession;

import org.baseball.kia.taejeong.entity.AccountVo;
import org.baseball.kia.yg.entity.UniformInfoVo;
import org.baseball.kia.yg.entity.UniformVo;
import org.baseball.kia.yg.service.PlayerService;
import org.baseball.kia.yg.service.UniformInfoService;
import org.baseball.kia.yg.service.UniformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class GoodsController {

	@Autowired
	UniformInfoService uniInfoService;

	@Autowired
	UniformService uniformService;

	@Autowired
	PlayerService playerService;

	@RequestMapping(value = "/goods", method = RequestMethod.GET)
	public String goodsPage(Model model, UniformInfoVo vo) {
		model.addAttribute("uniInfo", uniInfoService.goodsList(vo));
		return "yg/goods/goods";
	}

	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String goodsInfoGet(Model model, @RequestParam("uniInfoNo") int no, HttpSession httpSession) {
		UniformInfoVo vo = uniInfoService.goodsInfo(no);
		model.addAttribute("uniInfo", vo);

		model.addAttribute("plyer", playerService.getPlayerNo());

		return "yg/goods/info";
	}

	@RequestMapping(value = "/info", method = RequestMethod.POST)
	public String goodsInfoPost(Model model, HttpSession httpSession, @ModelAttribute("vo") UniformVo vo) {

		AccountVo loginUserVo = (AccountVo) httpSession.getAttribute("loginUser");
		vo.setBuyer(loginUserVo.getId());
		
		boolean rst = uniformService.insertBasket(vo);
		if (!rst) {
			return "yg/goods/info?no=" + vo.getUniInfoNo();
		}
		return "redirect:/goods";
	}

}
