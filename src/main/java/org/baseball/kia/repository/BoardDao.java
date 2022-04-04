package org.baseball.kia.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.entity.BoardVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public int insertOne(BoardVo vo) {
		return sqlSession.insert("board.insertOne", vo);
	}

	public List<BoardVo> selectAll() {
		return sqlSession.selectList("board.selectAll");
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
	
}
