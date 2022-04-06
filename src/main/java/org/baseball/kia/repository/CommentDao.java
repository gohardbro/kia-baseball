package org.baseball.kia.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.entity.CommentVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDao {
	
	@Autowired
	SqlSession sqlSession;

	public List<CommentVo> list(int no) {
		return sqlSession.selectList("comment.selectAll",no);
	}
	public int count(int no) {
		return 0;
	}
	public void create(CommentVo vo) {
		sqlSession.insert("comment.insertOne",vo);
	}

}
