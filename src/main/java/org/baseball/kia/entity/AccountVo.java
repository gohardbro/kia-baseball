package org.baseball.kia.entity;

import java.sql.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

public class AccountVo {

//	@Email(message = "이메일만 가능합니다.")
	@NotBlank(message = "아이디(이메일)를 입력하세요.")
	String id;

	@NotBlank(message = "비밀번호를 입력하세요.")
	@Pattern(regexp = "(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,20}", message = "비밀번호는 영문 대,소문자와 숫자, 특수기호가 적어도 1개 이상씩 포함된 8자 ~ 20자의 비밀번호여야 합니다.")
	String pw;

	String profile;
	String name;

	@NotBlank(message = "닉네임을 입력하세요.")
	String nickname;
	
	String admin;
	int point;
	int report_cnt;
	Date join_date;
	String phone;
	String report;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public void setNickname(String nickName) {
		this.nickname = nickName;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getReport_cnt() {
		return report_cnt;
	}

	public void setReport_cnt(int report_cnt) {
		this.report_cnt = report_cnt;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
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

	@Override
	public String toString() {
		return "AccountVo [id=" + id + ", pw=" + pw + ", profile=" + profile + ", name=" + name + ", nickname="
				+ nickname + ", admin=" + admin + ", point=" + point + ", report_cnt=" + report_cnt + ", join_date="
				+ join_date + ", phone=" + phone + ", report=" + report + "]";
	}

}
