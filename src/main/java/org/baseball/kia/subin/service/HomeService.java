package org.baseball.kia.subin.service;

import java.util.List;

import org.baseball.kia.subin.entity.BoardVo;
import org.baseball.kia.subin.entity.UniformInfoVo;
import org.baseball.kia.subin.repository.BoardDao;
import org.baseball.kia.subin.repository.UniformInfoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HomeService {

	@Autowired
	UniformInfoDao uniformInfoDao;
	
	@Autowired
	BoardDao boardDao;
	
	public List<UniformInfoVo> selectUniformInfoTop10(){ // 유니폼 top 10 조회
		List<UniformInfoVo> list = uniformInfoDao.selectUniformNameTop10();
		System.out.println(list.size());
		return uniformInfoDao.selectUniformNameTop10();
	}
	
	public List<BoardVo> selectBoardHot5(){ // 인기 게시물 Hot 5 조회
		return boardDao.selectBoardHot5();
	}
}
