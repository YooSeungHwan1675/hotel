package com.spring.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	    session.getAttributes().put("memberID", "유저");
	    sessionList.add(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	    // WebSocket 세션에서 memberID 가져오기
	    String memberID = (String) session.getAttributes().get("memberID");

	    // 이제 memberID를 사용할 수 있습니다.
	    String messageToSend = memberID + ": " + message.getPayload();
	    
	    // 모든 세션에 메시지를 전송합니다.
	    for (WebSocketSession sess : sessionList) {
	        sess.sendMessage(new TextMessage(messageToSend));
	    }
	}

	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
	}
}