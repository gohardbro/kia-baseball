package org.baseball.kia.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UniformDao {

	@Autowired
	SqlSession sqlSession;

	public List<String> selectUniformTop5() { // 유니폼이름: 유니폼 top 5
		return sqlSession.selectList("uniform.selectUniformTop5");
	}

	public List<Integer> selectUniformCntTop5() { // 수량: 유니폼 top 5
		return sqlSession.selectList("uniform.selectUniformCntTop5");
	}

	public List<String> selectPlayerTop5() { // 선수이름: 선수 유니폼 top 5
		return sqlSession.selectList("uniform.selectPlayerTop5");
	}

	public List<Integer> selectPlayerCntTop5() { // 수량: 선수 유니폼 top 5
		return sqlSession.selectList("uniform.selectPlayerCntTop5");
	}

}
