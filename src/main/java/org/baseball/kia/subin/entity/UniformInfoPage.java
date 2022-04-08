package org.baseball.kia.subin.entity;

import java.util.List;

public class UniformInfoPage extends PageVo {
	String uniformName;
	String color;
	List<UniformInfoVo> uniformInfoList;

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

	public List<UniformInfoVo> getUniformInfoList() {
		return uniformInfoList;
	}

	public void setUniformInfoList(List<UniformInfoVo> uniformInfoList) {
		this.uniformInfoList = uniformInfoList;
	}

	@Override
	public String toString() {
		String str = super.toString();
		return str + "\n UniformInfoPage [uniformName=" + uniformName + ", color=" + color + ", uniformInfoList="
				+ uniformInfoList + "]";
	}

}
