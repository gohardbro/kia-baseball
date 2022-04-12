package org.baseball.kia.subin.entity;

public class ScheduleVo {
	int scheduleNo;
	String gameDate, gameTime, rival, home;

	public int getScheduleNo() {
		return scheduleNo;
	}

	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
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

	public String getRival() {
		return rival;
	}

	public void setRival(String rival) {
		this.rival = rival;
	}

	public String getHome() {
		return home;
	}

	public void setHome(String home) {
		this.home = home;
	}

	@Override
	public String toString() {
		return "ScheduleVo [scheduleNo=" + scheduleNo + ", gameDate=" + gameDate + ", gameTime=" + gameTime + ", rival="
				+ rival + ", home=" + home + "]";
	}

}
