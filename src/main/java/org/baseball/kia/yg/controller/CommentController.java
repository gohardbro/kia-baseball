package org.baseball.kia.yg.controller;

import org.baseball.kia.yg.entity.CommentVo;
import org.baseball.kia.yg.service.CommentService;
import org.baseball.kia.yg.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CommentController {
	@Autowired
	CommentService commentService;

	@RequestMapping(value = "/addComment", method = RequestMethod.POST)
	public String _addComment(CommentVo vo, Criteria cri, RedirectAttributes rttr) {
		commentService.addCmt(vo);
		rttr.addAttribute("boardNo", vo.getBoardNo());
		return "redirect:/boardview?no=" + vo.getBoardNo();
	}
	
	@RequestMapping(value="/updateCmt", method = RequestMethod.GET)
	public String replyUpdateView(CommentVo vo, Model model) throws Exception {
		
		model.addAttribute("updateCmt", commentService.selectCmt(vo.getCommentNo()));
		
		return "/yg/boardview";
	}
	
	@RequestMapping(value="/updateCmt", method = RequestMethod.POST)
	public String replyUpdate(CommentVo vo, RedirectAttributes rttr) throws Exception {
		
		commentService.updateCmt(vo);
		
		rttr.addAttribute("boardNo", vo.getBoardNo());
		
		return "redirect:/boardview?no=" + vo.getBoardNo();
	}
	
	@RequestMapping(value="/delelteCmt", method = RequestMethod.GET)
	public String replyDeleteView(CommentVo vo, Model model) throws Exception {
		
		model.addAttribute("deleteCmt", commentService.selectCmt(vo.getCommentNo()));

		return "/yg/boardview";
	}
	
	@RequestMapping(value="/delelteCmt", method = RequestMethod.POST)
	public String replyDelete(CommentVo vo, RedirectAttributes rttr) throws Exception {
		
		commentService.deleteCmt(vo);
		
		rttr.addAttribute("boardNo", vo.getBoardNo());
		
		return "redirect:/boardview?no=" + vo.getBoardNo();
	}
}
