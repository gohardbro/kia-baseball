package org.baseball.kia.subin.ws;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.baseball.kia.taejeong.entity.AccountVo;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

public class ChattingWebSocketHandler extends TextWebSocketHandler{

	List<WebSocketSession> sessionList;
	Gson gson;
	
	@PostConstruct // 생성자와 같은 역할
	public void initialzed() {
		sessionList = new ArrayList<>(); // 접속한 세션 리스트
		gson = new Gson();
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	// 해당 페이지에 입장한 경우
		sessionList.add(session);
		AccountVo loginInfo = (AccountVo)session.getAttributes().get("loginUser");
		
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("command", "join");
		map.put("user", session.getRemoteAddress().getAddress()); // 접속자 정보
		map.put("total", sessionList.size()); // 접속자 인원 수
		if (loginInfo != null) {
			map.put("nickname", loginInfo.getNickname()); // 로그인한 계정의 닉네임
		} else {
			map.put("nickname", "익명");
		}
		
		String json = gson.toJson(map);
		
		for (WebSocketSession each : sessionList) {
			TextMessage txt = new TextMessage(json);
			each.sendMessage(txt);
		}
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 클라이언트가 웹소켓을 통해 서버쪽으로 send를 했을 때
		AccountVo loginInfo = (AccountVo)session.getAttributes().get("loginUser");
		
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("command", "chat");
		map.put("user", session.getRemoteAddress().getAddress()); // 점속자 정보
		map.put("msg", message.getPayload()); // 클라이언트가 send한 내용(메시지)
		if (loginInfo != null) {
			map.put("nickname", loginInfo.getNickname()); // 로그인한 계정의 닉네임
		} else {
			map.put("nickname", "익명");
		}
		
		String json = gson.toJson(map);
		
		for (WebSocketSession each : sessionList) {
			TextMessage txt = new TextMessage(json);
			each.sendMessage(txt);
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 클라이언트와 연결이 끊어진 경우
		sessionList.remove(session);
		AccountVo loginInfo = (AccountVo)session.getAttributes().get("loginUser");

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("command", "out");
		map.put("user", session.getRemoteAddress().getAddress()); // 점속자 정보
		map.put("total", sessionList.size()); // 점속자 인원 수
		if (loginInfo != null) {
			map.put("nickname", loginInfo.getNickname()); // 로그인한 계정의 닉네임
		} else {
			map.put("nickname", "익명");
		}
		
		String json = gson.toJson(map);
		
		for (WebSocketSession each : sessionList) {
			TextMessage txt = new TextMessage(json);
			each.sendMessage(txt);
		}
	}
}
