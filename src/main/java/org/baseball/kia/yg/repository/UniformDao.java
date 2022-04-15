package org.baseball.kia.yg.repository;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.yg.entity.UniformVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UniformDao {

	@Autowired
	SqlSession sqlSession;
	
	public UniformVo getBasketList(UniformVo vo) {
		return sqlSession.selectOne("uniform.selectOne",vo);
	}
}
