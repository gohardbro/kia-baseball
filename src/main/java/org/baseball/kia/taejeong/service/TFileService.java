package org.baseball.kia.taejeong.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

import org.baseball.kia.taejeong.entity.AccountVo;
import org.baseball.kia.taejeong.entity.TFileVo;
import org.baseball.kia.taejeong.repository.TFileDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class TFileService {
//	private final String FORMAT_YYYYMMDD = "yyyy/MM/dd"; 
//    private final DateTimeFormatter DFT = DateTimeFormatter.ofPattern(FORMAT_YYYYMMDD);
    
    /* 프로필 이미지 저장 경로 */
    String basePath = "/Users/anyone/Desktop/upload";
    
    @Autowired
    TFileDao tFileDao;
    
    /* 오늘날짜로 폴더만들기 but! 불필요! cause 톰캣서버 server.xml에 직접 context로 외부폴더 고정으로 잡아놓음*/
//	public Path getPathToday() throws IOException {
//        String todayPath = LocalDateTime.now().format(DFT);	
//        Path pathToday = Paths.get(basePath, todayPath);	
//        if (Files.notExists(pathToday)) {			 
//            Files.createDirectories(pathToday);
//        }
//        return pathToday;
//    }
//	
//	public Path getPathToday(String fileName) throws IOException {
//        return Paths.get(getPathToday().toString(), fileName);	 
//    }

    public TFileVo saveFile(MultipartFile multipartFile) throws IOException {
    	String uuidFileName = UUID.randomUUID() + "_" + multipartFile.getOriginalFilename();
        File f = new File(basePath,uuidFileName);
        multipartFile.transferTo(f); 
        
        TFileVo tFileVo = new TFileVo();
        tFileVo.setProfileName(uuidFileName);
        tFileVo.setContentType(multipartFile.getContentType());
        tFileVo.setProfilePath(basePath);
        return tFileVo;
    }
    
    public boolean modifyProfile(AccountVo loginUserVo, TFileVo tFileVo) {
    	tFileVo.setId(loginUserVo.getId());
    	if(loginUserVo.getProfile() != null) { //session에 있는 로그인한유저의 정보에서 profile이 있다면
    		//기존프로필delete -> 새로운거 insert
    		int r = tFileDao.deleteProfile(tFileVo);
    		int r2 = tFileDao.insertProfile(tFileVo);
    		int r3 = tFileDao.updateAccountTableProfile(tFileVo);
    		if(r+r2+r3 != 3) { //db 수정 다 성공하면 3
    			return false;
    		} else {
    			return true;
    		}
    	} else {
    		//새로운파일 insert
    		int r = tFileDao.insertProfile(tFileVo);
    		int r2 = tFileDao.updateAccountTableProfile(tFileVo);
    		if(r+r2 != 2) { //db 수정 다 성공하면 2
    			return false;
    		} else {
    			return true;
    		}
    	}
    }
    
    
}
