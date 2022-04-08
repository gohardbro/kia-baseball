package org.baseball.kia.subin.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.baseball.kia.subin.entity.UniformInfoVo;
import org.baseball.kia.subin.entity.UniformInfoPage;
import org.baseball.kia.subin.repository.UniformInfoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service("uniformInfoService_subin")
public class UniformInfoService {
	
	@Autowired
	UniformInfoDao uniformInfoDao;
	
	@Autowired
	ServletContext ctx;
	
	public List<UniformInfoVo> selectUniformInfo(UniformInfoPage page) { // 유니폼 정보 조회
		return uniformInfoDao.selectUniformInfo(page);
	}
	
	public int selectUniformInfoCnt() { // 유니폼 검색 결과 개수
		return uniformInfoDao.selectUniformInfoCnt();
	}
	
	public UniformInfoVo selectUniformInfoOne(int uniInfoNo) { // 유니폼 상세정보 조회
		return uniformInfoDao.selectUniformInfoOne(uniInfoNo);
	}

	public boolean updateUniformInfo(UniformInfoVo vo, MultipartFile attach) { // 유니폼 정보 수정
		if (attach != null && !attach.isEmpty() && attach.getContentType().startsWith("image")) { // 이미지 파일이 있을 때
			String fileName = uniformImgUpload(attach);
			if (fileName == null) { // 파일 업로드 실패
				return false;
			}
			vo.setUniformImg(fileName); // 파일 이름 세팅
		}
		return uniformInfoDao.updateUniformInfo(vo) == 1;
	}

	public boolean insertUniformInfo(UniformInfoVo vo, MultipartFile attach) { // 유니폼 정보 등록
		if (attach != null && !attach.isEmpty() && attach.getContentType().startsWith("image")) { // 이미지 파일이 있을 때
			String fileName = uniformImgUpload(attach);
			if (fileName == null) {
				return false;
			}
			vo.setUniformImg(fileName);
		}
		return uniformInfoDao.insertUniformInfo(vo) == 1;
	}
	
	public boolean deleteUniformInfo(int uniInfoNo) { // 유니폼 정보 삭제
		return uniformInfoDao.deleteUniformInfo(uniInfoNo) == 1;
	}

	public String uniformImgUpload(MultipartFile attach) { // 유니폼 사진 업로드
		String path = ctx.getRealPath("/images/uniform/"); // 저장경로
		File fPath = new File(path);
		if (!fPath.exists()) { // 폴더가 없으면 생성
			fPath.mkdirs();
		}

		String fileName = UUID.randomUUID().toString();
		File dest = new File(path, fileName);
		try {
			attach.transferTo(dest); // 업로드 처리
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return fileName;
	}
}
