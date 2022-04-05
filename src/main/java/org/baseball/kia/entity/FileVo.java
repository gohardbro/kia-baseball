package org.baseball.kia.entity;

public class FileVo {
	int file_No;
	int board_No;
	int notice_No;
	String file_Name;
	String file_Type;
	long file_Size;
	String file_Location;
	
	
	public int getFile_No() {
		return file_No;
	}
	public void setFile_No(int file_No) {
		this.file_No = file_No;
	}
	public int getBoard_No() {
		return board_No;
	}
	public void setBoard_No(int board_No) {
		this.board_No = board_No;
	}
	public int getNotice_No() {
		return notice_No;
	}
	public void setNotice_No(int notice_No) {
		this.notice_No = notice_No;
	}
	public String getFile_Name() {
		return file_Name;
	}
	public void setFile_Name(String file_Name) {
		this.file_Name = file_Name;
	}
	public String getFile_Type() {
		return file_Type;
	}
	public void setFile_Type(String file_Type) {
		this.file_Type = file_Type;
	}
	public long getFile_Size() {
		return file_Size;
	}
	public void setFile_Size(long file_Size) {
		this.file_Size = file_Size;
	}
	public String getFile_Location() {
		return file_Location;
	}
	public void setFile_Location(String file_Location) {
		this.file_Location = file_Location;
	}

	@Override
	public String toString() {
		return "FileVo [file_No=" + file_No + ", board_No=" + board_No + ", notice_No=" + notice_No + ", file_Name="
				+ file_Name + ", file_Type=" + file_Type + ", file_Size=" + file_Size + ", file_Location="
				+ file_Location + "]";
	}
}
