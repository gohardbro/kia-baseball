package org.baseball.kia.eunji.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.eunji.entity.SeatChoiceVo;
import org.springframework.beans.factory.annotation.Autowired;

public class seatAreaDao {
	
	@Autowired
	SqlSession sqlSession;

	//seatChoice
	public List<SeatChoiceVo> seatChoice() {
		return sqlSession.selectList("seatArea.seatInfo");
	}  

}
