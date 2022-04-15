package org.baseball.kia.subin.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.subin.entity.UniformInfoPage;
import org.baseball.kia.subin.entity.UniformInfoVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("unidoemInfoDao_subin")
public class UniformInfoDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<UniformInfoVo> selectUniformInfo(UniformInfoPage page){ // 유니폼 정보 조회
		return sqlSession.selectList("uniformInfo.selectUniformInfo", page);
	}
	
	public int selectUniformInfoCnt() { // 유니폼 검색 결과 개수
		return sqlSession.selectOne("uniformInfo.selectUniformInfoCnt");
	}
	
	public UniformInfoVo selectUniformInfoOne(int uniInfoNo) { // 유니폼 상세정보 조회
		return sqlSession.selectOne("uniformInfo.selectUniformInfoOne", uniInfoNo);
	}
	
	public int updateUniformInfo(UniformInfoVo vo) { // 유니폼 정보 수정
		return sqlSession.update("uniformInfo.updateUniformInfo", vo);
	}
	
	public int insertUniformInfo(UniformInfoVo vo) { // 유니폼 정보 등록
		return sqlSession.insert("uniformInfo.insertUniformInfo", vo);
	}
	
	public int updateUniformImg(UniformInfoVo vo) { // 유니폼 이미지 파일명 저장
		return sqlSession.update("uniformInfo.updateUniformImg", vo);
	}

	public int deleteUniformInfo(int uniInfoNo) { // 유니폼 정보 삭제
		return sqlSession.delete("uniformInfo.deleteUniformInfo", uniInfoNo);
	}

	public List<UniformInfoVo> selectUniformNameTop10() { // 인기 유니폼 top10 조회
		return sqlSession.selectList("uniformInfo.selectUniformTop10");
	}
}
