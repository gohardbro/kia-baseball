package org.baseball.kia.subin.entity;

public class CalendarVo {
	private int scheduleNo;
	private String gameDate, gameTime, rival, home;
	private String sponsor, teamImg, field, director, cqptain, teamName;

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

	public String getSponsor() {
		return sponsor;
	}

	public void setSponsor(String sponsor) {
		this.sponsor = sponsor;
	}

	public String getTeamImg() {
		return teamImg;
	}

	public void setTeamImg(String teamImg) {
		this.teamImg = teamImg;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getCqptain() {
		return cqptain;
	}

	public void setCqptain(String cqptain) {
		this.cqptain = cqptain;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	@Override
	public String toString() {
		return "CalendarVo [scheduleNo=" + scheduleNo + ", gameDate=" + gameDate + ", gameTime=" + gameTime + ", rival="
				+ rival + ", home=" + home + ", sponsor=" + sponsor + ", teamImg=" + teamImg + ", field=" + field
				+ ", director=" + director + ", cqptain=" + cqptain + ", teamName=" + teamName + "]";
	}

}
