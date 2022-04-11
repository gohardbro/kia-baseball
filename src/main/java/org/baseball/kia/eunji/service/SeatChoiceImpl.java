package org.baseball.kia.eunji.service;

import java.util.List;

import org.baseball.kia.eunji.entity.SeatChoiceVo;
import org.baseball.kia.eunji.repository.seatAreaDao;

public class SeatChoiceImpl implements SeatChoice{

	@Override
	public List<SeatChoiceVo> seatChoice() {
		List<SeatChoiceVo> list = seatAreaDao.seatChoice();
		return list;
	}

}
