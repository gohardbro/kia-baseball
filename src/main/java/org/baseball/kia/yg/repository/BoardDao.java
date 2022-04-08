package org.baseball.kia.yg.repository;

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
	
	public int insertOne(BoardVo vo) {
		return sqlSession.insert("board.insertOne", vo);
	}

	public List<BoardVo> listPage(Criteria cri) {
		return sqlSession.selectList("board.listPage",cri);
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
	
	public int deleteBoardByReportId(String id) { //차단된 계정 게시물 삭제
		return sqlSession.delete("board.deleteBoardByReportId", id);
	}

	public List<Map<String, Object>> selectBoardList(Criteria cri) {
		return sqlSession.selectList("board.selectBoardList", cri);
	}
	
	public int countBoardList(){
	    return sqlSession.selectOne("board.countBoardList");
	}

	public void boardDelete(int no) {
		sqlSession.delete("board.boardDelete",no);
	}
	
	public void update(BoardVo vo) {
		sqlSession.update("board.boardUpdate",vo);
	}

	
}
