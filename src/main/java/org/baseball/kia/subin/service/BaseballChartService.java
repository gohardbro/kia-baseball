package org.baseball.kia.subin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.baseball.kia.subin.entity.BaseballChartVo;
import org.baseball.kia.subin.repository.BaseballDao;
import org.baseball.kia.subin.repository.BaseballInfoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("baseballChartService_subin")
public class BaseballChartService {

	@Autowired
	BaseballDao baseballDao;

	@Autowired
	BaseballInfoDao baseballInfoDao;

	public Map<String, Object> selectBaseballChartData(BaseballChartVo vo) { // 야구장 티켓 차트 데이터 조회
		List<Integer> cnt = baseballDao.selectBaseballCntChart(vo);
		List<String> date = baseballDao.selectBaseballDateChart(vo);
		List<Double> percent = new ArrayList<Double>();
		
		int limit;
		if (vo.getZone().equals("all")) { // 전체 좌석 수 조회
			limit = baseballInfoDao.selectLimit();

		} else { // 구역별 좌석 수 조회
			limit = baseballInfoDao.selectLimitByZone(vo.getZone());
		}

		for (int idx = 0; idx < cnt.size(); idx++) {
			percent.add(idx, (double)cnt.get(idx) / limit * 100);
		}

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("cnt", cnt);
		data.put("date", date);
		data.put("percent", percent);
		return data;
	}
}
