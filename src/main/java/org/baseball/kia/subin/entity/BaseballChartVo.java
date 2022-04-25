package org.baseball.kia.subin.entity;

public class BaseballChartVo {

	String month; // yyyy-MM
	String week; // 주차
	String zone; // 좌석

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getWeek() {
		return week;
	}

	public void setWeek(String week) {
		this.week = week;
	}

	public String getZone() {
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

	@Override
	public String toString() {
		return "BaseballChartVo [week=" + week + ", month=" + month + ", zone=" + zone + "]";
	}
}
