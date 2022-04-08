package org.baseball.kia.eunji.service;

import java.util.List;

import org.baseball.kia.eunji.entity.TicketVo;
import org.baseball.kia.eunji.repository.TicketDao;
import org.baseball.kia.taejeong.entity.BaseballVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TicketService {

	@Autowired
	TicketDao ticketDao;

	//zoneInfo

	public List<BaseballVo> seatPriceTable() { List<BaseballVo> list =
	  ticketDao.seatPriceTable(); return list; }

	// ticketBuy
	public List<TicketVo> showGameList() {
		List<TicketVo> list = ticketDao.showGameList();
		return list;
	}

	// ticketDetail
	public TicketVo selectGame(int no) {
		TicketVo vo = ticketDao.selectGame(no);
		return vo;
	}

}
