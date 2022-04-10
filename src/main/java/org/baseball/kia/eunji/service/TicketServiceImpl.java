package org.baseball.kia.eunji.service;

import java.util.List;

import org.baseball.kia.eunji.entity.TicketVo;
import org.baseball.kia.eunji.repository.TicketDao;
import org.baseball.kia.taejeong.entity.BaseballVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TicketServiceImpl implements TicketService{

	
	@Autowired
	TicketDao ticketDao;

	
	
	@Override
	public List<BaseballVo> seatPriceTable() {
		List<BaseballVo> list = ticketDao.seatPriceTable(); 
		return list; 
	}

	@Override
	public List<TicketVo> showGameList() {
		List<TicketVo> list = ticketDao.showGameList();
		return list;
	}

	@Override
	public TicketVo selectGame(int no) {
		TicketVo vo = ticketDao.selectGame(no);
		return vo;
	}
	 

}
