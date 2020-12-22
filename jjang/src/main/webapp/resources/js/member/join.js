$(document).ready(function() {
	// 아이디 체크 버튼
	$('#idck').click(function() {
		
		// 할 일
		var sid = $('#id').val();
		
		if(!sid) {
			
			return;
		}
		
		// 데이터를 서버에 보내서 응답을 받는다.
		$.ajax({
			url: '/cls/member/idCheck.cls',
			type: 'post',
			dataType: 'json',
			data: {
				id: sid
			},
			success: function(data){
				if (data.result == 'OK') {
					// 사용가능한 아이디인 경우.
					$('#idmsg').removeClass('w3-text-red');
					$('#idmsg').addClass('w3-text-blue').html('*** 사용가능한 아이디입니다. ***').stop().slideDown(500);
				} else {
					// 사용 불가능한 아이디인 경우.
					$('#idmsg').removeClass('w3-text-blue');
					$('#idmsg').addClass('w3-text-red').html('### 사용 불가능한 아이디입니다. ###').stop().slideDown(500);
				}
			},
			error: function() {
				alert('통신 에러');
			}
		})
	});
	
	// 성별 선택 시 그에 맞는 아바타를 보여주는 창
	$('.gen').click(function() {
		// 할 일
		// 1. 무슨 성별이 선택됬는지 알아낸다.
		var sgen = $(this).val();
		if(sgen == 'M') {
			$('.avtMfr').slideDown(300);
			$('.avtFfr').slideUp(300);
		} else if(sgen == 'F') {
			$('.avtFfr').slideDown(300);
			$('.avtMfr').slideUp(300);		
		}
		
	});
	
	// 비밀번호 확인 기능.
	var i = 0;
	$('#repw').keyup(function() {
		// 할일
		// 1. 비밀번호 읽어오고
		var spw = $('#pw').val();
		// 2. 확인번호 읽어오고
		var srepw = $(this).val(); // this : 자기를 호출한 함수의 객체.
		// 3. 비교하고
		if(spw == srepw) {
			// 4. 결과 처리
			$('#pwmsg').css('color', 'blue').slideUp(100); 
		} else {
			$('#pwmsg').css('color', 'red').html('비밀번호가 다릅니다.').slideDown(100); 		
		}
//		$('#pwmsg').stop().show();
//		setTiemOut(hidePwTag, 1500);
	
	});
	
	function hidePwTag() {
		$('#repw').parent().parent().stop().slideUp(100);
	}
	
	// 회원이름 정규식 검사
	$('#name').change(function() {
		var sid = $(this).val();
		
		var pattern = /^[갸-힣]{2,10}$/;
		var result = pattern.test(sid);
		alert('result : ' + result);
	});
	
	// 비밀변호 정규식 검사.
	$('#pw').keyup(function() {
		// 비밀번호는 대,소문자 , 숫자, 특수문자(#@!$%$-_) 1개이상
		
		// 입력내용 뽑아내기
		var spw = $(this).val();
		
		// 정규식 패턴 만들기
		var pattern = /^.*(?=^[a-zA-Z0-9#@!$%-_*]{8,})(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[#@!$%-_*]).*$/;
		// 검사
		var result = pattern.test(spw);
		// 결과로 처리
		if(result) {
			$(this).removeClass('w3-pale-red');
			$(this).addClass('w3-teal');
		} else {
			$(this).removeClass('w3-teal')
			$(this).addClass('w3-pale-red')
		}
		
	});
	
	// 버튼 이벤트 처리
	// 홈버튼
	$('#hbtn').click(function() {
		$(location).attr('href', '/cls/main.cls');
	});
	
	// 회원가입처리 버튼
	$('#jbtn').click(function() {
		var savt = $('.avt:checked').val();
		alert(savt);
		// 할 일
		// 데이터 유효성 검사
		var sid = $('#id').val();
		var spw = $('#pw').val();
		var sname = $('#name').val();
		var smail = $('#mail').val();
		var tel = $('#tel').val();
		var sgen = $('.gen:checked').val();
	
		if(!(sid && spw && sname && smail && tel && sgen && savt)) {
			return;
		}
		
		$('#frm').attr('method', 'post').attr('action', '/cls/member/joinProc.cls');
		
		$('#frm').submit();
	});
	
});