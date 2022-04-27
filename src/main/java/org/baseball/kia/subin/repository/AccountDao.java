package org.baseball.kia.subin.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.subin.entity.AccountPage;
import org.baseball.kia.subin.entity.AccountVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("accountDao_subin")
public class AccountDao {
	
	@Autowired
	SqlSession sqlSession;

	public List<AccountVo> selectByType(AccountPage page){ // 타입별 회원계정 조회
		return sqlSession.selectList("account.selectByType", page);
	}
	
	public int updateReportById(String id) { // 신고계정 차단 설정
		return sqlSession.update("account.updateReportById", id);
	}
	
	public int selectAccountCnt(String type) { // 회원수 조회
		return sqlSession.selectOne("account.selectAccountCnt", type);
	}

	public int updateNoReportById(String id) { // 신고계정 차단 취소 설정
		return sqlSession.update("account.updateNoReportById", id);
	}
	
	
}
