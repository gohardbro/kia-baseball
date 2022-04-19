package org.baseball.kia.eunji.service;

import org.baseball.kia.eunji.entity.BuyerInfoVo;

public interface PaymentCompleteService {
	
	//결제완료시 baseball Table에 insert
	public int paymentComplete(BuyerInfoVo vo);
	
	
	//결제 완료 후 결제 정보 출력
	public BuyerInfoVo showCompleteInfo(int no);
	

}

