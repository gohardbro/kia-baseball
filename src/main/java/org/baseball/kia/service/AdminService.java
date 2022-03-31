package org.baseball.kia.service;

import java.util.List;

import org.baseball.kia.entity.AccountVo;
import org.baseball.kia.entity.LineupVo;
import org.baseball.kia.entity.ScheduleVo;
import org.baseball.kia.entity.UniformInfoVo;
import org.baseball.kia.repository.AccountDao;
import org.baseball.kia.repository.BoardDao;
import org.baseball.kia.repository.LineupDao;
import org.baseball.kia.repository.ScheduleDao;
import org.baseball.kia.repository.UniformInfoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {
	
	@Autowired
	LineupDao lineupDao;
	
	@Autowired
	ScheduleDao scheduleDao;
	
	@Autowired
	AccountDao accountDao;
	
	@Autowired
	BoardDao boardDao;
	
	@Autowired
	UniformInfoDao uniformInfoDao;
	
	public boolean insertLineup(LineupVo vo) { // 라인업 등록
		return lineupDao.insertOne(vo) == 1;
	}
	
	public LineupVo selectLineup(LineupVo vo) { // 라인업 조회
		return lineupDao.selectOne(vo);
	}
	
	public boolean updateLineup(LineupVo vo) { // 라인업 수정
		return lineupDao.updateOne(vo) == 1;
	}
	
	public List<ScheduleVo> selectSchedule(){ // 라인업을 등록할 경기일자 조회
		return scheduleDao.selectDateAndTime();
	}
	
	public List<AccountVo> selectAccountByType(String type){ // 타입별 회원계정 조회
		return accountDao.selectByType(type);
	}
	
	public boolean reportAccount(String id) { // 신고계정 차단 설정 + 기존 게시물 삭제
		if (boardDao.deleteBoardByReportId(id) == 1) {
			return false;
		}
		return accountDao.updateReportById(id) == 1;
	}
	
	public List<UniformInfoVo> selectUniformInfo(UniformInfoVo vo){ // 유니폼 정보 조회
		return uniformInfoDao.selectUniformInfo(vo);
	}
	
	public boolean updateUniformInfo(UniformInfoVo vo) { // 유니폼 정보 수정
		return uniformInfoDao.updateUniformInfo(vo) == 1;
	}

	public boolean insertUniformInfo(UniformInfoVo vo) { // 유니폼 정보 등록
		return uniformInfoDao.insertUniformInfo(vo) == 1;
	}
}
