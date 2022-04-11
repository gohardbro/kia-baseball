package org.baseball.kia.yg.service;

import java.util.List;

import org.baseball.kia.yg.entity.FileVo;
import org.baseball.kia.yg.repository.FileDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FileService {

	@Autowired
	FileDao fileDao;
	
	public int getBoardNo() {
		return fileDao.getBoardNo();
	}
	
	public int getNoticeNo() {
		return fileDao.getNoticeNo();
	}

	public void insertFileList(List<FileVo> fileList) {
		fileDao.insertFileList(fileList);
	}
	
	public List<FileVo> getFileList(int no) {
		return fileDao.getFileList(no);
	}
	
	public void deleteFile(FileVo vo) {
		fileDao.deleteFile(vo);
	}
	
	public void deleteFileList(int no) {
		fileDao.deleteFileList(no);
	}
	
	
}
