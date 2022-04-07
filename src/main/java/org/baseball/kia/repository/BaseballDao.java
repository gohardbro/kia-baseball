package org.baseball.kia.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.entity.BaseballChartVo;
import org.baseball.kia.entity.BaseballVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BaseballDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<BaseballVo> selectListById(BaseballVo baseballVo) {
		return sqlSession.selectList("baseball.selectAllById", baseballVo);
	}
	
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
	
	public int deleteOneByBaseballNo(int baseballNo){ 
		return sqlSession.delete("baseball.deleteOneByBaseballNo", baseballNo);
	}
}
