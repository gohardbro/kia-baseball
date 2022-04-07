package org.baseball.kia.service;

import java.util.List;
import java.util.Map;

import org.baseball.kia.entity.BoardVo_yg;
import org.baseball.kia.repository.BoardDao_yg;
import org.baseball.kia.util.Criteria_yg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService_yg {
	@Autowired
	BoardDao_yg boardDao;

	public boolean addNewOne(BoardVo_yg vo) {
		int r = boardDao.insertOne(vo);
		return r == 1;
	}

	public List<BoardVo_yg> getAll(Criteria_yg cri) {
		List<BoardVo_yg> list = boardDao.listPage(cri);
		return list;
	}
	
	public int listCount() {
		return boardDao.listCount();
	}

	public BoardVo_yg getOneByNo(int no) {
		BoardVo_yg vo = boardDao.selectOne(no);
		return vo;
	}

	public BoardVo_yg updateCnt(int no) {
		boardDao.updateCntview(no);
		return boardDao.selectOne(no);
	}
	
	public List<Map<String,Object>> selectBoardList(Criteria_yg cri) {
		return boardDao.selectBoardList(cri);
	}
	
	public int countBoardListTotal() {
	    return boardDao.countBoardList();
	}

	public void boardDelete(int no) {
		boardDao.boardDelete(no);
	}
	
	public void update(BoardVo_yg vo) {
		boardDao.update(vo);
	}

	public void addComment(BoardVo_yg boardVo) {
		
	}

}
