package org.baseball.kia.subin.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.baseball.kia.subin.entity.CalendarVo;
import org.baseball.kia.subin.entity.LineupVo;
import org.baseball.kia.subin.entity.ScheduleVo;
import org.baseball.kia.subin.entity.ScoreVo;
import org.baseball.kia.subin.repository.LineupDao;
import org.baseball.kia.subin.repository.ScheduleDao;
import org.baseball.kia.subin.repository.ScoreDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CalendarService {
	@Autowired
	ScheduleDao scheduleDao;

	@Autowired
	LineupDao lineupDao;
	
	@Autowired
	ScoreDao scoreDao;
	
	public Map<String, CalendarVo> selectScheduleByMonth(String gameMonth) { // 월별 경기일정 조회
		List<CalendarVo> li = scheduleDao.selectScheduleByMonth(gameMonth);
		Map<String, CalendarVo> map = new LinkedHashMap<>();
		for (CalendarVo vo : li) {
			map.put(vo.getGameDate(), vo);
		}
		return map;
	}
	
	public LineupVo selectLineup(int scheduleNo) { // 라인업 조회
		return lineupDao.selectOne(scheduleNo);
	}
	
	public ScoreVo selectScoreVo(int scheduleNo) { // 경기 결과 조회
		return scoreDao.selectScore(scheduleNo);
	}
	
	public ScheduleVo selectScheduleByNo(int scheduleNo) { // 경기번호로 경기일정 조회
		return scheduleDao.selectScheduleByNo(scheduleNo);
	}
}
