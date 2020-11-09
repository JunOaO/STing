<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="resources/jqLib/top.css">
<link rel="stylesheet" type="text/css" href="resources/jqLib/Board.css">
<title>축구게시판</title>
<script src="resources/jqLib/jquery-3.2.1.min.js"></script>
<script src="resources/jqLib/memberCheck.js"></script>
<link rel="stylesheet" media="only screen and (min-width:981px)">
<link rel="stylesheet" media="only screen and (max-width:980px)">
</head>
<body>
	<!-- top start -->
	<div id="topsearch">
		<a href="home"><img src="resources/image/logo_transparent.png" id="homelogo"></a>
		<input type="text" class="topsearch"> <input type="button"
			value="확인" class="topsearch">
		<ul id="topnavbar">
			<li class="topmenubar"><a href="football_Board">축구</a>
				<ul class="topmenubar2">
					<li><a href="stBoard">서울</a></li>
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
			<li class="topmenubar">자전거
				<ul class="topmenubar2">
					<li><a href="#">서울</a></li>
					<li><a href="#">경기도</a></li>
					<li><a href="#">성남</a></li>
					<li><a href="#">광주</a></li>
				</ul>
			</li>
			<li><a href="#">자유 게시판</a></li>
			</ul>
	</div>
	<div id="blurbUp">광고판 이드아앙</div>
	<!-- top end -->

	<div class="bord_header">
		<div class="this_board">
			<button type="button" class="board_button" id="board_button"
				onclick="location.href='football_Board'">축구 게시판</button>
		</div>
		<div class="board_title">
			<h3>STing 을 통해</h3>
			<h3>운동 파트너를 찾아보세요.</h3>
		</div>
	</div>
	<table board="0" id="boardView">

		<tr id="tr1">
			<td width="100px" class="td1" id="td1">글 번호</td>
			<td width="700px" class="td1">제목</td>
			<td width="100px" class="td1">닉네임</td>
			<td width="100px" class="td1">날짜</td>
			<td width="50px" class="td1">조회수</td>
		</tr>
		<c:forEach var="football" items="${sports}">
			<tr align="center" height="30px">
				<td>${football.seq}</td>
				<td>${football.title}</td>
				<td>${football.nickname}</td>
				<td>${football.regdate}</td>
				<td>${football.cnt}</td>
			</tr>
		</c:forEach>
	</table>
	<div class="btn_group">
		<button type="button" class="input_button" id="login_btn1"
			onclick="location.href='binsertf'">글쓰기</button>
	</div>
	<div class="btn_group">
		<button type="button" class="input_button" id="login_btn2"
			onclick="location.href='home'">&nbsp;홈&nbsp;</button>
	</div>
</body>
</html>