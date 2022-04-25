package org.baseball.kia.subin.entity;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class BoardVo {
	private int boardNo, likes, views;
	private String title, content, writer;
	private Date writeDate;

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "BaseballVo [boardNo=" + boardNo + ", likes=" + likes + ", views=" + views + ", title=" + title
				+ ", content=" + content + ", writer=" + writer + ", writeDate=" + writeDate + "]";
	}
}
