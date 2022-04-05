package org.baseball.kia.service;

import java.util.List;

import org.baseball.kia.entity.BoardVo;
import org.baseball.kia.repository.BoardDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
	@Autowired
	BoardDao boardDao;

	public boolean addNewOne(BoardVo vo) {
		int r = boardDao.insertOne(vo);
		return r == 1;
	}

	public List<BoardVo> getAll() {
		List<BoardVo> list = boardDao.selectAll();
		return list;
	}

	public BoardVo getOneByNo(int no) {
		BoardVo vo = boardDao.selectOne(no);
		return vo;
	}

	public BoardVo updateCnt(int no) {
		boardDao.updateCntview(no);
		return boardDao.selectOne(no);
	}
	

}
