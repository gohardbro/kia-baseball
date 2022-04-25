package org.baseball.kia.subin.entity;

import java.util.ArrayList;
import java.util.List;

public class LineupVo {

	private int no; // 번호
	private int scheduleNo; // 경기 날짜 시간
	private String pitcher, hitter1, hitter2, hitter3, hitter4, hitter5, hitter6, hitter7, hitter8, hitter9; // 투수, 1~9번 타자
	private List<String> hitterList;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getScheduleNo() {
		return scheduleNo;
	}

	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
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

	public List<String> getHitterList() {
		return hitterList;
	}

	public LineupVo setHitterList() {
		if (hitter1 == null) {
			return this;
		}
		hitterList = new ArrayList<String>(9);
		hitterList.add(hitter1);
		hitterList.add(hitter2);
		hitterList.add(hitter3);
		hitterList.add(hitter4);
		hitterList.add(hitter5);
		hitterList.add(hitter6);
		hitterList.add(hitter7);
		hitterList.add(hitter8);
		hitterList.add(hitter9);
		return this;
	}

	@Override
	public String toString() {
		return "LineupVo [no=" + no + ", scheduleNo=" + scheduleNo + ", pitcher=" + pitcher + ", hitter1=" + hitter1
				+ ", hitter2=" + hitter2 + ", hitter3=" + hitter3 + ", hitter4=" + hitter4 + ", hitter5=" + hitter5
				+ ", hitter6=" + hitter6 + ", hitter7=" + hitter7 + ", hitter8=" + hitter8 + ", hitter9=" + hitter9
				+ ", hitterList=" + hitterList + "]";
	}

}
