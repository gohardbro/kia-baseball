package org.baseball.kia.yg.service;

import org.baseball.kia.yg.entity.UniformInfoVo;
import org.baseball.kia.yg.entity.UniformVo;
import org.baseball.kia.yg.repository.UniformDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UniformService {
	
	@Autowired
	UniformDao uniformDao;
	
	public UniformVo getBasketList(UniformInfoVo infovo) {
		return uniformDao.getBasketList(infovo);
	}
	
	public boolean insertBasket(UniformVo vo) {
		int r = uniformDao.insertBasket(vo);
		return r == 1;
	}
	

}
