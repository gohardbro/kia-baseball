package org.baseball.kia.subin.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BaseballInfoDao {
	@Autowired
	SqlSession sqlSession;
	
	public int selectLimitByZone(String baseballZone){ // 구역별 좌석 수
		return sqlSession.selectOne("baseballInfo.selectLimitByZone", baseballZone);
	}
	
	public int selectLimit() { // 전체 좌석 수
		return sqlSession.selectOne("baseballInfo.selectLimit");
	}
}
