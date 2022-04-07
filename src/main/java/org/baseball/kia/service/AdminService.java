package org.baseball.kia.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.baseball.kia.entity.AccountVo;
import org.baseball.kia.entity.BaseballChartVo;
import org.baseball.kia.entity.LineupVo;
import org.baseball.kia.entity.PlayerVo;
import org.baseball.kia.entity.ScheduleVo;
import org.baseball.kia.entity.UniformInfoVo;
import org.baseball.kia.repository.AccountDao;
import org.baseball.kia.repository.BaseballDao;
import org.baseball.kia.repository.BoardDao;
import org.baseball.kia.repository.LineupDao;
import org.baseball.kia.repository.PlayerDAO;
import org.baseball.kia.repository.ScheduleDao;
import org.baseball.kia.repository.UniformDao;
import org.baseball.kia.repository.UniformInfoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

@Service
public class AdminService {

	@Autowired
	LineupDao lineupDao;

	@Autowired
	ScheduleDao scheduleDao;

	@Autowired
	AccountDao accountDao;

	@Autowired
	BoardDao boardDao;

	@Autowired
	UniformInfoDao uniformInfoDao;

	@Autowired
	ServletContext ctx;

	@Autowired
	BaseballDao baseballDao;
	
	@Autowired
	UniformDao uniformDao;
	
	@Autowired
	PlayerDAO playerDao;

	public boolean insertLineup(LineupVo vo) { // 라인업 등록
		return lineupDao.insertOne(vo) == 1;
	}

	public LineupVo selectLineup(LineupVo vo) { // 라인업 조회
		return lineupDao.selectOne(vo);
	}

	public boolean updateLineup(LineupVo vo) { // 라인업 수정
		return lineupDao.updateOne(vo) == 1;
	}

	public List<ScheduleVo> selectSchedule() { // 라인업을 등록할 경기일자 조회
		return scheduleDao.selectDateAndTime();
	}
	
	public List<PlayerVo> selectNameAutoComplete(String name){ // 라인업 작성 시 선수이름 자동완성
		return playerDao.selectNameAutoComplete(name);
	}

	public List<AccountVo> selectAccountByType(String type) { // 타입별 회원계정 조회
		return accountDao.selectByType(type);
	}

	public boolean reportAccount(String id) { // 신고계정 차단 설정 + 기존 게시물 삭제
		if (boardDao.deleteBoardByReportId(id) == 1) {
			return false;
		}
		return accountDao.updateReportById(id) == 1;
	}

	public List<UniformInfoVo> selectUniformInfo(UniformInfoVo vo) { // 유니폼 정보 조회
		return uniformInfoDao.selectUniformInfo(vo);
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

	/*
	 * public List<BaseballVo> selectBaseball(BaseballVo vo){ // 야구장 티켓 예매내역 조회
	 * return baseballDao.selectBaseball(vo); }
	 */

	public Map<String, Object> selectBaseballChartData(BaseballChartVo vo) { // 야구장 티켓 차트 데이터 조회
		List<Integer> cnt = baseballDao.selectBaseballCntChart(vo);
		List<String> date = baseballDao.selectBaseballDateChart(vo);

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("cnt", cnt);
		data.put("date", date);
		return data;
	}
	
	public Map<String, Object> selectUniformByPopularity(){ // 유니폼 top 5
		List<String> uniform = uniformDao.selectUniformByPopularity();
		List<Integer> uniformCnt = uniformDao.selectUniformCntByPopularity();
		
		Gson gson = new Gson();
		Map<String, Object> uniformList = new HashMap<String, Object>();
		uniformList.put("uniformJson", gson.toJson(uniform));
		uniformList.put("uniformCntJson", gson.toJson(uniformCnt));
		uniformList.put("uniform", uniform);
		uniformList.put("uniformCnt", uniformCnt);
		return uniformList;
	}

	public Map<String, Object> selectPlayerByPopularity(){ // 선수 유니폼 top 5
		List<String> player = uniformDao.selectPlayerByPopularity();
		List<Integer> uniformCnt = uniformDao.selectPlayerCntByPopularity(); 

		Gson gson = new Gson();
		Map<String, Object> playerList = new HashMap<String, Object>();
		playerList.put("playerJson", gson.toJson(player));
		playerList.put("uniformCntJson",  gson.toJson(uniformCnt));
		playerList.put("player", player);
		playerList.put("uniformCnt",  uniformCnt);
		return playerList;
	}

}
