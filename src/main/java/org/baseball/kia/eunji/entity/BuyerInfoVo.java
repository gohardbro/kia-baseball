package org.baseball.kia.eunji.entity;

import java.sql.Date;

public class BuyerInfoVo {

	int baseballNo;
	String buyer;
	Date buyDate;
	int baseInfoNo;
	int total;
	int buyerCnt;
	Date refund;
	int scheduleNo;
	String cancel;

	public int getBaseballNo() {
		return baseballNo;
	}

	public void setBaseballNo(int baseballNo) {
		this.baseballNo = baseballNo;
	}

	public String getBuyer() {
		return buyer;
	}

	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}

	public Date getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	public int getBaseInfoNo() {
		return baseInfoNo;
	}

	public void setBaseInfoNo(int baseInfoNo) {
		this.baseInfoNo = baseInfoNo;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getBuyerCnt() {
		return buyerCnt;
	}

	public void setBuyerCnt(int buyerCnt) {
		this.buyerCnt = buyerCnt;
	}

	public Date getRefund() {
		return refund;
	}

	public void setRefund(Date refund) {
		this.refund = refund;
	}

	public int getScheduleNo() {
		return scheduleNo;
	}

	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}

	public String getCancel() {
		return cancel;
	}

	public void setCancel(String cancel) {
		this.cancel = cancel;
	}

}
