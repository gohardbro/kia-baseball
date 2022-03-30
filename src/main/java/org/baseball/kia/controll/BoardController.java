package org.baseball.kia.controll;

import org.baseball.kia.entity.BoardVo;
import org.baseball.kia.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;

	@RequestMapping(value = "/intro", method = RequestMethod.GET)
	public String introduction() {
		return "/yg/intro";
	}

	@RequestMapping(method = RequestMethod.GET)
	public String defaultBoard(Model model) {
		model.addAttribute("all", boardService.getAll());
		return "/yg/board";
	}

	@RequestMapping(value = "/free", method = RequestMethod.GET)
	public String freeBoard() {
		return "/yg/board";
	}


	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String boardGetWrite() {
		return "/yg/boardwrite";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String boardPostWrite(@ModelAttribute("vo") BoardVo vo, Model model) {
		boolean rst = boardService.addNewOne(vo);
		if (!rst) {
			return "/yg/boardwrite";
		}
		return "/yg/board";
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String boardView(Model model) {
		return "/yg/boardview";
	}
}
