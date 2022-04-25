package org.baseball.kia.subin.repository;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.subin.entity.ScoreVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ScoreDao {

	@Autowired
	SqlSession sqlSession;
	
	public int insertScore(ScoreVo vo) { // 경기 결과 입력
		return sqlSession.insert("score.insertScore", vo);
	}
	
	public ScoreVo selectScore(int scheduleNo) { // 경기 결과 조회
		return sqlSession.selectOne("score.selectScore", scheduleNo);
	}
}
