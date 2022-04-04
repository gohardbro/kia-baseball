package org.baseball.kia.controll;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.baseball.kia.entity.BoardVo;
import org.baseball.kia.entity.FileVo;
import org.baseball.kia.service.BoardService;
import org.baseball.kia.util.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;

	@RequestMapping(value = "/announce", method = RequestMethod.GET)
	public String no() {
		return "/yg/announcement";
	}

	@RequestMapping(value = "/intro", method = RequestMethod.GET)
	public String introduction() {
		return "/yg/intro";
	}

	@RequestMapping(value = "/free", method = RequestMethod.GET)
	public String defaultHandle(Model model) {

		model.addAttribute("all", boardService.getAll());

		return "/yg/board";
	}

	@RequestMapping(path = "/write", method = RequestMethod.GET)
	public String insertGetHandle(Model model) {
		return "yg/boardwrite";
	}

	@RequestMapping(path = "/write", method = RequestMethod.POST)
	public String insertPostHandle(@ModelAttribute("vo") BoardVo vo, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsr) throws IOException {
		boolean rst = boardService.addNewOne(vo);
		int seq = vo.getBoard_No();
		FileUtils fileUtils = new FileUtils();
		List<FileVo> fileList = fileUtils.parseFileInfo(seq, request, mhsr);
		if (!rst && CollectionUtils.isEmpty(fileList) == false) {
			return "yg/boardwrite";
		}

		return "redirect:/yg";
	}

	@RequestMapping("/boardview")
	public String insertPostHandle(@RequestParam int no, Model model,
			@SessionAttribute(required = false) Boolean auth) {

		BoardVo vo = boardService.getOneByNo(no);
		if (vo == null) {
			return "redirect:/yg";
		}
		model.addAttribute("one", vo);

		return "/yg/boardview";
	}
}
