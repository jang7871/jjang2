<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1st JSP 파일</title>
<link rel="stylesheet" type="text/css" href="/jjs/css/w3.css">
<link rel="stylesheet" type="text/css" href="/jjs/css/cls.css">
<script type="text/javascript" src="/jjs/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/jjs/js/main.js"></script>
<script type="text/javascript">
	
</script>
<style type="text/css">
	h5 {
		height: 20px;
		line-height: 30%;
	}
	
	.pdh10 > h5 {
		font-size: 10.5px;
	}
</style>
</head>
<body>
	<form action="post" action="/cls/member/memberInfo.cls" id="frm">
		<input type="hidden" id="id" name="id" value="${SID}">
	</form>
	<div class="mw700 w3-content w3-center">
		<h1 class="w3-pale-red w3-padding">CLS Project</h1>
		<div class="w3-col w3-padding w3-margin-top">
			<c:if test="${empty sessionScope.SID}">
				<h5 class="w3-col m2 w3-btn w3-small w3-pale-blue w3-hover-blue w3-left" id="jbtn">Join</h5>
				<h5 class="w3-col m2 w3-btn w3-small w3-pale-yellow w3-hover-yellow w3-right" id="lbtn">Login</h5>
			</c:if>
<%-- 			<c:if test="${not empty sessionScope.SID}"> --%>
				<div class="w3-col" id="btnfr">
					<div class="w3-col w3-border-bottom">
						<h5 class="w3-cell w3-btn w3-pale-green w3-hover-green w3-left" id="ibtn">회원정보</h5>						
						<h5 class="w3-cell w3-btn w3-pale-red w3-hover-red w3-right" id="obtn">Logout</h5>						
					</div>
					
					<div class="w3-col w3-margin-top mt10">
						<div class="w3-col m3 pdh10">
							<h5 class="w3-col m11 w3-btn w3-pale-blue w3-hover-blue" id="gbtn">방명록</h5>
						</div>
						<div class="w3-col m3 pdh10">
							<h5 class="w3-col m11 w3-btn w3-pale-green w3-hover-green" id="sbtn">설문조사</h5>
						</div>
						<c:if test="${RCNT != 0}">
							<div class="w3-col m3 pdh10">
								<h5 class="w3-col m11 w3-btn w3-pale-blue w3-hover-blue w3-right" id="irbtn">댓글쓰기</h5>
							</div>
						</c:if>
						<div class="w3-col m3 pdh10">
							<h5 class="w3-col m11 w3-btn w3-pale-yellow w3-hover-yellow w3-right" id="rbtn">댓글게시판</h5>
						</div>
						<div class="w3-col m3 pdh10">
							<h5 class="w3-col m11 w3-btn w3-pale-red w3-hover-red w3-right" id="fbtn">파일게시판</h5>
						</div>
					</div>
				</div>
<%-- 			</c:if> --%>
		</div>
	</div>
</body>
</html>