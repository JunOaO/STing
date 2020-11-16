<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/css/top.css">
<script src="resources/jqLib/jquery-3.2.1.min.js"></script>
<script src="resources/jqLib/axST01.js"></script>
<title>Home</title>
<style type="text/css">
#main {
	clear: both;
	border: 1px solid red;
}

#main>h4 {
	width: 800px;
	margin: 50px auto 100px;
	border: 1px solid blue;
}

</style>

<script>
	$(function() {
		$('#searchBtn').on("click", function() {
					location.href = "sports"
								  + "${pageMaker.makeQuery(1)}"
								  + "&searchType=" + $('#searchType').val()
								  + "&keyword=" + $('#keyword').val();
				}); // click
	}); //ready
</script>
</head>
<body>
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
	<div >
	<ul id="topnavbar">
		<li class="topmenubar"><a href="football_Board">축구</a></li>
		<li class="topmenubar"><a href="baseball_Board">야구</a></li>
		<li class="topmenubar"><a href="basketball_Board">농구</a></li>
		<li class="topmenubar"><a href="#">자전거</a></li>
		<li class="topmenubar" id="freeboard"><a href="#">자유 게시판</a></li>
		<c:if test="${logID == 'admin' }">
			<li class="topmenubar"><a href="list">회원 목록</a></li>
		</c:if>
	</ul>
	</div>
	<div id="blurlogin">
		<!-- <div> -->
		<img id="blurbUp" alt="광고 자리" src="resources/image/modify.gif">
		<!--</div>-->	
	<div id="loginbox">
			<c:if test="${ empty logID}">
				<span id="loginf">[로 그 인]</span>
				<br>
				<span id="bjoinf">[회원가입]</span>
			</c:if>
			<div id="resultAreaLogin"></div>
			<c:if test="${logID != null}">
					${logID}<br>${logNickname}<br>
				<a href="detail?id=${logID }" class="loginText">MyInfo</a>&nbsp;&nbsp; 
			<a href="logout" class="loginText">LogOut</a>&nbsp;&nbsp;
			</c:if>
	</div>
	<!--  로그인박스  -->
	<!----------------- TOP end ----------------->
	</div>

	<div id="main">
		<div id="blurbR">옆면 광고판 이드아앙</div>
		<div class="newBoardDiv">
			<h3>축구</h3>
			<table>
				<tr>
					<th>번호</th>
					<th class="title">제목</th>
					<th class="nickname">닉네임</th>
					<th class="regdate">날짜</th>
				</tr>
				<c:forEach var="newFootBall" items="${newFootBall}" end="2">
					<tr align="center" height="30">
						<td>${newFootBall.seq}</td>
						<td class="title_over">
						<c:if test="${logID != null}">
						<a href="board_Detail?seq=${newFootBall.seq}">[${newFootBall.local}][${newFootBall.team}]&nbsp;${newFootBall.title}</a>
						</c:if>
						<c:if test="${logID == null}">
						[${newFootBall.local}][${newFootBall.team}]&nbsp;${newFootBall.title}
						</c:if>
						</td>
						<td>${newFootBall.nickname}</td>
						<td>${newFootBall.regdate}</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div class="newBoardDiv">
			<h3>야구</h3>
			<table>
				<tr>
					<th>번호</th>
					<th class="title">제목</th>
					<th class="nickname">닉네임</th>
					<th class="regdate">날짜</th>
				</tr>
				<c:forEach var="newBaseball" items="${newBaseball}" end="2">
					<tr align="center" height="30">
						<td>${newBaseball.seq}</td>
						<td class="title_over">
						<c:if test="${logID != null }">
						<a href="board_Detail?seq=${newBaseball.seq}">[${newBaseball.local}][${newBaseball.team}]&nbsp;${newBaseball.title}</a>
						</c:if>
						<c:if test="${logID == null }">
						[${newBaseball.local}][${newBaseball.team}]&nbsp;${newBaseball.title}
						</c:if>
						</td>
						<td>${newBaseball.nickname}</td>
						<td>${newBaseball.regdate}</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div class="newBoardDiv">
			<h3>농구</h3>
			<table>
				<tr>
					<th>번호</th>
					<th class="title">제목</th>
					<th class="nickname">닉네임</th>
					<th class="regdate">날짜</th>
				</tr>
				<c:forEach var="newTennis" items="${newTennis}" end="2">
					<tr align="center" height="30">
						<td>${newBasketBall.seq}</td>
						<td class="title_over">
						<c:if test="${logID != null }">
						<a href="javascript:;">[${newBasketBall.local}][${newBasketBall.team}]&nbsp;${newBasketBall.title}</a>
						</c:if>
						<c:if test="${logID == null }">
						[${newBasketBall.local}][${newBasketBall.team}]&nbsp;${newBasketBall.title}
						</c:if>
						</td>
						<td>${newBasketBall.nickname}</td>
						<td>${newBasketBall.regdate}</td>
					</tr>

				</c:forEach>
			</table>
		</div>

		<div class="newBoardDiv">
			<h3>테니스</h3>
			<table>
				<tr>
					<th>번호</th>
					<th class="title">제목</th>
					<th class="nickname">닉네임</th>
					<th class="regdate">날짜</th>
				</tr>
				<c:forEach var="newTennis" items="${newTennis}" end="2">
					<tr align="center" height="30">
						<td>${newTennis.seq}</td>
						<td class="title_over">
						<c:if test="${logID != null }">
						<a href="javascript:;">[${newTennis.local}][${newTennis.team}]&nbsp;${newTennis.title}</a>
						</c:if>
						<c:if test="${logID == null }">
						[${newTennis.local}][${newTennis.team}]&nbsp;${newTennis.title}
						</c:if>
						</td>
						<td>${newTennis.nickname}</td>
						<td>${newTennis.regdate}</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div class="newBoardDiv">
			<h3>자전거</h3>
			<table>
				<tr>
					<th>번호</th>
					<th class="title">제목</th>
					<th class="nickname">닉네임</th>
					<th class="regdate">날짜</th>
				</tr>
				<c:forEach var="newBicycle" items="${newBicycle}" end="2">
					<tr align="center" height="30">
						<td>${newBicycle.seq}</td>
						<td class="title_over">
						<c:if test="${logID != null }">
						<a href="javascript:;">[${newBicycle.local}][${newBicycle.team}]&nbsp;${newBicycle.title}</a>
						</c:if>
						<c:if test="${logID == null }">
						[${newBicycle.local}][${newBicycle.team}]&nbsp;${newBicycle.title}
						</c:if>
						</td>
						<td>${newBicycle.id}</td>
						<td>${newBicycle.regdate}</td>
					</tr>

				</c:forEach>
			</table>
		</div>
	</div>
	<hr>
	<footer> css 어려워 싫다아 </footer>
