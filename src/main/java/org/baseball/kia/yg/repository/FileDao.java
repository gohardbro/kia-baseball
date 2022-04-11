package org.baseball.kia.yg.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.baseball.kia.yg.entity.FileVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FileDao {
	@Autowired
	SqlSession sqlSession;
	
	public int getBoardNo() {
		return sqlSession.selectOne("file.getBoardNo");
	}
	
	public int getNoticeNo() {
		return sqlSession.selectOne("file.getNoticeNo");
	}
	
	public void insertFileList(List<FileVo> fileList) {
		for(FileVo boardFile : fileList) {
			sqlSession.insert("file.insertFileList", boardFile);
		}
	}
	
	public List<FileVo> getFileList(int seq) {
		return sqlSession.selectList("file.getBoardFileList", seq);
	}
	
	public void deleteFile(FileVo vo) {
		sqlSession.delete("file.deleteFile", vo);
	}
	
	public void updateFile(FileVo vo) {
		sqlSession.update("file.updateFile", vo);
	}
	
	public void deleteFileList(int no) {
		sqlSession.delete("file.deleteFileList", no);
	}
	
	
	
}
