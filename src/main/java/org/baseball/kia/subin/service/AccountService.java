package org.baseball.kia.subin.service;

import java.util.List;

import org.baseball.kia.subin.entity.AccountPage;
import org.baseball.kia.subin.entity.AccountVo;
import org.baseball.kia.subin.repository.AccountDao;
import org.baseball.kia.subin.repository.BoardDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("accountService_subin")
public class AccountService {
	
	@Autowired
	AccountDao accountDao;
	
	@Autowired
	BoardDao boardDao;
	
	public List<AccountVo> selectAccountByType(AccountPage page) { // 타입별 회원계정 조회
		return accountDao.selectByType(page);
	}
	
	public int selectAccountCnt() { // 회원수 조회
		return accountDao.selectAccountCnt();
	}

	public boolean reportAccount(String id) { // 신고계정 차단 설정 + 기존 게시물 삭제
		if (boardDao.deleteBoardByReportId(id) == 1) {
			return false;
		}
		return accountDao.updateReportById(id) == 1;
	}

	public boolean noReportAccount(String id) { // 신고 취소
		return accountDao.updateNoReportById(id) == 1;
	}
}
