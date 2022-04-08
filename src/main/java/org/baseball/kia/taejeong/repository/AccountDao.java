package org.baseball.kia.taejeong.repository;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.taejeong.entity.AccountVo;
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
	
	
	public int updateSessionIdById(AccountVo vo) {
		return sqlSession.update("account.updateSessionIdById", vo);
	}
	
	public AccountVo selectOneBySessionId(String sessionId) {
		return sqlSession.selectOne("account.selectOneBySessionId", sessionId);
	}
	

	
	
}
