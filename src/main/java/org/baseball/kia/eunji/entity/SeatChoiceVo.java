package org.baseball.kia.eunji.entity;

public class SeatChoiceVo {
	
	//주중주말 요금, 구역, 구역별 제한 
	int baseInfoNo, priceWeekday, baseballZone, limit;
	String priceWeekend;
	
	
	
	public int getBaseInfoNo() {
		return baseInfoNo;
	}
	public void setBaseInfoNo(int baseInfoNo) {
		this.baseInfoNo = baseInfoNo;
	}
	public int getPriceWeekday() {
		return priceWeekday;
	}
	public void setPriceWeekday(int priceWeekday) {
		this.priceWeekday = priceWeekday;
	}
	public int getBaseballZone() {
		return baseballZone;
	}
	public void setBaseballZone(int baseballZone) {
		this.baseballZone = baseballZone;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public String getPriceWeekend() {
		return priceWeekend;
	}
	public void setPriceWeekend(String priceWeekend) {
		this.priceWeekend = priceWeekend;
	}
	
	

}
