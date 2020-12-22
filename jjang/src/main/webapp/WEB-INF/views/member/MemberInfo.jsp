<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInfo</title>
<link rel="stylesheet" type="text/css" href="/cls/css/w3.css">
<link rel="stylesheet" type="text/css" href="/cls/css/cls.css">
<script type="text/javascript" src="/cls/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/cls/js/memberInfo.js"></script>
<style type="text/css">
	img {
		border-radius: 100px;
	}
</style>
</head>
<body>
	<div class="mw750 w3-content w3-center">
		<h1 style="background-color: gold;">${mVO.name}님 회원 정보</h1>
		<div class="w3-col w3-border-bottom pdb10">
			<span class="w3-cell m2 w3-btn w3-pale-blue" id="home" >HOME</span>
			<span class="w3-cell m2 w3-btn w3-pale-green" id="drawal">Withdrawal</span>
			<span class="w3-cell m2 w3-btn w3-pale-yellow" id="edit" >Edit</span>
		</div>
		
		<form method="post" action="/cls/member/memberInfoDel.cls" id="dfrm" name="dfrm"
			style="display: none;" class="w3-col w3-care-4 w3-padding w3-margin-bottom">
			<label class="w3-col m3 w3-right-align w3-padding w3-text-grey">비밀번호 : </label>
			<input type="hidden" name="no" id="no" value="${mVO.mno}">
			<input type="password" id="pw" name="pw" class="w3-col m7 w3-input w3-border">
			<div class="w3-col m2 pdh10">			
				<span class="w3-col w3-btn w3-pale-blue" id="del" >탈퇴</span>
			</div>
				
		</form>
		<div class="w3-col w3-border">
			<div class="w3-col m3">
				<img src="/cls/img/avatar/${mVO.avatar}" style="width: 100%; height: 100%" id="oavt">

			</div>
			<div class="w3-col m9">
				<div class="w3-col">
					<label class="w3-col m3 w3-right-align w3-padding"> 회원번호 : </label>
					<div class="w3-col m9 w3-padding">${mVO.mno}</div>
				</div>
				<div class="w3-col ">
					<label class="w3-col m3 w3-right-align w3-padding"> 회원아이디 : </label>
					<div class="w3-col m9 w3-padding">${mVO.id}</div>
				</div>
				<div class="w3-col">
					<label class="w3-col m3 w3-right-align w3-padding"> 회원이름 : </label>
					<div class="w3-col m9 w3-padding">${mVO.name}</div>
				</div>
				<div class="w3-col">
					<label class="w3-col m3 w3-right-align w3-padding"> 회원메일 : </label>
					<div class="w3-col m9 w3-padding" id="omail">${mVO.mail}</div>
				</div>
				<div class="w3-col">
					<label class="w3-col m3 w3-right-align w3-padding"> 회원성별 : </label>
					<div class="w3-col m9 w3-padding" id="gen">
						<c:if test="${mVO.gen == 'M'}">
							남자
						</c:if>
						<c:if test="${mVO.gen == 'F'}">
							여자
						</c:if>
					</div>
				</div>
				<div class="w3-col">
					<label class="w3-col m3 w3-right-align w3-padding"> 가입날짜 : </label>
					<div class="w3-col m9 w3-padding">${mVO.sdate}</div>
				</div>
			</div>
		</div>
		<div class="w3-col w3-border-up pdb10">
			<span class="w3-cell m2 w3-btn w3-pale-red w3-right w3-margin" id="update">수정</span>
		</div>
		
		<form class="w3-col" id="frm" name="frm" style="display: none;">
			<div class="w3-col w3-border">
				<div class="w3-col">
					<label class="w3-col m3 w3-left">수정메일 : </label>
					<input type="text" class="w3-col m9 w3-input w3-border" id="mail" name="mail" placeholder="이메일을 입력하세요:">
				</div>
				<c:forEach var="data" items="${LIST}">
					<c:if test="${data.gen == mVO.gen}">
					
						<div class="w3-third w3-center w3-padding avt${data.gen}fr">
							<input type="radio" name="avt" class="w3-radio-medium w3-border avt" value="${data.ano}"><span>${data.ano}</span>
							<div class="w3-col imgbox w3-margin-top">
								<img src="/cls/img/avatar/${data.savename}" class="imgsrc">
							</div>
						</div>
					
					</c:if>
				</c:forEach>
			</div>
		</form>
	</div>
	
</body>
</html>