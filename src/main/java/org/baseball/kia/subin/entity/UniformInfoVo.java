package org.baseball.kia.subin.entity;

public class UniformInfoVo {
	private int uniInfoNo, price, sCount, mCount, lCount, xlCount;
	private String uniformImg, uniformName, color;

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

	public int getsCount() {
		return sCount;
	}

	public void setsCount(int sCount) {
		this.sCount = sCount;
	}

	public int getmCount() {
		return mCount;
	}

	public void setmCount(int mCount) {
		this.mCount = mCount;
	}

	public int getlCount() {
		return lCount;
	}

	public void setlCount(int lCount) {
		this.lCount = lCount;
	}

	public int getXlCount() {
		return xlCount;
	}

	public void setXlCount(int xlCount) {
		this.xlCount = xlCount;
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

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	@Override
	public String toString() {
		return "UniformInfoVo [uniInfoNo=" + uniInfoNo + ", price=" + price + ", sCount=" + sCount + ", mCount="
				+ mCount + ", lCount=" + lCount + ", xlCount=" + xlCount + ", uniformImg=" + uniformImg
				+ ", uniformName=" + uniformName + ", color=" + color + "]";
	}

}
