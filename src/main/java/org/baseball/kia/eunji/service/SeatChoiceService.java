package org.baseball.kia.eunji.service;

import java.util.List;

import org.baseball.kia.eunji.entity.SeatChoiceVo;
import org.baseball.kia.eunji.entity.TicketVo;


public interface SeatChoiceService {
	
	// 선택된 1경기 
	public TicketVo selectGame(int no);  

	
	//zone radio 6개 
	public List<SeatChoiceVo> seatChoice();

	//weekend + 선택한 area
	public SeatChoiceVo weekPrice(String baseballZone);
	
	 
}
