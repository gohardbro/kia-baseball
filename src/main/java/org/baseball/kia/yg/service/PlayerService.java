package org.baseball.kia.yg.service;

import java.util.List;

import org.baseball.kia.yg.entity.PlayerVo;
import org.baseball.kia.yg.repository.PlayerDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PlayerService {
	
	@Autowired
	PlayerDao playerDao;

	public List<PlayerVo> getPlayerNo() {
		List<PlayerVo> list = playerDao.getPlayerNo();
		return list;
	}

}
