package org.baseball.kia.entity;

import java.util.Date;

public class BaseballVo {

	int baseballNo, baseInfoNo, total, buyerCnt;
	String gameDate, gameTime, buyer, zone;
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

	public String getGameDate() {
		return gameDate;
	}

	public void setGameDate(String gameDate) {
		this.gameDate = gameDate;
	}

	public String getGameTime() {
		return gameTime;
	}

	public void setGameTime(String gameTime) {
		this.gameTime = gameTime;
	}

	public String getBuyer() {
		return buyer;
	}

	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}

	public String getZone() {
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
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
				+ ", buyerCnt=" + buyerCnt + ", gameDate=" + gameDate + ", gameTime=" + gameTime + ", buyer=" + buyer
				+ ", zone=" + zone + ", buyDate=" + buyDate + ", refund=" + refund + "]";
	}

}
