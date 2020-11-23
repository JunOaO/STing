<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

</head>
<body>

		<div id="STing">STing</div>      
		<h1>회원정보</h1>
		<p><img src="${myInfo.profile}" width="90" height="90" id="logprofile"></p> <%-- onclick="location.href='detail?id=${myInfo.profile}&code=P'" --%>
		<p id="logid">${logID}</p>
		
		
		<div id="div_all">
			<div id="div_all2">
				
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
        
<%-- 
		<div id="div_button">
         
 		 <!-- admin 로그인일 경우 -->	
         <c:if test="${logID =='admin' }">
            <a href="delete" id="button_out" onclick="if(!confirm('정말 탈퇴 하시겠습니까?')){return false;}">강제탈퇴</a>
            <input type="button" id="admin_update" value="수정"  onclick="location.href='home'">
         </c:if>
         
         <!-- 일반아이디 로그인일 경우 -->
         <c:if test="${logID != 'admin' }">
            <a href="delete" id="button_out" onclick="if(!confirm('정말 탈퇴 하시겠습니까?')){return false;}">회원탈퇴</a>
            <input type="button" id="button_update" value="수정"  onclick="location.href='update'">
         </c:if>
      </div> --%>


	  <div id="div_button">
         <button style="width: 40px; height: 30px; ">닫기</button>
      </div>

	
</body>
</html>