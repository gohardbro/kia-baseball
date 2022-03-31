package org.baseball.kia.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao {
	@Autowired
	SqlSession sqlSession;
	
	public int deleteBoardByReportId(String id) { //차단된 계정 게시물 삭제
		return sqlSession.delete("board.deleteBoardByReportId", id);
	}
}
