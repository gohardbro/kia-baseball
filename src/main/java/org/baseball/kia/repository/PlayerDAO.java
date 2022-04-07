package org.baseball.kia.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.entity.PlayerVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PlayerDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<PlayerVo> selectNameAutoComplete(String name){ // 선수 이름 자동완성
		return sqlSession.selectList("player.selectNameAutoComplete", name);
	}
}
