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

	public List<CommentVo> getReplyList(int bno) {
		return commentDao.getCmtList(bno);
	}

	public int insertCmt(CommentVo vo) {
		return commentDao.insertCmt(vo);
	}

	public int updateReply(CommentVo vo) {
		return commentDao.updateCmt(vo);
	}

	public int deleteReply(int cno) {
		return commentDao.deleteCmt(cno);
	}

}
