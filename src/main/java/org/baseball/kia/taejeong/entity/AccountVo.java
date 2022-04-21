
package org.baseball.kia.taejeong.entity;

import java.sql.Date;

public class AccountVo {
	

	int point, reportCnt;
	String id, pw, profile, name, nickname, admin, phone, report; 
	Date joinDate;
	private String sessionId;
	private Date limitTime;
	String autoLogin;
	
	
	
	public String getAutoLogin() {
		return autoLogin;
	}
	public void setAutoLogin(String autoLogin) {
		this.autoLogin = autoLogin;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getReportCnt() {
		return reportCnt;
	}
	public void setReportCnt(int reportCnt) {
		this.reportCnt = reportCnt;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getReport() {
		return report;
	}
	public void setReport(String report) {
		this.report = report;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public Date getLimitTime() {
		return limitTime;
	}
	public void setLimitTime(Date limitTime) {
		this.limitTime = limitTime;
	}
	@Override
	public String toString() {
		return "AccountVo [point=" + point + ", reportCnt=" + reportCnt + ", id=" + id + ", pw=" + pw + ", profile="
				+ profile + ", name=" + name + ", nickname=" + nickname + ", admin=" + admin + ", phone=" + phone
				+ ", report=" + report + ", joinDate=" + joinDate + ", sessionId=" + sessionId + ", limitTime="
				+ limitTime + "]";
	}
	
	
	
	

}
