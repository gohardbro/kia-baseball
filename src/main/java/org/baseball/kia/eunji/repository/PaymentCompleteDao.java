package org.baseball.kia.eunji.repository;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.eunji.entity.BuyerInfoVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class PaymentCompleteDao {

	@Autowired
	SqlSession sqlSession;
	
	public int paymentComplete(BuyerInfoVo vo) {
		return sqlSession.insert("ticketPayment.paymentComplete", vo );
	}
	
	public BuyerInfoVo showCompleteInfo(int no) {
		return sqlSession.selectOne("ticketPayment.showCompleteInfo", no);
	}
	
	
}
