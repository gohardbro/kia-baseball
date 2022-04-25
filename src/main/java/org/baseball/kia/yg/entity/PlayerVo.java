package org.baseball.kia.yg.entity;

public class PlayerVo {
	private String name, position, no;


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	@Override
	public String toString() {
		return "PlayerVo [name=" + name + ", position=" + position + ", no=" + no + "]";
	}

}
