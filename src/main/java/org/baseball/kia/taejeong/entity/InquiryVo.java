package org.baseball.kia.taejeong.entity;

import java.sql.Date;

public class InquiryVo {
	int inquiryNo;
	String title;
	String content;
	Date writeDate;
	String writer;
	String answer;
	String periodBtn;
	
	
	public String getPeriodBtn() {
		return periodBtn;
	}
	public void setPeriodBtn(String periodBtn) {
		this.periodBtn = periodBtn;
	}
	public int getInquiryNo() {
		return inquiryNo;
	}
	public void setInquiryNo(int inquiryNo) {
		this.inquiryNo = inquiryNo;
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
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	@Override
	public String toString() {
		return "InquiryVo [inquiryNo=" + inquiryNo + ", title=" + title + ", content=" + content + ", writeDate="
				+ writeDate + ", writer=" + writer + ", answer=" + answer + ", periodBtn=" + periodBtn + "]";
	}
	
	
	
}
