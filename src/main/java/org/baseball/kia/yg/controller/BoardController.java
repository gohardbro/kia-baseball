package org.baseball.kia.yg.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.baseball.kia.yg.entity.BoardVo;
import org.baseball.kia.yg.entity.CommentVo;
import org.baseball.kia.yg.entity.FileVo;
import org.baseball.kia.yg.entity.PagingVo;
import org.baseball.kia.yg.service.BoardService;
import org.baseball.kia.yg.service.CommentService;
import org.baseball.kia.yg.service.FileService;
import org.baseball.kia.yg.util.Criteria;
import org.baseball.kia.yg.util.FileUtils;
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

	@Autowired
	FileService fileService;

	@Autowired
	CommentService commentService;

	@RequestMapping(value = "/announce", method = RequestMethod.GET)
	public String no(Model model) {
		model.addAttribute("menu", "announce");
		return "/yg/announcement";
	}

	@RequestMapping(value = "/intro", method = RequestMethod.GET)
	public String introduction(Model model) {
		model.addAttribute("menu", "intro");
		return "/yg/introteam";
	}

	@RequestMapping(value = "/free", method = RequestMethod.GET)
	public String defaultHandle(Model model, Criteria cri) {
		model.addAttribute("menu", "free");
		model.addAttribute("all", boardService.getAll(cri));

		PagingVo pvo = new PagingVo();
		pvo.setCri(cri);
		pvo.setTotalCount(boardService.listCount());

		model.addAttribute("pvo", pvo);
		return "/yg/board";
	}

	@RequestMapping(path = "/write", method = RequestMethod.GET)
	public String insertGetHandle(Model model) {
		return "yg/boardwrite";
	}

	@RequestMapping(path = "/write", method = RequestMethod.POST)
	public String insertPostHandle(@ModelAttribute("vo") BoardVo vo, HttpServletRequest request,
			MultipartHttpServletRequest mhsr) throws IOException {

		int bno = fileService.getBoardNo();

		FileUtils fileUtils = new FileUtils();
		List<FileVo> fileList = fileUtils.parseFileInfo(bno, request, mhsr);
		if (CollectionUtils.isEmpty(fileList) == false) {
			fileService.insertFileList(fileList);
		}
		
		boolean rst = boardService.addNewOne(vo);
		if (!rst) {
			return "/yg/boardwrite";
		}
		
		return "redirect:/free";
	}

	@RequestMapping(value = "/boardview", method = RequestMethod.GET)
	public String insertPostHandle(@RequestParam int no, Model model,
			@SessionAttribute(required = false) Boolean auth) {

		boardService.updateCnt(no);
		BoardVo vo = boardService.getOneByNo(no);
		if (vo == null) {
			return "redirect:/free";
		}
		model.addAttribute("one", vo);

		List<CommentVo> cmtList = commentService.readCmt(vo.getBoardNo());
		model.addAttribute("cmtList", cmtList);

		return "/yg/boardview";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String boardDelete(@RequestParam("no") int no) {
		if (no > 0) {
			boardService.boardCmtDelete(no);
		}
		return "redirect:/free";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String getUpdate(@RequestParam("no") int no, Model model) {
		BoardVo vo = boardService.getOneByNo(no);
		model.addAttribute("one", vo);
		return "/yg/boardupdate";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String postUpdate(BoardVo vo) {
		boardService.update(vo);
		return "redirect:/boardview?no=" + vo.getBoardNo();
	}

}
