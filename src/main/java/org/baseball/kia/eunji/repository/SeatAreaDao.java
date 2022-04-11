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
	
	

	//seatChoice
	public List<SeatChoiceVo> seatChoice() {
		return sqlSession.selectList("seatArea.seatInfo");
	}  

}
