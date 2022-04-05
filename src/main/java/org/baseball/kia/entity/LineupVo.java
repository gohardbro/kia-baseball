package org.baseball.kia.entity;

public class LineupVo {

	int no; // 번호
	String gameDate, gameTime; // 경기 날짜 시간
	String pitcher, hitter1, hitter2, hitter3, hitter4, hitter5, hitter6, hitter7, hitter8, hitter9; // 투수, 1~9번 타자
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public String getPitcher() {
		return pitcher;
	}
	public void setPitcher(String pitcher) {
		this.pitcher = pitcher;
	}
	public String getHitter1() {
		return hitter1;
	}
	public void setHitter1(String hitter1) {
		this.hitter1 = hitter1;
	}
	public String getHitter2() {
		return hitter2;
	}
	public void setHitter2(String hitter2) {
		this.hitter2 = hitter2;
	}
	public String getHitter3() {
		return hitter3;
	}
	public void setHitter3(String hitter3) {
		this.hitter3 = hitter3;
	}
	public String getHitter4() {
		return hitter4;
	}
	public void setHitter4(String hitter4) {
		this.hitter4 = hitter4;
	}
	public String getHitter5() {
		return hitter5;
	}
	public void setHitter5(String hitter5) {
		this.hitter5 = hitter5;
	}
	public String getHitter6() {
		return hitter6;
	}
	public void setHitter6(String hitter6) {
		this.hitter6 = hitter6;
	}
	public String getHitter7() {
		return hitter7;
	}
	public void setHitter7(String hitter7) {
		this.hitter7 = hitter7;
	}
	public String getHitter8() {
		return hitter8;
	}
	public void setHitter8(String hitter8) {
		this.hitter8 = hitter8;
	}
	public String getHitter9() {
		return hitter9;
	}
	public void setHitter9(String hitter9) {
		this.hitter9 = hitter9;
	}
	
	@Override
	public String toString() {
		return "LineupVO [no=" + no + ", gameDate=" + gameDate + ", gameTime=" + gameTime + ", pitcher=" + pitcher
				+ ", hitter1=" + hitter1 + ", hitter2=" + hitter2 + ", hitter3=" + hitter3 + ", hitter4=" + hitter4
				+ ", hitter5=" + hitter5 + ", hitter6=" + hitter6 + ", hitter7=" + hitter7 + ", hitter8=" + hitter8
				+ ", hitter9=" + hitter9 + "]";
	}
	
	
}
