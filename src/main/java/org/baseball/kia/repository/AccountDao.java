package org.baseball.kia.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.entity.AccountVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDao {
	
	@Autowired
	SqlSession sqlSession;

	public int insertOne(AccountVo vo) {
		return sqlSession.insert("account.insertOne", vo);
	}
	
	public String selectPassById(String id) {
		return sqlSession.selectOne("account.selectPassById", id);
	}
	
	public AccountVo selectOneById(String id) {
		return sqlSession.selectOne("account.selectOneById", id);
	}
	
	public int selectCntByNickName(String nickName) {
		return sqlSession.selectOne("account.selectCntByNickName", nickName);
	}

	public int updateOne(AccountVo vo) {
		return sqlSession.update("account.updateOne", vo);
	}
	
	public List<AccountVo> selectByType(String type){ // 타입별 회원계정 조회
		return sqlSession.selectList("account.selectByType", type);
	}
	
	public int updateReportById(String id) { // 신고계정 차단 설정
		return sqlSession.update("account.updateReportById", id);
	}
	
	
}
