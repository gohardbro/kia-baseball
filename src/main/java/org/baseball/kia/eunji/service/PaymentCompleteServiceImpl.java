package org.baseball.kia.eunji.service;

import org.baseball.kia.eunji.entity.BuyerInfoVo;
import org.baseball.kia.eunji.repository.PaymentCompleteDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentCompleteServiceImpl implements PaymentCompleteService {

	@Autowired
	PaymentCompleteDao paymentCompleteDao;
	
	//결제완료시 baseball Table에 insert
	@Override
	public int paymentComplete(BuyerInfoVo vo) {
		
		int payRecordInsert = paymentCompleteDao.paymentComplete(vo);
		System.out.println(payRecordInsert);
		
		return payRecordInsert;
	}

	//결제 완료 후 결제 정보 출력
	@Override
	public BuyerInfoVo showCompleteInfo(int no) {
		
		 return paymentCompleteDao.showCompleteInfo(no);
		 
	}
	

	 
}
