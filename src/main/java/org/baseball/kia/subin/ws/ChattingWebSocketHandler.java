package org.baseball.kia.subin.ws;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

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
		
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("command", "join");
		map.put("data", session.getRemoteAddress().getAddress());
		map.put("total", sessionList.size()); // 접속자 인원 수
		
		String json = gson.toJson(map);
		
		for (WebSocketSession each : sessionList) {
			TextMessage txt = new TextMessage(json);
			each.sendMessage(txt);
		}
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 클라이언트가 웹소켓을 통해 서버쪽으로 send를 했을 때

		String payload = message.getPayload(); // 클라이언트가 send한 내용

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("command", "chat");
		map.put("data", payload);
		map.put("talker", session.getRemoteAddress().getAddress());
		
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

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("command", "out");
		map.put("data", session.getRemoteAddress().getAddress());
		map.put("total", sessionList.size());
		
		String json = gson.toJson(map);
		
		for (WebSocketSession each : sessionList) {
			TextMessage txt = new TextMessage(json);
			each.sendMessage(txt);
		}
	}
}
