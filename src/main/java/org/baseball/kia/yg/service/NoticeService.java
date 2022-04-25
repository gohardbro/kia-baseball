package org.baseball.kia.yg.service;

import java.util.List;
import java.util.Map;

import org.baseball.kia.yg.entity.NoticeVo;
import org.baseball.kia.yg.repository.NoticeDao;
import org.baseball.kia.yg.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeService {

	@Autowired
	NoticeDao noticeDao;

	public boolean addNewOne(NoticeVo vo) {
		int r = noticeDao.insertOne(vo);
		return r == 1;
	}

	public List<NoticeVo> getAll(Criteria cri) {
		List<NoticeVo> list = noticeDao.listPage(cri);
		return list;
	}

	public int listCount() {
		return noticeDao.listCount();
	}

	public NoticeVo getOneByNo(int no) {
		NoticeVo vo = noticeDao.selectOne(no);
		return vo;
	}

	public NoticeVo updateCnt(int no) {
		noticeDao.updateCntview(no);
		return noticeDao.selectOne(no);
	}

	public List<Map<String, Object>> selectBoardList(Criteria cri) {
		return noticeDao.selectBoardList(cri);
	}

	public void boardDelete(int no) {
		noticeDao.boardDelete(no);
	}

	public void update(NoticeVo vo) {
		noticeDao.update(vo);
	}
}
