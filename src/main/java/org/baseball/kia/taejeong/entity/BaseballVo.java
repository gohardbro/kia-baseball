package org.baseball.kia.taejeong.entity;

import java.sql.Date;

public class BaseballVo {
	int baseballNo;
	String buyer;
	Date buyDate;
	int baseInfoNo;
	int total;
	int buyerCnt;
	Date refund;
	int scheduleNo;
	String gameDate;
	String gameTime;
	String rival;
	int priceWeekday;
	String baseballZone;
	int priceWeekend;
	String dateTypeSelect; 
	String yearSelect;
	String monSelect;
	String periodBtn;
	
	
	public int getBaseballNo() {
		return baseballNo;
	}
	public void setBaseballNo(int baseballNo) {
		this.baseballNo = baseballNo;
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
	public String getRival() {
		return rival;
	}
	public void setRival(String rival) {
		this.rival = rival;
	}
	public int getPriceWeekday() {
		return priceWeekday;
	}
	public void setPriceWeekday(int priceWeekday) {
		this.priceWeekday = priceWeekday;
	}
	public String getBaseballZone() {
		return baseballZone;
	}
	public void setBaseballZone(String baseballZone) {
		this.baseballZone = baseballZone;
	}
	public int getPriceWeekend() {
		return priceWeekend;
	}
	public void setPriceWeekend(int priceWeekend) {
		this.priceWeekend = priceWeekend;
	}
	public String getDateTypeSelect() {
		return dateTypeSelect;
	}
	public void setDateTypeSelect(String dateTypeSelect) {
		this.dateTypeSelect = dateTypeSelect;
	}
	public String getYearSelect() {
		return yearSelect;
	}
	public void setYearSelect(String yearSelect) {
		this.yearSelect = yearSelect;
	}
	public String getMonSelect() {
		return monSelect;
	}
	public void setMonSelect(String monSelect) {
		this.monSelect = monSelect;
	}
	public String getPeriodBtn() {
		return periodBtn;
	}
	public void setPeriodBtn(String periodBtn) {
		this.periodBtn = periodBtn;
	}
	
	
	
	
	
	
	
}
