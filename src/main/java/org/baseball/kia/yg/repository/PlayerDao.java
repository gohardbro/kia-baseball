package org.baseball.kia.yg.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.yg.entity.PlayerVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PlayerDao {

	@Autowired
	SqlSession sqlSession;
	
	public List<PlayerVo> getPlayerNo() {
		return sqlSession.selectList("player.selectPlayerNo");
	}
	
	public String getPlayerNoOne(String a) {
		return sqlSession.selectOne("player.selectOne", a);
	}

}
