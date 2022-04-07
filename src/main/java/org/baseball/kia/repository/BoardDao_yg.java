package org.baseball.kia.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.entity.BoardVo_yg;
import org.baseball.kia.util.Criteria_yg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao_yg {
	
	@Autowired
	SqlSession sqlSession;
	
	public int insertOne(BoardVo_yg vo) {
		return sqlSession.insert("board.insertOne", vo);
	}

	public List<BoardVo_yg> listPage(Criteria_yg cri) {
		return sqlSession.selectList("board.listPage",cri);
	}
	
	public int listCount() {
		return sqlSession.selectOne("board.listCount");
	}

	public BoardVo_yg selectOne(int no) {
		return sqlSession.selectOne("board.selectOne", no);
	}

	public List<BoardVo_yg> selectListByNo(int no) {
		return sqlSession.selectList("board.selectOne", no);
	}
	
	public void updateCntview(int no) {
		sqlSession.update("board.updateCnt", no);
	}
	
	public int deleteBoardByReportId(String id) { //차단된 계정 게시물 삭제
		return sqlSession.delete("board.deleteBoardByReportId", id);
	}

	public List<Map<String, Object>> selectBoardList(Criteria_yg cri) {
		return sqlSession.selectList("board.selectBoardList", cri);
	}
	
	public int countBoardList(){
	    return sqlSession.selectOne("board.countBoardList");
	}

	public void boardDelete(int no) {
		sqlSession.delete("board.boardDelete",no);
	}
	
	public void update(BoardVo_yg vo) {
		sqlSession.update("board.boardUpdate",vo);
	}

	
}
