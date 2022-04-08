package org.baseball.kia.subin.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UniformDao {

	@Autowired
	SqlSession sqlSession;

	public List<String> selectUniformByPopularity() { // 유니폼이름: 유니폼 top 5
		return sqlSession.selectList("uniform.selectUniformByPopularity");
	}

	public List<Integer> selectUniformCntByPopularity() { // 수량: 유니폼 top 5
		return sqlSession.selectList("uniform.selectUniformCntByPopularity");
	}

	public List<String> selectPlayerByPopularity() { // 선수이름: 선수 유니폼 top 5
		return sqlSession.selectList("uniform.selectPlayerByPopularity");
	}

	public List<Integer> selectPlayerCntByPopularity() { // 수량: 선수 유니폼 top 5
		return sqlSession.selectList("uniform.selectPlayerCntByPopularity");
	}

}
