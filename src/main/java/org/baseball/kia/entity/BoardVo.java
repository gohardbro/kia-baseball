package org.baseball.kia.entity;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class BoardVo {
	int board_No;
	String title;
	String content;
	String writer;
	Date write_Date;
	int views;
	int likes;
	MultipartFile uploadFile;

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public int getBoard_No() {
		return board_No;
	}

	public void setBoard_No(int board_No) {
		this.board_No = board_No;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
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
		return "BoardVo [board_No=" + board_No + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", write_Date=" + write_Date + ", views=" + views + ", likes=" + likes + ", getBoard_No()="
				+ getBoard_No() + ", getLikes()=" + getLikes() + ", getViews()=" + getViews() + ", getTitle()="
				+ getTitle() + ", getContent()=" + getContent() + ", getWriter()=" + getWriter() + ", getWrite_Date()="
				+ getWrite_Date() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}

}
