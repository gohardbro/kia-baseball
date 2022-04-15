package org.baseball.kia.yg.service;

import java.util.List;
import java.util.Map;

import org.baseball.kia.yg.entity.BoardVo;
import org.baseball.kia.yg.repository.BoardDao;
import org.baseball.kia.yg.util.Criteria;
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

	public List<BoardVo> getAll(Criteria cri) {
		List<BoardVo> list = boardDao.listPage(cri);
		return list;
	}
	
	public int listCount() {
		return boardDao.listCount();
	}

	public BoardVo getOneByNo(int no) {
		BoardVo vo = boardDao.selectOne(no);
		return vo;
	}

	public BoardVo updateCnt(int no) {
		boardDao.updateCntview(no);
		return boardDao.selectOne(no);
	}
	
	public List<Map<String,Object>> selectBoardList(Criteria cri) {
		return boardDao.selectBoardList(cri);
	}

	public void boardDelete(int no) {
		boardDao.boardDelete(no);
	}
	
	public Map<String,Integer> boardCmtDelete(int no) {
		return boardDao.boardCmtDelete(no);
	}
	
	public void update(BoardVo vo) {
		boardDao.update(vo);
	}
	
}
