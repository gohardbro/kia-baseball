package org.baseball.kia.entity;

public class UniformInfoVo {
	int uniInfoNo, price, uniformCnt;
	String uniformSize, color, playerName, uniformImg, uniformName;

	public int getUniformCnt() {
		return uniformCnt;
	}

	public void setUniformCnt(int uniformCnt) {
		this.uniformCnt = uniformCnt;
	}

	public int getUniInfoNo() {
		return uniInfoNo;
	}

	public void setUniInfoNo(int uniInfoNo) {
		this.uniInfoNo = uniInfoNo;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getUniformSize() {
		return uniformSize;
	}

	public void setUniformSize(String uniformSize) {
		this.uniformSize = uniformSize;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getPlayerName() {
		return playerName;
	}

	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}

	public String getUniformImg() {
		return uniformImg;
	}

	public void setUniformImg(String uniformImg) {
		this.uniformImg = uniformImg;
	}

	public String getUniformName() {
		return uniformName;
	}

	public void setUniformName(String uniformName) {
		this.uniformName = uniformName;
	}

	@Override
	public String toString() {
		return "UniformInfoVo [uniInfoNo=" + uniInfoNo + ", price=" + price + ", uniformCnt=" + uniformCnt
				+ ", uniformSize=" + uniformSize + ", color=" + color + ", playerName=" + playerName + ", uniformImg="
				+ uniformImg + ", uniformName=" + uniformName + "]";
	}

}
