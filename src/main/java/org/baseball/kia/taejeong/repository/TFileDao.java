package org.baseball.kia.taejeong.repository;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.taejeong.entity.TFileVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TFileDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public int updateAccountTableProfile(TFileVo tFileVo) {
		return sqlSession.update("tFile.updateAccountTableProfile", tFileVo);
	}
	
	public int insertProfile(TFileVo tFileVo) {
		return sqlSession.insert("tFile.insertProfile", tFileVo);
	}
	
	public int deleteProfile(TFileVo tFileVo) {
		return sqlSession.delete("tFile.deleteProfile", tFileVo);
	}
}
