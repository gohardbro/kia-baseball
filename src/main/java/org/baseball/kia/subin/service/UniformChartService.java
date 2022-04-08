package org.baseball.kia.subin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.baseball.kia.subin.repository.UniformDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

@Service("uniformChartService_subin")
public class UniformChartService {

	@Autowired
	UniformDao uniformDao;
	
	public Map<String, Object> selectUniformByPopularity(){ // 유니폼 top 5
		List<String> uniform = uniformDao.selectUniformByPopularity();
		List<Integer> uniformCnt = uniformDao.selectUniformCntByPopularity();
		
		Gson gson = new Gson();
		Map<String, Object> uniformList = new HashMap<String, Object>();
		uniformList.put("uniformJson", gson.toJson(uniform));
		uniformList.put("uniformCntJson", gson.toJson(uniformCnt));
		uniformList.put("uniform", uniform);
		uniformList.put("uniformCnt", uniformCnt);
		return uniformList;
	}

	public Map<String, Object> selectPlayerByPopularity(){ // 선수 유니폼 top 5
		List<String> player = uniformDao.selectPlayerByPopularity();
		List<Integer> uniformCnt = uniformDao.selectPlayerCntByPopularity(); 

		Gson gson = new Gson();
		Map<String, Object> playerList = new HashMap<String, Object>();
		playerList.put("playerJson", gson.toJson(player));
		playerList.put("uniformCntJson",  gson.toJson(uniformCnt));
		playerList.put("player", player);
		playerList.put("uniformCnt",  uniformCnt);
		return playerList;
	}
}
