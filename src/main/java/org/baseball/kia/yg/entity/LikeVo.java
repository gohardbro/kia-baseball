package org.baseball.kia.yg.entity;

public class LikeVo {
	private String idLike;
	private int boardNoLike, likes;
	private int count;
	
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
	
	@Override
	public String toString() {
		return "LikeVo [idLike=" + idLike + ", boardNoLike=" + boardNoLike + ", likes=" + likes + ", count=" + count
				+ "]";
	}
	
}
