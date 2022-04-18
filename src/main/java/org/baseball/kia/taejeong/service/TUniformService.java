package org.baseball.kia.taejeong.service;

import java.util.List;

import org.baseball.kia.taejeong.entity.TUniformVo;
import org.baseball.kia.taejeong.repository.TUniformDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TUniformService {
	
	@Autowired
	TUniformDao tUniformDao;
	
	public List<TUniformVo> getAllByBuyer(TUniformVo tUniformVo) {
		return tUniformDao.selectAllByBuyer(tUniformVo);
	}
	
	public int updateTotalNUniCnt(TUniformVo tUniformVo) {
		return tUniformDao.updateTotalNUniCntByUniformNo(tUniformVo);
	}
	
	public TUniformVo getInfoByUniformNo(TUniformVo tUniformVo) {
		return tUniformDao.selectInfoByUniformNo(tUniformVo);
	}
	
	public int updateBuyDateNState(int uniformNo) {
		return tUniformDao.updateBuyDateByUniformNo(uniformNo);
	}
	
	public int updateSizeCount(TUniformVo tUniformVo) {
		return tUniformDao.updateSizeCount(tUniformVo);
	}

}
