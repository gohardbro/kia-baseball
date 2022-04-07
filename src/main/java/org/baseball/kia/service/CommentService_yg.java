package org.baseball.kia.service;

import java.util.List;

import org.baseball.kia.entity.CommentVo_yg;
import org.baseball.kia.repository.CommentDao_yg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService_yg {
	@Autowired
	CommentDao_yg commentDao;
	
	public List<CommentVo_yg> readCmt(int boardNo) {
		return commentDao.readCmt(boardNo);
	}

	public void addCmt(CommentVo_yg vo) {
		commentDao.addCmt(vo);
	}

	
}
