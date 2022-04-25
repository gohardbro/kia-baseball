package org.baseball.kia.subin.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.subin.entity.BoardVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("boardDao_subin")
public class BoardDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public int deleteBoardByReportId(String id) { // 차단된 계정 게시물 삭제
		return sqlSession.delete("board.deleteBoardByReportId", id);
	}
	
	public List<BoardVo> selectBoardHot5(){
		return sqlSession.selectList("board.selectBoardHot5");
	}
}
