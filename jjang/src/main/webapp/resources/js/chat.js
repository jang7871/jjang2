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
		alert('좀 봐껴라');
		webSocket = new WebSocket("ws://192.168.2.16/jjs/chat-ws");
		
		// 웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
		webSocket.onopen = onOpen;
		webSocket.onmessage = onMessage;
		webSocket.onclose = onClose;
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
		alert('대화방에서 퇴장합니다.');
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
		$('#chatarea').html($('#chatarea').html() + "<br>" + data);
	}
	
	// 웹 소켓에서 연결이 해제 되었을 때 호출되는 함수
	function onClose() {
		two.css('display', 'none');
	}

});