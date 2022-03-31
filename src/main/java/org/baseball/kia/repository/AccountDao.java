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
	
	public List<AccountVo> selectByType(String type){ // 타입별 회원계정 조회
		return sqlSession.selectList("account.selectByType", type);
	}
	
	public int updateReportById(String id) { // 신고계정 차단 설정
		return sqlSession.update("account.updateReportById", id);
	}
}
