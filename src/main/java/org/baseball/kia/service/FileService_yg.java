package org.baseball.kia.service;

import java.util.List;

import org.baseball.kia.entity.FileVo_yg;
import org.baseball.kia.repository.FileDao_yg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FileService_yg {

	@Autowired
	FileDao_yg fileDao;
	
	public void insertFile(List<FileVo_yg> fileList) {
		fileDao.insertFile(fileList);
	}
	
	public List<FileVo_yg> getFile(int no) {
		return fileDao.getFile(no);
	}
	
	public void deleteFile(FileVo_yg vo) {
		fileDao.deleteFile(vo);
	}
	
	public void deleteFileList(int no) {
		fileDao.deleteFileList(no);
	}
	
}
