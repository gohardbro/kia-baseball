package org.baseball.kia.eunji.service;

import java.util.List;

import org.baseball.kia.eunji.entity.TicketVo;
import org.baseball.kia.eunji.repository.TicketDao;
import org.baseball.kia.taejeong.entity.BaseballVo;
import org.springframework.beans.factory.annotation.Autowired;

public interface TicketService {
	

		//zoneInfo
		public List<BaseballVo> seatPriceTable();  
		
		// ticketBuy
		public List<TicketVo> showGameList();  
		
		
}
