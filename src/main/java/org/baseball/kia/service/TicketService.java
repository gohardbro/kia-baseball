package org.baseball.kia.service;

import java.util.List;

import org.baseball.kia.entity.TicketVo;
import org.baseball.kia.repository.TicketDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class TicketService {
	
	@Autowired
	TicketDao ticketDao; 
	
	
	public List<TicketVo> gamelistAbleRev(){
		List<TicketVo> list = ticketDao.gamelistAbleRev();
		return list; 
	}
 
	
	
	
}
