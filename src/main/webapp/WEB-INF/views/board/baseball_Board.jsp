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
<link rel="stylesheet" type="text/css" href="resources/css/top.css">

<link rel="stylesheet" media="only screen and (min-width:981px)">
<link rel="stylesheet" media="only screen and (max-width:980px)">


</head>
<body style="margin : 0 auto;">
<!----------------- TOP Start ----------------->
	<div id="topsearch">
		<a href="home"><img src="resources/image/logo_transparent.png"
			id="homelogo"></a>
		<div id="searchBar">
			<select name="searchType" id="searchType">
				<option value="football"
					<c:out value="${pageMaker.cri.searchType eq 'football' ? 'selected' : '' }" />>
					축구</option>
				<option value="baseball"
					<c:out value="${pageMaker.cri.searchType eq 'baseball' ? 'selected' : '' }" />>
					야구</option>
				<option value="basketball"
					<c:out value="${pageMaker.cri.searchType eq 'basketball' ? 'selected' : '' }" />>
					농구</option>
				<option value="tennis"
					<c:out value="${pageMaker.cri.searchType eq 'tennis' ? 'selected' : '' }" />>
					테니스</option>
				<option value="bicycle"
					<c:out value="${pageMaker.cri.searchType eq 'bicycle' ? 'selected' : '' }" />>
					자전거</option>
			</select> <input type="text" class="topsearch" id="keyword" name="keyword"
				value="${pageMaker.cri.keyword}">
			<button class="topsearch" id="searchBtn">확인</button>
		</div>
	</div>
	<ul id="topnavbar">
		<li class="topmenubar"><a href="football_Board">축구</a>
			<ul class="topmenubar2">
				<li><a href=football_Board>서울</a></li>
				<li><a href="#">경기도</a></li>
				<li><a href="#">성남</a></li>
				<li><a href="#">광주</a></li>
			</ul></li>
		<li class="topmenubar"><a href="baseball_Board">야구</a>
			<ul class="topmenubar2">
				<li><a href="#">서울</a></li>
				<li><a href="#">경기도</a></li>
				<li><a href="#">성남</a></li>
				<li><a href="#">광주</a></li>
			</ul>
		<li class="topmenubar"><a href="basketball_Board">농구</a>
			<ul class="topmenubar2">
				<li><a href="#">서울</a></li>
				<li><a href="#">경기도</a></li>
				<li><a href="#">성남</a></li>
				<li><a href="#">광주</a></li>
			</ul></li>
		<li class="topmenubar"><a href="#">자전거</a>
			<ul class="topmenubar2">
				<li><a href="#">서울</a></li>
				<li><a href="#">경기도</a></li>
				<li><a href="#">성남</a></li>
				<li><a href="#">광주</a></li>
			</ul></li>
		<li><a href="#">자유 게시판</a></li>
	</ul>
	<div id="blurlogin">
		<div id="blurbUp">광고판 이드아앙</div>
		<!----------------- TOP end ----------------->

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