package org.baseball.kia.subin.service;

import java.util.List;

import org.baseball.kia.subin.entity.CalendarVo;
import org.baseball.kia.subin.entity.ScheduleVo;
import org.baseball.kia.subin.repository.ScheduleDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CalendarService {
	@Autowired
	ScheduleDao scheduleDao;

	public List<CalendarVo> selectScheduleByMonth(String gameMonth) { // 월별 경기일정 조회
		return scheduleDao.selectScheduleByMonth(gameMonth);
	}
}
