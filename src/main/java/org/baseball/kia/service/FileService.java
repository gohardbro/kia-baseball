package org.baseball.kia.service;

import java.util.List;

import org.baseball.kia.entity.FileVo;
import org.baseball.kia.repository.FileDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FileService {

	@Autowired
	FileDao fileDao;
	
	public void insertFile(List<FileVo> fileList) {
		fileDao.insertFile(fileList);
	}
	
	public List<FileVo> getFile(int no) {
		return fileDao.getFile(no);
	}
	
	public void deleteFile(FileVo vo) {
		fileDao.deleteFile(vo);
	}
	
	public void deleteFileList(int no) {
		fileDao.deleteFileList(no);
	}
	
}
