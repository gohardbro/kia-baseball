package org.baseball.kia.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.entity.CommentVo_yg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDao_yg {
	
	@Autowired
	SqlSession sqlSession;

	public List<CommentVo_yg> readCmt(int boardNo) {
		return sqlSession.selectList("comment.selectAll",boardNo);
	}

	public void addCmt(CommentVo_yg vo) {
		sqlSession.insert("comment.insertOne",vo);
	}

}
