package org.baseball.kia.taejeong.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.taejeong.entity.BaseballVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TBaseballDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<BaseballVo> selectListById(BaseballVo baseballVo) {
		return sqlSession.selectList("baseball.selectAllById", baseballVo);
	}
	
	public int updateCancelByBaseballNo(int baseballNo){ 
		return sqlSession.update("baseball.updateCancelByBaseballNo", baseballNo);
	}
}
