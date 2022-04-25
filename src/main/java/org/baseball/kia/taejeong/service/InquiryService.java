package org.baseball.kia.taejeong.service;

import java.util.List;

import org.baseball.kia.taejeong.entity.InquiryVo;
import org.baseball.kia.taejeong.repository.InquiryDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InquiryService {
	
	@Autowired
	InquiryDao inquiryDao;
	
	public int writeInquiry(InquiryVo vo) {
		return inquiryDao.insertOneById(vo);
	}
	
	public List<InquiryVo> getHistory(InquiryVo vo){
		return inquiryDao.selectListByWriter(vo);
	}
}
