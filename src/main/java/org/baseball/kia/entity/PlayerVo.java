package org.baseball.kia.entity;

public class PlayerVo {
	int no;
	String name, position;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

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

	@Override
	public String toString() {
		return "PlayerVo [no=" + no + ", name=" + name + ", position=" + position + "]";
	}
}
