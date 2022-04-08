package org.baseball.kia.subin.entity;

import java.sql.Date;

public class BaseballVo {

	int baseballNo, baseInfoNo, total, buyerCnt, scheduleNo;
	String buyer;
	Date buyDate, refund;

	public int getBaseballNo() {
		return baseballNo;
	}

	public void setBaseballNo(int baseballNo) {
		this.baseballNo = baseballNo;
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

	public int getScheduleNo() {
		return scheduleNo;
	}

	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
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

	public Date getRefund() {
		return refund;
	}

	public void setRefund(Date refund) {
		this.refund = refund;
	}

	@Override
	public String toString() {
		return "BaseballVo [baseballNo=" + baseballNo + ", baseInfoNo=" + baseInfoNo + ", total=" + total
				+ ", buyerCnt=" + buyerCnt + ", scheduleNo=" + scheduleNo + ", buyer=" + buyer + ", buyDate=" + buyDate
				+ ", refund=" + refund + "]";
	}

}
