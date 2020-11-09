<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** ID 중복 체크 **</title>
<script src="resources/jqLib/jquery-3.2.1.min.js"></script>
<script src="resources/jqLib/memberCheck.js"></script>
<link rel="shortcut icon" href="resources/image/school-bell.png" >
<link rel="stylesheet" type="text/css" href="resources/jqLib/myStyle.css" >
<script>
	/* function idDupCheck(){
		=>1단계
		if(idCheck()) return true;
		else return false; 
		
		=>2단계 memberCheck.js 필요
		return idCheck();
		
		=>3단계
		submit에 직접 적용해도 됨
		
	} //idCheck() */
	
	//2단계적용
	
	
	function idOk(){
		opener.document.getElementById('id').value='${newId}';
		//joinForm 의 submit 활성화
		opener.document.getElementById('submit').disabled='';
		opener.document.getElementById('idDup').disabled='disabled';
		opener.$('#id').attr('readonly','readonly');
		// opener.$('#id').prop('readonly',true);
		opener.$('#password').focus();
		self.close();
	} //idOk()
</script>
<style>
	body{   
  		background-color: #E6E6FA ;
  		font-family: 맑은고딕;
		}
	#wrap{     
 		margin-left: 0;
 		text-align: center;
		 }
	h3 {
 		/* font-family: 맑은고딕, Times, serif; */
	  	font-size: 30px;
  		color: #00008B;
  		font-weight: normal;
		}
/* 	input[type=button], input[type=submit] {
  		float: right;
	} */
</style>
</head>
<body>
<div id="wrap">
	<h3>** ID 중복 확인  **</h3>
	<form action="idDupCheck" method="post">
		UserID : 
		<input type="text" name="id" id="id" value="">
		<input type="submit" value="ID중복확인" onclick="return idCheck()"><br>
		<span id="idMessage" class="message"></span>	
	</form>
	<br><br><hr><br>
	<div id="msgBlock">
		<c:if test="${idUse=='T'}">
			${newId} 는 사용가능 합니다.
			<input type="button" value="ID OK" onclick="idOk()">
			<!-- idOk() : 입력한 Id 값을 사용가능하도록 해주고 현재(this)창은 close -->
			
		</c:if>
		<c:if test="${idUse=='F'}">
			${newId} 는 이미 존재하는 아이디입니다.<br>
			다시 입력해 주세요.
			<!--부모창(joinForm)에 입력값(남아있는 id)을 지워주고,
				현재창(this)의 id 에 focus를 준다.=> JS 코드 필요함.   -->
			<script>
					$('#id').focus();
					opnner.document.getElementById('id').value='';
			</script>
		</c:if>
	</div>
	
</div>
</body>
</html>