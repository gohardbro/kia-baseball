package org.baseball.kia.service;

import java.util.List;

import org.baseball.kia.entity.BaseballVo;
import org.baseball.kia.entity.TicketVo;
import org.baseball.kia.repository.TicketDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class TicketService {
	
	@Autowired
	TicketDao ticketDao; 
	
	//zoneInfo
	public List<BaseballVo> seatPriceTable() {
		List<BaseballVo> list = ticketDao.seatPriceTable();
		return list;
	}
	
	//ticketBuy
	public List<TicketVo> showGameList(){
		List<TicketVo> list = ticketDao.showGameList();
		return list; 
	}
	
	//ticketDetail
	public TicketVo selectOne(int no){
		TicketVo vo = ticketDao.selectOne(no);
		return vo ;
	}
 
	
	
	
}