</body>
</html>


















<!-- 
create  table STmember (    
id varchar2(30) primary key ,
password varchar2(30),
name varchar2(30),
nickname varchar2(30),
email varchar2(100),
birthd date ,
gender varchar2(10),
matching varchar2(5),
partplay varchar2(5),
profile varchar2(100)
);



create  table FootballBoard (    
seq number(5) primary key ,
id varchar2(20),
nickname varchar2(30),
title varchar2(200),
content varchar2(2000),
regdate date default sysdate,
team number(3),
person number(3),
local varchar2(100),
map varchar2(1000),
sports varchar2(10),
cnt number(5) default 0,
image varchar2(100));

create  table BaseballBoard (    
seq number(5) primary key ,
id varchar2(20),
nickname varchar2(30),
title varchar2(200),
content varchar2(2000),
regdate date default sysdate,
team number(3),
person number(3),
local varchar2(100),
map varchar2(1000),
sports varchar2(10),
cnt number(5) default 0,
image varchar2(100));


create  table basketballBoard (    
seq number(5) primary key ,
id varchar2(20),
title varchar2(200),
content varchar2(2000),
regdate date default sysdate,
local varchar2(100),
map varchar2(1000),
sports varchar2(10),
reple varchar2(100),
cnt number(5) default 0,
image varchar2(100));

create  table bicycleBoard (    
seq number(5) primary key ,
id varchar2(20),
title varchar2(200),
content varchar2(2000),
regdate date default sysdate,
local varchar2(100),
map varchar2(1000),
sports varchar2(10),
reple varchar2(100),
cnt number(5) default 0,
image varchar2(100));-->

