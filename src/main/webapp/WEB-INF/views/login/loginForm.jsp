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
<style>
.join {
	clear: left;
}

.join>a {
	font-size: 10px;
}

.logo {
	width : 200px;
	margin: 0 auto;
}

.logintext {
	margin: 0 auto;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<form action="login" method="post">
	<div class="logo">
		<img src="resources/image/logo_transparent.png" width="200px" height="200px;" class="logo">
	</div>
		<table class="logintext">
			<tr>
				<td><label for="id">I D:</label></td>
				<td><input type="text" name="id" id="id" placeholder="ID 입력"><br>
					<span id="idMessage" class="Message"></span></td>
			</tr>
			<tr>
				<td><label for="pw">P W:</label></td>
				<td><input type="password" name="password" id="password"
					placeholder="PW 입력"><br> <span id="pwMessage"
					class="Message"></span></td>

			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Login" id="login" class="logintext">
					<div class="join">
						<a href="bjoinf" onclick="size()">회원가입</a>&nbsp;&nbsp; <a href="#">ID/PW 찾기</a>
					</div></td>
			</tr>
		</table>
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