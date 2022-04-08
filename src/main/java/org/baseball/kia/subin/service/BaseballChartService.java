package org.baseball.kia.subin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.baseball.kia.subin.entity.BaseballChartVo;
import org.baseball.kia.subin.repository.BaseballDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("baseballChartService_subin")
public class BaseballChartService {
	
	@Autowired
	BaseballDao baseballDao;
	
	public Map<String, Object> selectBaseballChartData(BaseballChartVo vo) { // 야구장 티켓 차트 데이터 조회
		List<Integer> cnt = baseballDao.selectBaseballCntChart(vo);
		List<String> date = baseballDao.selectBaseballDateChart(vo);

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("cnt", cnt);
		data.put("date", date);
		return data;
	}
}
