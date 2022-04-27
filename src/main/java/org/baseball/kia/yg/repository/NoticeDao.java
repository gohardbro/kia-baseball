package org.baseball.kia.yg.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.yg.entity.NoticeVo;
import org.baseball.kia.yg.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDao {
	@Autowired
	SqlSession sqlSession;

	public NoticeVo selectOne(int no) {
		return sqlSession.selectOne("notice.selectOne", no);
	}
	
	public void updateCntview(int no) {
		sqlSession.update("notice.updateCnt", no);
	}
	
	public List<NoticeVo> listPage(Criteria cri) {
		return sqlSession.selectList("notice.listPage", cri);
	}
	
	public int listCount() {
		return sqlSession.selectOne("notice.listCount");
	}
	
}