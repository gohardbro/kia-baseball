package org.baseball.kia.yg.service;

import java.util.List;

import org.baseball.kia.yg.entity.NoticeVo;
import org.baseball.kia.yg.repository.NoticeDao;
import org.baseball.kia.yg.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeService {

	@Autowired
	NoticeDao noticeDao;

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

}
