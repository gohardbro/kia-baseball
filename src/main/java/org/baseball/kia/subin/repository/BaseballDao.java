package org.baseball.kia.subin.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.subin.entity.BaseballChartVo;
import org.baseball.kia.subin.entity.BaseballVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("baseballDao_subin")
public class BaseballDao {
	
	@Autowired
	SqlSession sqlSession;
	
	/*
	 * public List<BaseballVo> selectBaseball(BaseballVo vo){ // 야구장 예매내역 조회 return
	 * sqlSession.selectList("baseball.selectBaseball", vo); }
	 */

	public List<Integer> selectBaseballCntChart(BaseballChartVo vo){ // 야구장 티켓 차트데이터 수량 불러오기
		return sqlSession.selectList("baseball.selectChartCntData", vo);
	}
	
	public List<String> selectBaseballDateChart(BaseballChartVo vo){ // 야구장 티켓 차트데이터 날짜 불러오기
		return sqlSession.selectList("baseball.selectChartDateData", vo);
	}
}
