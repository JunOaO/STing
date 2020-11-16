<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>joinForm</title>
<script src="resources/jqLib/jquery-3.2.1.min.js"></script>
<script src="resources/jqLib/memberCheck.js"></script>
<link rel="stylesheet" media="only screen and (min-width:981px)">
<link rel="stylesheet" media="only screen and (max-width:980px)">

<link rel="stylesheet" type="text/css"
	href="resources/css/detailForm.css">

</head>
<body>


	<form action="insert" method="post">

		<p>STing</p>
		<h1>내 정 보</h1>
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
         <input type="button" id="button_home" value="홈"  onclick="location.href='home'">
         <!-- <input type="button" id="button_out" value="회원탈퇴1" onclick="location.href='delete'"> -->
         <c:if test="${logID =='admin' }">
            <a href="delete?id=${myInfo.id}" id="button_out" onclick="if(!confirm('정말 탈퇴 하시겠습니까?')){return false;}">회원탈퇴</a>
         </c:if>
         <c:if test="${logID != 'admin' }">
            <a href="delete" id="button_out" onclick="if(!confirm('정말 탈퇴 하시겠습니까?')){return false;}">회원탈퇴</a>
         </c:if>
      </div>
	</form>
</body>
</html>