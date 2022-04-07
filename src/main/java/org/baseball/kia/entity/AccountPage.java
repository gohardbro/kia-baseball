package org.baseball.kia.entity;

import java.util.List;

public class AccountPage extends PageVo{
	String type;
	List<AccountVo> accountList;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public List<AccountVo> getAccountList() {
		return accountList;
	}

	public void setAccountList(List<AccountVo> accountList) {
		this.accountList = accountList;
	}
}
