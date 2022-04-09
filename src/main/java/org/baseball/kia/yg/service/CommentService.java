package org.baseball.kia.yg.service;

import java.util.List;

import org.baseball.kia.yg.entity.CommentVo;
import org.baseball.kia.yg.repository.CommentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService {
	@Autowired
	CommentDao commentDao;
	
	public List<CommentVo> readCmt(int boardNo) {
		return commentDao.readCmt(boardNo);
	}

	public void addCmt(CommentVo vo) {
		commentDao.addCmt(vo);
	}

	
}