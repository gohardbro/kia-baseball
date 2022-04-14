package org.baseball.kia.yg.repository;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.yg.entity.LikeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikeDao {
	@Autowired
	SqlSession sqlSession;
	
	public int likeBoardCount(LikeVo vo) {
		return sqlSession.selectOne("likes.likeBoardCount", vo);
	}
	
	public int likeViewCount(LikeVo vo)  {
		return sqlSession.selectOne("likes.likeViewCount", vo);
	}
	
	public void likeinsert(LikeVo vo) {
		sqlSession.insert("likes.likeInsert", vo);
	}
	
	public void updateLike(LikeVo vo) {
		sqlSession.update("likes.updateLike", vo);
	}	
	
}
