package org.baseball.kia.subin.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.subin.entity.PlayerVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("playerDao_subin")
public class PlayerDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<PlayerVo> selectNameAutoComplete(String name){ // 선수 이름 자동완성
		return sqlSession.selectList("player.selectNameAutoComplete", name);
	}
}
