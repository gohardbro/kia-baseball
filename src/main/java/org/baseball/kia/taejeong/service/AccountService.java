package org.baseball.kia.taejeong.service;

import org.baseball.kia.taejeong.entity.AccountVo;
import org.baseball.kia.taejeong.repository.AccountDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class AccountService {
	
	@Autowired
	AccountDao accountDao;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	
	public boolean isValidAccount(String id, String pass) {
		String dbPass = accountDao.selectPassById(id);
		if(dbPass == null)
			return false;
		
		return passwordEncoder.matches(pass, dbPass);
	}
	
	public AccountVo findAccountById(String id) {
		return accountDao.selectOneById(id);
	}
	

	public boolean modifyAccount(AccountVo vo) {
		int r = accountDao.updateOne(vo);
		
		return r ==1;
	}
	
	public boolean updatePw(AccountVo vo) {
		String pass = vo.getPw();
		String encodedPass = passwordEncoder.encode(pass);
		vo.setPw(encodedPass);
		int r = accountDao.updateOne(vo);
		
		return r == 1 ? true : false;
	}
	
	public String phone_format(String phone) {
		String reg = "(\\d{3})(\\d{3,4})(\\d{4})";
		return phone.replaceAll(reg, "$1-$2-$3");
	}
	
	public int updateSessionIdAndLimitTime(AccountVo vo) {
		return accountDao.updateSessionIdById(vo);
	}
	
	public AccountVo getAccountBySessionId(String sessionId) {
		return accountDao.selectOneBySessionId(sessionId);
	}
	
}
