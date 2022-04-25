package org.baseball.kia.taejeong.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.taejeong.entity.TUniformVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TUniformDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<TUniformVo> selectAllByBuyer(TUniformVo tUniformVo) {
		return sqlSession.selectList("tUniform.selectAllByBuyer", tUniformVo);
	}
	
	public int updateTotalNUniCntByUniformNo(TUniformVo tUniformVo) {
		return sqlSession.update("tUniform.updateTotalNUniCntByUniformNo", tUniformVo);
	}
	
	public TUniformVo selectInfoByUniformNo(TUniformVo tUniformVo) {
		return sqlSession.selectOne("tUniform.selectInfoByUniformNo", tUniformVo);
	}
	
	public int updateBuyDateByUniformNo(int uniformNo) {
		return sqlSession.update("tUniform.updateBuyDateByUniformNo", uniformNo);
	}
	
	public int updateSizeCount(TUniformVo tUniformVo) {
		return sqlSession.update("tUniform.updateSizeCount", tUniformVo);
	}
}
