package org.baseball.kia.eunji.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.eunji.entity.SeatChoiceVo;
import org.baseball.kia.eunji.entity.TicketVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SeatAreaDao {

	@Autowired
	SqlSession sqlSession;

	// 선택된 1경기
	public TicketVo selectGame(int no) {
		return sqlSession.selectOne("seatArea.selectGame", no);
	}

	// seat radio
	public List<SeatChoiceVo> seatChoice() {
		return sqlSession.selectList("seatArea.seatList");
	}

}
