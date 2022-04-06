package org.baseball.kia.service;

import java.util.List;

import org.baseball.kia.entity.BaseballVo;
import org.baseball.kia.repository.BaseballDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BaseballService {
	
	@Autowired
	BaseballDao baseballDao;
	
	public List<BaseballVo> getAllById(BaseballVo baseballVo) {
		return baseballDao.selectListById(baseballVo);
	}

}
