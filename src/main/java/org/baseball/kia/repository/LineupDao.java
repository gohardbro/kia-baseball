package org.baseball.kia.repository;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.entity.LineupVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LineupDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public int insertOne(LineupVo vo) { // 라인업 등록
		return sqlSession.insert("lineup.insertOne", vo);
	}
	
	public LineupVo selectOne(LineupVo vo) { // 라인업 조회
		return sqlSession.selectOne("lineup.selectOne", vo);
	}
	
	public int updateOne(LineupVo vo) { // 라인업 수정
		return sqlSession.update("lineup.updateOne", vo);
	}
}
