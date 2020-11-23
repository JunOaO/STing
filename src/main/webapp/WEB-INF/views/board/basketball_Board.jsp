<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>농구게시판</title>
<script src="resources/jqLib/jquery-3.2.1.min.js"></script>
<script src="resources/jqLib/memberCheck.js"></script>

<link rel="stylesheet" type="text/css"
	href="resources/css/baseball_board.css">
<link rel="stylesheet" type="text/css" href="resources/css/top.css">

<link rel="stylesheet" media="only screen and (min-width:981px)">
<link rel="stylesheet" media="only screen and (max-width:980px)">

<script>
	$(function() {
		$('#searchBtn').on("click",	function() {
			  location.href = "sports" + "${pageMaker.makeQuery(1)}"
							+ "&searchType="
							+ $('#searchType').val()
							+ "&keyword="
							+ $('#keyword').val();
				}); // click
	}); //ready
</script>
</head>
<body style="margin: 0 auto;">
	<!----------------- TOP Start ----------------->
	<div id="topsearch">
		<a href="home"><img src="resources/image/logo_transparent.png"
			id="homelogo"></a>
		<img alt="제리 인사 하는 짤" src="resources/image/jerryInsa.gif" style="height: 150px; width: 500px; margin: 25px 0;">
			
	</div>
	<ul id="topnavbar">
		<li class="topmenubar"><a href="football_Board">축구</a></li>
		<li class="topmenubar"><a href="baseball_Board">야구</a></li>
		<li class="topmenubar"><a href="basketball_Board">농구</a></li>
		<li class="topmenubar"><a href="#">테니스</a></li>
		<li class="topmenubar"><a href="#">자전거</a></li>
		<li class="topmenubar" id="freeboard"><a href="#">자유 게시판</a></li>
		<c:if test="${logID == 'admin' }">
			<li class="topmenubar"><a href="list">회원 목록</a></li>
		</c:if>
	</ul>
	<div id="blurlogin">
		<div><img id="blurbUp" alt="광고 자리" src="resources/image/modify.gif"></div>
	</div>
	<!----------------- TOP end ----------------->

	<div class="bord_header">
		<div class="this_board">
			<button type="button" class="board_button" id="board_button"
				onclick="location.href='basketball_Board'">농구 게시판</button>
		</div>
		<div class="board_title">
			<h3>STing 을 통해</h3>
			<h3>운동 파트너를 찾아보세요.</h3>
		</div>
		<div id="searchBar">
			<select name="searchType" id="searchType" hidden="hidden">
				<option value="football"
					<c:out value="${pageMaker.cri.searchType eq 'football' ? 'selected' : '' }" />>
					농구</option>
			</select>
			<input type="text" class="baseballsearch" id="keyword" name="keyword" value="${pageMaker.cri.keyword}">
			<button id="searchBtn">확인</button>
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
				<%-- <c:if test="${logID != null}"> --%>
				<c:if test="${logID != null }">
						<a href="board_Detail?seq=${mm.seq}">[${mm.local}][${mm.team}]&nbsp;${mm.title}</a>
				</c:if>
				<c:if test="${logID == null }">
						<a href="javascript:;" onclick="javascript: alert('로그인 후 이용해 주세요.');">[${mm.local}][${mm.team}]&nbsp;${mm.title}</a>
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
			<button type="button" class="input_button" id="login_btn2"
				onclick="location.href='home'">&nbsp;홈&nbsp;</button>
		</div>
		<div>
			<button type="button" class="input_button" id="login_btn1"
				onclick="location.href='baseballf'">글쓰기</button>
		</div>
	</div>
</body>
</html>