$(document).ready(function() {
	
	$('#btn1').click(function() {
		$(location).attr('href', '/cls/main.cls');
	});
	
	$('#btn2').click(function() {
		// 할 일
		// 1. 입력한 데이터 읽기.
		// 2. 
		// 데이터 읽고
		var tid = $('#id').val();
		var tpw = $('#pw').val();
		
		if(!(tid && tpw)) {
			return;
		}
		
		$('#frm').submit();
	})
});