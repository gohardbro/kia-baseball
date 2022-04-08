package org.baseball.kia.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.entity.BaseballVo;
import org.baseball.kia.eunji.entity.TicketVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TicketDao {
	
	@Autowired
	SqlSession sqlSession;
	
	//zoneInfo
	public List<BaseballVo> seatPriceTable() {
		return sqlSession.selectList("ticket.seatPriceTable");
	}
	
	//ticketBuy
	public List<TicketVo> showGameList() {
		return sqlSession.selectList("ticket.showGameList");
	}
	
	//ticketDetail
	public TicketVo selectGame(int no) {
		return sqlSession.selectOne("ticket.selectGame",no);
	}
	
	
}
