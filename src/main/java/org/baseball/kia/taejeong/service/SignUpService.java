package org.baseball.kia.taejeong.service;

import org.baseball.kia.taejeong.entity.AccountVo;
import org.baseball.kia.taejeong.repository.AccountDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class SignUpService {
	@Autowired
	PasswordEncoder passwordEncoder;

	@Autowired
	AccountDao accountDao;

	public boolean registerAccount(AccountVo vo) {
		String pass = vo.getPw();
		String encodedPass = passwordEncoder.encode(pass);
		vo.setPw(encodedPass);
		int r = accountDao.insertOne(vo);
		
		return r == 1 ? true : false;
	}
	
	public int nickNameCheck(String nickName) {
		return accountDao.selectCntByNickName(nickName);
	}
}
