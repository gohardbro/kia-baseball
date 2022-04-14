package org.baseball.kia.yg.entity;

public class LikeVo {
	String idLike;
	int boardNoLike, likes;
	int count;
	
	public String getIdLike() {
		return idLike;
	}
	public void setIdLike(String idLike) {
		this.idLike = idLike;
	}
	public int getBoardNoLike() {
		return boardNoLike;
	}
	public void setBoardNoLike(int boardNoLike) {
		this.boardNoLike = boardNoLike;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
}
