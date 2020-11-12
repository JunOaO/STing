<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>야구게시판</title>
<script src="resources/jqLib/jquery-3.2.1.min.js"></script>
<script src="resources/jqLib/memberCheck.js"></script>

<link rel="stylesheet" type="text/css" href="resources/css/baseball_board.css">

<link rel="stylesheet" media="only screen and (min-width:981px)">
<link rel="stylesheet" media="only screen and (max-width:980px)">


</head>
<body>
<div class="bord_header">
	<div class="this_board">
	<button type="button" class="board_button" id="board_button" onclick="location.href='baseball_Board'">야구 게시판 </button>
	</div>
	<div class="board_title">
		<h3> STing 을 통해 </h3>
		<h3>운동 파트너를 찾아보세요.</h3>
	</div>
</div>
	<table id="boardView">
      <tr id="tr1">
         <td width="100px" class="td1" id="td1">글 번호</td>
         <td width="650px" class="td1">제목</td>
         <td width="100px" class="td1">닉네임</td>
         <td width="100px" class="td1">날짜</td>
         <td width="50px" class="td1">조회수</td>
      </tr>
      <c:forEach var="mm" items="${Banana}">
      	<tr align="center" height="30px">
      		<td>${mm.seq}</td>
      		<td class="title_over">
      		<c:if test="${logID != null}">
      		<a href="board_Detail?seq=${mm.seq}">[${mm.local}]&nbsp;${mm.title}</a>
      		</c:if>
			<c:if test="${logID == null}">
			[${mm.local}]&nbsp;${mm.title}
			</c:if>
			</td>
      		<td>${mm.nickname}</td>
      		<td>${mm.regdate}</td>
      		<td>${mm.cnt}</td>
      	</tr>
      </c:forEach>
   </table>
   <div class="btn_group">
		<div>
			<button type="button" class="input_button" id="login_btn2" onclick="location.href='home'">&nbsp;홈&nbsp;</button>
		</div>
   		<div>
			<button type="button" class="input_button" id="login_btn1" onclick="location.href='baseballf'">글쓰기</button>
		</div>
	</div>
</body>
</html>