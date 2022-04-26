package org.baseball.kia.yg.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.baseball.kia.taejeong.entity.AccountVo;
import org.baseball.kia.yg.entity.CommentVo;
import org.baseball.kia.yg.entity.LikeVo;
import org.baseball.kia.yg.service.CommentService;
import org.baseball.kia.yg.service.LikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/boardviewCtr")
public class RestBoardController {

	@Autowired
	CommentService commentService;
	
	@Autowired
	LikeService likeService;

	@RequestMapping(value = "/getCmtList", method = RequestMethod.POST)
	public List<CommentVo> getReplyList(@RequestParam("boardNo") int no) {
		return commentService.getReplyList(no);
	}

	@RequestMapping(value = "/insertCmt", method = RequestMethod.POST)
	public Map<String, Object> insertCmt(@RequestBody CommentVo vo) throws Exception {
		Map<String, Object> result = new HashMap<>();
		try {
			commentService.insertCmt(vo);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		return result;
	}

	@RequestMapping(value = "/updateCmt", method = { RequestMethod.GET, RequestMethod.POST })
	public Map<String, Object> updateReply(@RequestBody CommentVo vo) throws Exception {
		Map<String, Object> result = new HashMap<>();
		try {
			commentService.updateReply(vo);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		return result;
	}

	@RequestMapping(value = "/deleteCmt", method = { RequestMethod.GET, RequestMethod.POST })
	public Map<String, Object> deleteReply(@RequestParam("commentNo") int cno) throws Exception {
		Map<String, Object> result = new HashMap<>();
		try {
			commentService.deleteReply(cno);
			result.put("status", "OK");

		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		return result;
	}
	
	@RequestMapping(value = "/likeupdate", method = { RequestMethod.GET, RequestMethod.POST })
	public Map<String,String> likeupdate(@RequestBody LikeVo vo){
		System.out.println("likeupdate.."+vo);
		Map<String,String> result = new HashMap<String, String>();
		try {
			likeService.updateLike(vo);
			result.put("result", "success");
		}catch(Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
		}
		return result;
	}
}
