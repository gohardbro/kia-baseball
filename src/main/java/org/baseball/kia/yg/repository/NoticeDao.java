package org.baseball.kia.yg.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.yg.entity.NoticeVo;
import org.baseball.kia.yg.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDao {
	@Autowired
	SqlSession sqlSession;

	public int insertOne(NoticeVo vo) {
		return sqlSession.insert("notice.insertOne", vo);
	}
	
	public NoticeVo selectOne(int no) {
		return sqlSession.selectOne("notice.selectOne", no);
	}
	
	public List<NoticeVo> selectListByNo(int no) {
		return sqlSession.selectList("notice.selectOne", no);
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
	
	// ???
	public List<Map<String, Object>> selectBoardList(Criteria cri) {
		return sqlSession.selectList("notice.selectBoardList", cri);
	}
	
	public void boardDelete(int no) {
		sqlSession.delete("notice.noticeDelete", no);
	}
	
	public void update(NoticeVo vo) {
		sqlSession.update("notice.noticeUpdate", vo);
	}
}