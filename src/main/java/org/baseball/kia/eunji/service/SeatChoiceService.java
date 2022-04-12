package org.baseball.kia.eunji.service;

import java.util.List;

import org.baseball.kia.eunji.entity.SeatChoiceVo;
import org.baseball.kia.eunji.entity.TicketVo;


public interface SeatChoiceService {
	
	// 선택된 1경기 
	public TicketVo selectGame(int no);  

	
	//zone 6개중 선택하는 radio 
	public List<SeatChoiceVo> seatChoice();

	
	
}
