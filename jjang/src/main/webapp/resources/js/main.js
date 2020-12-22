$(document).ready(function() {

	$('#jbtn').click(function() {

		alert('조인');
		$(location).attr('href', '/jjs/member/join.jjs');
	});

	$('#lbtn').click(function() {

		// 로그인
		$(location).attr('href', '/jjs/member/login.jjs');
	});

	$('#ibtn').click(function() {

		// 회원정보
		$(location).attr('href', '/jjs/member/memberInfo.jjs');
	});

	document.getElementById('obtn').onclick = function() {

		// 로그아웃
		location.href = '/jjs/member/logout.jjs';
	};

	$('#gbtn').click(function() {

		// 방명록
		$(location).attr('href', '/jjs/guestBoard/gBoardList.jjs');
	});

	$('#irbtn').click(function() {

		// 댓글쓰기
		$(location).attr('href', '/jjs/reBoard/initRBD.jjs');
	});

	$('#rbtn').click(function() {

		// 댓글게시판
		$(location).attr('href', '/jjs/reBoard/reBoard.jjs');
	});

	// 설문조사	
	$('#sbtn').click(function() {

		// 댓글게시판
		$(location).attr('href', '/jjs/survey/surveyInfo.jjs');
	});

	// 파일게시판
	$('#fbtn').click(function() {

		$(location).attr('href', '/jjs/board/boardList.jjs');
	});

});