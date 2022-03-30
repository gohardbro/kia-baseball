package org.baseball.kia.service;

import java.util.List;

import org.baseball.kia.entity.LineupVo;
import org.baseball.kia.entity.ScheduleVo;
import org.baseball.kia.repository.LineupDao;
import org.baseball.kia.repository.ScheduleDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {
	
	@Autowired
	LineupDao lineupDao;
	
	@Autowired
	ScheduleDao scheduleDao;
	
	public boolean insertLineup(LineupVo vo) { // 라인업 등록
		return lineupDao.insertOne(vo) == 1;
	}
	
	public LineupVo selectLineup(LineupVo vo) { // 라인업 조회
		return lineupDao.selectOne(vo);
	}
	
	public boolean updateLine(LineupVo vo) { // 라인업 수정
		return lineupDao.updateOne(vo) == 1;
	}
	
	public List<ScheduleVo> selectSchedule(){ // 라인업을 등록할 경기일자 조회
		return scheduleDao.selectDateAndTime();
	}
}
