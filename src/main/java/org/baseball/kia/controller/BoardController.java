package org.baseball.kia.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.baseball.kia.entity.AccountVo;
import org.baseball.kia.entity.BoardVo;
import org.baseball.kia.entity.FileVo;
import org.baseball.kia.service.BoardService;
import org.baseball.kia.service.FileService;
import org.baseball.kia.util.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;

	@Autowired
	FileService fileService;

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

		int seq = vo.getBoardNo();
		FileUtils fileUtils = new FileUtils();
		List<FileVo> fileList = fileUtils.parseFileInfo(seq, request, mhsr);
		if (!rst && CollectionUtils.isEmpty(fileList) == false) {
			fileService.insertFile(fileList);
		}

		return "/yg/board";
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

		model.addAttribute("file", fileService.getFile(no));

		return "/yg/boardview";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String boardDelete(@RequestParam("no") int no) {
		boardService.boardDelete(no);
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

	@RequestMapping(value = "/addComment")
	@ResponseBody
	public String _addComment(@ModelAttribute("boardVo") BoardVo boardVo, HttpServletRequest request) throws Exception{

		HttpSession session = request.getSession();
		AccountVo accountVo = (AccountVo) session.getAttribute("accountVo");
		try{
	        
			boardVo.setWriter(accountVo.getId());
			boardService.addComment(boardVo);
            
        } catch (Exception e){
            e.printStackTrace();
        }
		return "success";
	}

}
