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
	public String goodsInfo(Model model, @RequestParam("uniInfoNo") int no, HttpSession httpSession) {
		UniformInfoVo vo = uniInfoService.goodsInfo(no);
		model.addAttribute("uniInfo", vo);
		model.addAttribute("plyer", playerService.getPlayerNo());
		
		AccountVo loginUserVo = (AccountVo) httpSession.getAttribute("loginUser");
		UniformVo univo = new UniformVo();
		univo.setBuyer(loginUserVo.getId());
		
		model.addAttribute("uniform", univo);
		
		return "yg/goods/info";
	}

	@RequestMapping(value = "/basket", method = RequestMethod.GET)
	public String goodsBascket(Model model, HttpSession httpSession, @RequestParam("uniInfoNo") int no) {

		UniformInfoVo infovo = uniInfoService.goodsInfo(no);
		model.addAttribute("uniInfo", infovo);

		AccountVo loginUserVo = (AccountVo) httpSession.getAttribute("loginUser");
		UniformVo univo = new UniformVo();
		univo.setBuyer(loginUserVo.getId());

		model.addAttribute("uniform", univo);

		return "yg/goods/uniformbasket";
	}
}
