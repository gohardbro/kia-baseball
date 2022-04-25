package org.baseball.kia.yg.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.yg.entity.UniformInfoVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UniformInfoDao {
	@Autowired
	SqlSession sqlSession;
	
	public List<UniformInfoVo> goodsList(UniformInfoVo vo) {
		return sqlSession.selectList("uniformInfo.selectAll", vo);
	}
	
	public UniformInfoVo goodsInfo(int no) {
		return sqlSession.selectOne("uniformInfo.selectOne", no);
	}

	public int getUniInfoNo(int no) {
		return sqlSession.selectOne("uniformInfo.selectOne", no);
	}
	
	
}
