package org.baseball.kia.service;

import org.baseball.kia.entity.AccountVo;
import org.baseball.kia.repository.AccountDao;
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
}
