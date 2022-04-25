package org.baseball.kia.yg.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.yg.entity.CommentVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDao {

	@Autowired
	SqlSession sqlSession;

	public List<CommentVo> getCmtList(int bno) {
		return sqlSession.selectList("comment.selectAllList", bno);
	}

	public int insertCmt(CommentVo vo) {
		return sqlSession.insert("comment.insertOne", vo);

	}

	public int updateCmt(CommentVo vo) {
		return sqlSession.update("comment.updateCmt", vo);
	}

	public int deleteCmt(int cno) {
		return sqlSession.delete("comment.deleteCmt", cno);
	}

}
