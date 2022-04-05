package org.baseball.kia.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.entity.UniformInfoVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UniformInfoDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<UniformInfoVo> selectUniformInfo(UniformInfoVo vo){ // 유니폼 정보 조회
		return sqlSession.selectList("uniformInfo.selectUniformInfo", vo);
	}
	
	public int updateUniformInfo(UniformInfoVo vo) { // 유니폼 정보 수정
		return sqlSession.update("uniformInfo.updateUniformInfo", vo);
	}
	
	public int insertUniformInfo(UniformInfoVo vo) { // 유니폼 정보 등록
		return sqlSession.insert("uniformInfo.insertUniformInfo", vo);
	}
}
