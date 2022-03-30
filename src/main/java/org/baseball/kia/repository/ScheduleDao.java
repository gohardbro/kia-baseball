package org.baseball.kia.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.entity.ScheduleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ScheduleDao {

	@Autowired
	SqlSession sqlSession;
	
	public List<ScheduleVo> selectDateAndTime() { // 라인업 등록에서 조회할 경기 일정
		return sqlSession.selectList("schedule.selectDateAndTime");
	}
}
