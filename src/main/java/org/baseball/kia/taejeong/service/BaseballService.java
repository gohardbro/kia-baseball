package org.baseball.kia.taejeong.service;

import java.util.List;

import org.baseball.kia.taejeong.entity.BaseballVo;
import org.baseball.kia.taejeong.repository.TBaseballDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BaseballService {
	
	@Autowired
	TBaseballDao baseballDao;
	
	public List<BaseballVo> getAllById(BaseballVo baseballVo) {
		return baseballDao.selectListById(baseballVo);
	}
	
	public boolean cancelOneTicket(int baseballNo) {
		
		int r = baseballDao.updateCancelByBaseballNo(baseballNo);
		if(r==1)
			return true;
		else
			return false;
	}
	

}
