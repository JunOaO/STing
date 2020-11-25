<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="resources/jqLib/jquery-3.2.1.min.js"></script>
<script src="resources/jqLib/memberCheck.js"></script>
<script src="resources/jqLib/axST01.js"></script>

<link rel="stylesheet" type="text/css" href="resources/css/loginForm.css">

<script>
	//1) 개별적 오류 확인을 위한 switch 변수 정의
	var iCheck = false;
	var pCheck = false;

	$(function() {
		// ID : 길이, 영문자,숫자 로만 구성
		$('#id').focusout(function() {
			iCheck = idCheck();
		}); // id_focusout

		// Password : 길이(4 이상), 숫자와 특수문자는 반드시 1개 이상 포함할것
		// => 특수문자 : HTML 특수문자 리스트표 참고 (http://kor.pe.kr/util/4/charmap2.htm)
		$('#password').focusout(function() {
			pCheck = pwCheck();
		}); // password
			
	}); // ready

	function inCheck() {
		// if (id,password,name 오류가 없으면)
		if (iCheck == false) {
			$('#idMessage').html('ID 를 확인 하세요 ~~');
			$('#id').focus();
		} // inCheck

		if (pCheck == false) {
			$('#pwMessage').html('Passsword 를 확인 하세요 ~~');
			$('#password').focus();
		}
		if (iCheck == true && pCheck == true)
			return true;
		else {
			alert('입력 오류 확인을 하지 않은 항목이 있습니다. 확인 후 전송 하세요~~ ');
			return false;
		} // else
	} // inCheck()
	
	function size(){
		var width = window.innerWidth;
		var height = window.innerHeight;
		width = 855;
		height = 840;
		
		window.resizeTo(width, height);
	}
</script>

<title>Insert title here</title>
</head>
<body>
	<form action="login" method="post">
	<div class="logo">
		<img src="resources/image/logo_transparent.png" class="logo">
	</div>
	<div id="div_input">
		<div id="div_input_id">
			<input type="text" name="id" id="id" class="" placeholder="ID 입력">
			<span id="idMessage" class="Message"></span>
		</div>	
		
		<div id="div_input_pw">
			<input type="password" name="password" id="password" placeholder="PW 입력"> 
			<span id="pwMessage" class="Message"></span>
		</div>
		
		<div id="div_button_login">
			<button type="submit" id="btn_login">로그인</button>	
		</div>
		<div class="join">
			<button id="btn_join"><a href="bjoinf" onclick="size()">회원가입</a></button>
			<button><a href="#">ID/PW 찾기</a></button>
		</div>
	</div>
	</form>
	<c:if test="${loginSuccess=='T' }">
		<script>
			opener.location.reload();
			self.close();
		</script>
	</c:if>

	<c:if test="${loginSuccess !='T' }">
		${id} ${message}<br>
	</c:if>
</body>
</html>