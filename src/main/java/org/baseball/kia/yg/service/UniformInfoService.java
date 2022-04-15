package org.baseball.kia.yg.service;

import java.util.List;

import org.baseball.kia.yg.entity.UniformInfoVo;
import org.baseball.kia.yg.repository.UniformInfoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UniformInfoService {
	@Autowired
	UniformInfoDao uniInfoDao;
	
	public List<UniformInfoVo> goodsList(UniformInfoVo vo) {
		return uniInfoDao.goodsList(vo);
	}
	
	public UniformInfoVo goodsInfo(int no) {
		UniformInfoVo vo = uniInfoDao.goodsInfo(no);
		return vo;
	}
}
