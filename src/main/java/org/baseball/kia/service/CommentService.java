package org.baseball.kia.service;

import java.util.List;

import org.baseball.kia.entity.CommentVo;
import org.baseball.kia.repository.CommentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService {
	@Autowired
	CommentDao commentDao;
	
	public List<CommentVo> list(int no) {
		return commentDao.list(no);
	}
	
	public int count(int no) {
		return 0;
	}
	
	public void create(CommentVo vo) {
		commentDao.create(vo);
	}
	
}
