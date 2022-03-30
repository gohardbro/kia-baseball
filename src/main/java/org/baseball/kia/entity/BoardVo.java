package org.baseball.kia.entity;

import java.util.Date;

public class BoardVo {
	int notice_No;
	String title;
	String content;
	String writer;
	Date write_Date;
	int views;
	int numbers;

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getNumbers() {
		return numbers;
	}

	public void setNumbers(int numbers) {
		this.numbers = numbers;
	}

	public int getNotice_No() {
		return notice_No;
	}

	public void setNotice_No(int notice_No) {
		this.notice_No = notice_No;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getWrite_Date() {
		return write_Date;
	}

	public void setWrite_Date(Date write_Date) {
		this.write_Date = write_Date;
	}
	
	@Override
	public String toString() {
		return "BoardVo [notice_No=" + notice_No + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", write_Date=" + write_Date + ", views=" + views + ", getNotice_No()=" + getNotice_No()
				+ ", getTitle()=" + getTitle() + ", getContent()=" + getContent() + ", getWriter()=" + getWriter()
				+ ", getWrite_Date()=" + getWrite_Date() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
}
