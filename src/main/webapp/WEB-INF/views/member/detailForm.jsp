<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>DetailForm</title>
<script src="resources/jqLib/jquery-3.2.1.min.js"></script>
<script src="resources/jqLib/memberCheck.js"></script>
<link rel="stylesheet" media="only screen and (min-width:981px)">
<link rel="stylesheet" media="only screen and (max-width:980px)">

<link rel="stylesheet" type="text/css" href="resources/css/detailForm.css">
<script>
$(function() {
	$('#logprofile').on("click",function(){
		window.open("logprofile"+"?id=${myInfo.id}","_blank",
        "toolbar=no,menubar=yes,scrollbars=yes,resizable=yes,width=500,height=400");	
	});
});
</script>
</head>
<body>


	<form action="insert" method="post">
		<div id="STing"><a href="home">STing</a></div>      
		<h1>내 정 보</h1>
		<p><img src="${myInfo.profile}" width="90" height="90" id="logprofile"></p> <%-- onclick="location.href='detail?id=${myInfo.profile}&code=P'" --%>
		<p id="logid">${logID}</p>
		<div style="width:300px; margin: 0 auto;">
		<c:if test="${matchingTitle.seq != null }">
		종 목 : ${matchingTitle.sports}<br>
		번 호 : ${matchingTitle.seq}<br>
		제 목 : ${matchingTitle.title}<br>
		신청중 입니다.
		</c:if>
		</div>
		
		<div id="div_all">
			<div id="div_all2">
				<div>
					<div id="div_id" class="div_culomn">아이디</div>
					<div id="div_infoid" class="div_info">${myInfo.id}</div>
				</div>
				<div>
					<div id="div_pw" class="div_culomn">비밀번호</div>
					<div id="div_infopw" class="div_info">${myInfo.password}</div>
				</div>
				<div>
					<div id="div_pw" class="div_culomn">이름</div>
					<div id="div_infopw" class="div_info">${myInfo.name}</div>
				</div>
				<div>
					<div id="div_pw" class="div_culomn">닉네임</div>
					<div id="div_infopw" class="div_info">${myInfo.nickname}</div>
				</div>
				<div>
					<div id="div_pw" class="div_culomn">이메일</div>
					<div id="div_infopw" class="div_info">${myInfo.email}</div>
				</div>
				<div>
					<div id="div_pw" class="div_culomn">생년월일</div>
					<div id="div_infopw" class="div_info">${myInfo.birthd}</div>
				</div>
				<div>
					<div id="div_pw" class="div_culomn">성별</div>
					<div id="div_infopw" class="div_info">${myInfo.gender}</div>
				</div>
				<div>
					<div id="div_pw" class="div_culomn">매칭신청횟수</div>
					<div id="div_infopw" class="div_info">${myInfo.matching}</div>
				</div>
				<div>
					<div id="div_pw" class="div_culomn">매칭결과회수</div>
					<div id="div_infopw" class="div_info">${myInfo.partyplay}</div>
				</div>
			</div>
		</div>
        
	  <div id="div_button">
         <input type="button" id="button_update" value="수정"  onclick="location.href='detail?id=${myInfo.id}&code=U&sports=${matchingTitle.sports}'">
         <c:if test="${logID =='admin' }">
                  	<input type="button" id="button_update" value="수정"  onclick="location.href='detail?id=${myInfo.id}&code=U'">
            <a href="delete?id=${myInfo.id}" class="button_out" onclick="if(!confirm('정말 탈퇴 하시겠습니까?')){return false;}">강제탈퇴</a>
         </c:if>
         <c:if test="${logID != 'admin' }">
         <input type="button" id="button_update" value="수정"  onclick="location.href='detail?id=${myInfo.id}&code=U'">
            <a href="delete" class="button_out" onclick="if(!confirm('정말 탈퇴 하시겠습니까?')){return false;}">회원탈퇴</a>
         </c:if>
      </div>

	</form>
</body>
</html>