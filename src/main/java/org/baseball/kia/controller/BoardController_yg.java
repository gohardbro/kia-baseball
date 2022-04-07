package org.baseball.kia.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.baseball.kia.entity.BoardVo_yg;
import org.baseball.kia.entity.CommentVo_yg;
import org.baseball.kia.entity.FileVo_yg;
import org.baseball.kia.entity.PagingVo_yg;
import org.baseball.kia.service.BoardService_yg;
import org.baseball.kia.service.CommentService_yg;
import org.baseball.kia.service.FileService_yg;
import org.baseball.kia.util.Criteria_yg;
import org.baseball.kia.util.FileUtils_yg;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class BoardController_yg {
	@Autowired
	BoardService_yg boardService;

	@Autowired
	FileService_yg fileService;
	
	@Autowired
	CommentService_yg commentService;

	@RequestMapping(value = "/announce", method = RequestMethod.GET)
	public String no(Model model) {
		model.addAttribute("menu","announce");
		return "/yg/announcement";
	}

	@RequestMapping(value = "/intro", method = RequestMethod.GET)
	public String introduction(Model model) {
		model.addAttribute("menu","intro");
		return "/yg/introteam";
	}

	@RequestMapping(value = "/free", method = RequestMethod.GET)
	public String defaultHandle(Model model, Criteria_yg cri) {
		model.addAttribute("menu","free");
		model.addAttribute("all", boardService.getAll(cri));
		
		PagingVo_yg pvo = new PagingVo_yg();
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
	public String insertPostHandle(@ModelAttribute("vo") BoardVo_yg vo, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsr) throws IOException {
		boolean rst = boardService.addNewOne(vo);

		int seq = vo.getBoardNo();
		FileUtils_yg fileUtils = new FileUtils_yg();
		List<FileVo_yg> fileList = fileUtils.parseFileInfo(seq, request, mhsr);
		if (!rst && CollectionUtils.isEmpty(fileList) == false) {
			fileService.insertFile(fileList);
		}
		return "redirect:/free";
	}

	@RequestMapping(value = "/boardview", method = RequestMethod.GET)
	public String insertPostHandle(@RequestParam int no, Model model,
			@SessionAttribute(required = false) Boolean auth) {

		boardService.updateCnt(no);
		BoardVo_yg vo = boardService.getOneByNo(no);
		if (vo == null) {
			return "redirect:/free";
		}
		model.addAttribute("one", vo);

		model.addAttribute("file", fileService.getFile(no));
		
		List<CommentVo_yg> cmtList = commentService.readCmt(vo.getBoardNo());
		model.addAttribute("cmtList",cmtList);

		return "/yg/boardview";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String boardDelete(@RequestParam("no") int no) {
		boardService.boardDelete(no);
		return "redirect:/free";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String getUpdate(@RequestParam("no") int no, Model model) {
		BoardVo_yg vo = boardService.getOneByNo(no);
		model.addAttribute("one", vo);
		return "/yg/boardupdate";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String postUpdate(BoardVo_yg vo) {
		boardService.update(vo);
		return "redirect:/boardview?no=" + vo.getBoardNo();
	}
	
	@RequestMapping(value="/addComment", method = RequestMethod.POST)
	public String _addComment(CommentVo_yg vo, Criteria_yg cri, RedirectAttributes rttr) {
		commentService.addCmt(vo);
		rttr.addAttribute("boardNo", vo.getBoardNo());
		
		
		return "redirect:/boardview?no=" + vo.getBoardNo();
	}
	

}
