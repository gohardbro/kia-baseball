package org.baseball.kia.eunji.service;

import java.util.List;

import org.baseball.kia.eunji.entity.SeatChoiceVo;

public interface SeatChoice {
	
	//zone 6개중 선택하는 radio 
	public List<SeatChoiceVo> seatChoice();

}
