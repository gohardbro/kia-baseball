package org.baseball.kia.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.entity.BaseballVo;
import org.baseball.kia.entity.TicketVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TicketDao {
	
	@Autowired
	SqlSession sqlSession;
	
	
	public List<BaseballVo> seatPriceTable() {
		return sqlSession.selectList("ticket.seatPriceTable");
	}
	
	public List<TicketVo> showGameList() {
		return sqlSession.selectList("ticket.showGameList");
	}
	
	public TicketVo selectGame(int no) {
		return sqlSession.selectOne("ticket.selectGame",no);
	}
	
	
}
