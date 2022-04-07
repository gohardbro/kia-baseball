package org.baseball.kia.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.entity.FileVo_yg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FileDao_yg {
	@Autowired
	SqlSession sqlSession;
	
	public void insertFile(List<FileVo_yg> file) {
		for(FileVo_yg fileList : file) {
			sqlSession.insert("file.insertOne", fileList);
		}
	}
	
	public List<FileVo_yg> getFile(int no) {
		return sqlSession.selectList("file.selectOne", no);
	}
	
	public void deleteFile(FileVo_yg vo) {
		sqlSession.delete("file.deleteFile",vo);
	}
	
	public void deleteFileList(int no) {
		sqlSession.delete("file.deleteFileList", no);
	}
	
	
}
