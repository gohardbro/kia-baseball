package org.baseball.kia.yg.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.yg.entity.BoardVo;
import org.baseball.kia.yg.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao {

	@Autowired
	SqlSession sqlSession;

	@Autowired
	CommentDao commentDao;

	public int insertOne(BoardVo vo) {
		return sqlSession.insert("board.insertOne", vo);
	}

	public List<BoardVo> listPage(Criteria cri) {
		return sqlSession.selectList("board.listPage", cri);
	}

	public int listCount() {
		return sqlSession.selectOne("board.listCount");
	}

	public BoardVo selectOne(int no) {
		return sqlSession.selectOne("board.selectOne", no);
	}

	public List<BoardVo> selectListByNo(int no) {
		return sqlSession.selectList("board.selectOne", no);
	}

	public void updateCntview(int no) {
		sqlSession.update("board.updateCnt", no);
	}

	public List<Map<String, Object>> selectBoardList(Criteria cri) {
		return sqlSession.selectList("board.selectBoardList", cri);
	}

	public void boardDelete(int no) {
		sqlSession.delete("board.boardDelete", no);
	}

	public Map<String, Integer> boardCmtDelete(int no) {
		int bdel = 0;
		int cdel = 0;
		bdel = sqlSession.delete("board.boardDelete", no);
		if (bdel > 0) {
			cdel = sqlSession.delete("comment.deleteBoardCmt", no);
		}
		Map<String, Integer> deleteMap = new HashMap<String, Integer>();
		deleteMap.put("bdel", bdel);
		deleteMap.put("cdel", cdel);
		return deleteMap;
	}
	
	public void update(BoardVo vo) {
		sqlSession.update("board.boardUpdate", vo);
	}

	
}
