package org.baseball.kia.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.entity.BaseballVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BaseballDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<BaseballVo> selectListById(BaseballVo baseballVo) {
		return sqlSession.selectList("baseball.selectAllById", baseballVo);
	}
}
