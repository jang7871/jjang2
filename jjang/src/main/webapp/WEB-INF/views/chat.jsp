<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 웹 브라우저</title>
<link rel="stylesheet" type="text/css" href="/jjs/css/w3.css">
<link rel="stylesheet" type="text/css" href="/jjs/css/cls.css">
<script type="text/javascript" src="/jjs/js/jquery-3.5.1.min.js"></script>
<!-- <script type="text/javascript" src="/jjs/js/chat.js"></script> -->
</head>
<body>
	<div id="one">
		별명:<input type="text" id="nickname">
		<input type="button" id="enter" value="입장">
	</div>
	
	<div id="two" style="display: none">
		<input type="button" id="exit" value="퇴장">
		<br/>
		<div id="chatarea" style="width: 400px; height: 600px; border: 1px solid;"></div>
		<input type="text" id="message">
		<input type="button" id="send" value="보내기">
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		
		var one = $('#one');
		var two = $('#two');
		
		$('#enter').click(function() {
			// 웹 소켓에 연결해주는 함수 호출
			connect();
		});
		
		$('#exit').click(function() {
			// 웹 소켓에 연결을 해제해주는 함수 호출
			disconnect();
		})
		
		$('#send').click(function() {
			// 웹 소켓에 메세지를 보내는 함수
			send();
		});
		
		var webSocket;
		// 입장버튼을 눌렀을 때 호출되는 함수
		function connect() {
			webSocket = new WebSocket("ws://localhost/jjs/chat-ws");
			
			// 웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
			webSocket.onopen = onOpen;
			webSocket.onmessage = onMessage;
			webSocket.onclose = onClose;
			webSocket.onerror = function() {
				alert('WebSocket 오류');
			}
		}
		
		// 보내기버튼을 눌렀을 때 호출되는 함수
		function send() {
			var nickname = $('#nickname').val();
			var msg = $('#message').val();
			webSocket.send(nickname + ":" + msg);
			$('#message').val('');
		}
		
		// 퇴장버튼을 눌렀을 때 호출되는 함수
		function disconnect() {
			var nickname = $('#nickname').val();
			webSocket.send(nickname + "님이 퇴장하셨습니다.");		
			webSocket.close();
			
		}
		
		// 웹 소켓에 연결되었을 때 호출되는 함수
		function onOpen() {
			var nickname = $('#nickname').val();
			two.css('display', 'block');
			webSocket.send(nickname + '님이 입장하셨습니다.');
		}
		
		// 웹 소켓에 메세지를 보낼 떄 호출되는 함수
		function onMessage(evt) {
			var data = evt.data;
			$('#chatarea').html($('#chatarea').html() + "<br/>" + data);
		}
		
		// 웹 소켓에서 연결이 해제 되었을 때 호출되는 함수
		function onClose() {

		}

	});	
</script>
</html>