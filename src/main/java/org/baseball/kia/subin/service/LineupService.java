package org.baseball.kia.subin.service;

import java.util.List;

import org.baseball.kia.subin.entity.LineupVo;
import org.baseball.kia.subin.entity.PlayerVo;
import org.baseball.kia.subin.entity.ScheduleVo;
import org.baseball.kia.subin.repository.LineupDao;
import org.baseball.kia.subin.repository.PlayerDao;
import org.baseball.kia.subin.repository.ScheduleDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("lineupService_subin")
public class LineupService {
	
	@Autowired
	LineupDao lineupDao;
	
	@Autowired
	ScheduleDao scheduleDao;
	
	@Autowired
	PlayerDao playerDao;
	
	public boolean insertLineup(LineupVo vo) { // 라인업 등록
		return lineupDao.insertOne(vo) == 1;
	}

	public LineupVo selectLineup(LineupVo vo) { // 라인업 조회
		return lineupDao.selectOne(vo);
	}

	public boolean updateLineup(LineupVo vo) { // 라인업 수정
		return lineupDao.updateOne(vo) == 1;
	}

	public List<ScheduleVo> selectSchedule() { // 라인업을 등록할 경기일자 조회
		return scheduleDao.selectDateAndTime();
	}
	
	public List<PlayerVo> selectNameAutoComplete(String name){ // 라인업 작성 시 선수이름 자동완성
		return playerDao.selectNameAutoComplete(name);
	}

}
