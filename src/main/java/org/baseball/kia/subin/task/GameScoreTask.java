package org.baseball.kia.subin.task;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.baseball.kia.subin.entity.ScoreVo;
import org.baseball.kia.subin.repository.ScheduleDao;
import org.baseball.kia.subin.repository.ScoreDao;
import org.springframework.beans.factory.annotation.Autowired;

public class GameScoreTask {

	@Autowired
	ScoreDao scoreDao;

	@Autowired
	ScheduleDao scheduleDao;

	public void playGame() {
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String gameDate = sdf.format(today);

		List<Integer> scheduleNoList = scheduleDao.selectGameDate(gameDate);
		for (int scheduleNo : scheduleNoList) { // 당일 경기 수만큼 반복
			
			List<Integer> kia = new ArrayList<Integer>(); // 기아 점수
			List<Integer> rival = new ArrayList<Integer>(); // 상대팀 점수

			kia.add(0, 0);
			rival.add(0, 0);

			for (int inning = 1; inning <= 9; inning++) { // 1~9회 점수
				kia.add(inning, inningScore());
				rival.add(inning, inningScore());
			}

			// 최종 득점 저장
			kia.add(0, getRuns(kia));
			rival.add(0, getRuns(rival));

			if (kia.get(0) == rival.get(0)) { // 9회까지 동점인 경우
				for (int inning = 10; inning <= 12; inning++) { // 연장 10~12회
					kia.add(inning, inningScore());
					rival.add(inning, inningScore());

					if (kia.get(inning) != rival.get(inning)) { // 승패 결정 시 게임 종료
						break;
					}
				}

				// 최종 득점 저장
				kia.add(0, getRuns(kia));
				rival.add(0, getRuns(rival));
			}
			insertGameScore(scheduleNo, kia, rival); // DB 저장
		} 
	}

	public int inningScore() { // 이닝 점수 구하기
		int score = 0;
		int out = 0;

		while (out < 3) { // 3아웃 전까지 반복
			if (Math.random() < 0.1) {
				score++;
			} else {
				out++;
			}
		}
		return score;
	}

	public int getRuns(List<Integer> score) { // 최종 득점 구하기
		int Runs = 0;
		for (int inning = 1; inning < score.size(); inning++) {
			Runs += score.get(inning);
		}
		return Runs;
	}

	public int insertGameScore(int scheduleNo, List<Integer> kia, List<Integer> rival) { // Score값 DB 저장
		ScoreVo vo = new ScoreVo();
		vo.setSchduleNo(scheduleNo);
		vo.setKiaRuns(kia.get(0));
		vo.setKia1(kia.get(1));
		vo.setKia2(kia.get(2));
		vo.setKia3(kia.get(3));
		vo.setKia4(kia.get(4));
		vo.setKia5(kia.get(5));
		vo.setKia6(kia.get(6));
		vo.setKia7(kia.get(7));
		vo.setKia8(kia.get(8));
		vo.setKia9(kia.get(9));
		vo.setKia10(kia.get(10));
		vo.setKia11(kia.get(11));
		vo.setKia12(kia.get(12));
		vo.setRivalRuns(rival.get(0));
		vo.setRival1(rival.get(1));
		vo.setRival2(rival.get(2));
		vo.setRival3(rival.get(3));
		vo.setRival4(rival.get(4));
		vo.setRival5(rival.get(5));
		vo.setRival6(rival.get(6));
		vo.setRival7(rival.get(7));
		vo.setRival8(rival.get(8));
		vo.setRival9(rival.get(9));
		vo.setRival10(rival.get(10));
		vo.setRival11(rival.get(11));
		vo.setRival12(rival.get(12));

		return scoreDao.insertScore(vo);
	}
}
