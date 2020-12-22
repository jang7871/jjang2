<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JavaScript Study</title>
<link rel="stylesheet" type="text/css" href="/cls/css/w3.css">
<link rel="stylesheet" type="text/css" href="/cls/css/cls.css">
<script type="text/javascript" src="/cls/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/cls/js/member/login.js"></script>
<style type="text/css">
	label {
		font-size: 16pt;
	}
	
	
</style>
<script type="text/javascript">

</script>
</head>
<body>
	<div class="w3-content w3-center mw700">
		<h1 class="w3-green w3-padding w3-card-4">로그인 비동기 통신</h1>
		<form method="post" action="/cls/member/loginProc.cls" class="w3-col w3-padding w3-card-4 w3-margin-top" id="frm">
			<div class="w3-col w3-margin-top">
				<label for="id" class="w3-col m2 w3-right-align">I D : &nbsp;</label>
				<input type="text" id="id" name="id" placeholder="아이디를 입력하세요!"
						class="w3-col m8 w3-input w3-border w3-round-4">
			</div>
			<div class="w3-col w3-margin-top">
				<label for="pw" class="w3-col m2 w3-right-align">P W : &nbsp;</label>
				<input type="password" id="pw" name="pw" placeholder="비밀번호를 입력하세요!"
						class="w3-col m8 w3-input w3-border w3-round-4">
			</div>
			<div class="w3-col w3-margin-top">
				<!-- home 버튼을 만들어서 메인 페이지로 돌아가게 하기. -->
				<div id="btn1" class="w3-half w3-button w3-green w3-hover-aqua">HOME!</div>
				<div id="btn2" class="w3-half w3-button w3-yellow w3-hover-aqua">Login!</div>
			</div>
			<div class="w3-col w3-hide" id="fr">
				<span id="msg"></span>
			</div>
		</form>
		<div class="w3-col w3-padding w3-card-4 w3-hide"><span id="msg">$(SID) 님은 이미 로그인 했습니다.</span>
		</div>
	</div>
</body>
</html>