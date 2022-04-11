package org.baseball.kia.taejeong.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.taejeong.entity.InquiryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InquiryDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public int insertOneById(InquiryVo vo) {
		return sqlSession.insert("inquiry.insertOneById", vo);
	}
	
	public List<InquiryVo> selectListByWriter(InquiryVo vo){
		return sqlSession.selectList("inquiry.selectListByWriter", vo);
	}
}
