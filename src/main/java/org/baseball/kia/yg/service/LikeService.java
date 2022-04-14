package org.baseball.kia.yg.service;

import org.baseball.kia.yg.entity.LikeVo;
import org.baseball.kia.yg.repository.LikeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LikeService {
	@Autowired
	LikeDao likeDao;
	
	public int likeBoardCount(LikeVo vo) {
		return likeDao.likeBoardCount(vo);
	}
	
	public int likeViewCount(LikeVo vo) {
		return likeDao.likeViewCount(vo);
	}
	
	public void likeinsert(LikeVo vo) {
		likeDao.likeinsert(vo);
	}
	
	public void updateLike(LikeVo vo) {
		likeDao.updateLike(vo);
	}
}
