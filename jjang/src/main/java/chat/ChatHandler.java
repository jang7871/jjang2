package chat;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.socket.*;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.handler.TextWebSocketHandler;

/*
	@Configuration	: 해당 클래스에서 1개 이상의 Bean을 생성하고 있음을 명시
		
	@Bean			: 이 어노테이션을 사용하는 클래스의 경우 반드시 @Configuration과 함께 사용해야 한다.
	
	@Component		: 개발자가 직접 개발한 클래스에 Bean으로 등록하고자 하는 경우 사용

	@EnableWebSocket: 웹 소켓에 대해 대부분 자동설정을 한다.
 */
@Component
public class ChatHandler extends TextWebSocketHandler implements WebSocketConfigurer {
	private static List<WebSocketSession> list = new ArrayList<WebSocketSession>();
	//클라이언트가 접속 했을 때 호출될 메소드
	//클라이언트가 접속 했을 때 호출되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		list.add(session);
		System.out.println("하나의 클라이언트가 연결됨 ");
	}
	//클라이언트가 메시지를 보냈을 때 호출되는 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 전송된 메시지를 List의 모든 세션에 전송
		String msg = message.getPayload();
		for (WebSocketSession s : list) {
			s.sendMessage(new TextMessage(session.getAcceptedProtocol()+" : " + msg));
		}
	}
	// 클라이언트의 접속이 해제 되었을 때 호출되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("클라이언트와 연결 해제됨");
		list.remove(session);
	}
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		System.out.println("IP 허용");
		registry.addHandler(this, "/chat-ws").setAllowedOrigins("*");
	}

}
