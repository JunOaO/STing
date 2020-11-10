<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/jqLib/top.css">
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
		$('#searchBtn').on("click",	function() {
			location.href = "sports"
						  + "${pageMaker.makeQuery(1)}"
						  + "&searchType=" + $('#searchType').val()
						  + "&keyword=" + $('#keyword').val();
				}); // click

		/* if (${logout} == true) {
			location.href = "home";
		}// logout시 home 이동*/ 
	}); //ready

window.onload = function() {
	Newbaseball();
}

function Newbaseball() {
	location.href = "baseball_NewBoard";
}

</script>
</head>
<body>
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

		<div class="loginbox">
			<c:if test="${ empty logID}">
				<span id="loginf">[로 그 인]</span>
				<br>
				<span id="bjoinf">[회원가입]</span>
			</c:if>
			<div id="resultAreaLogin"></div>
			<c:if test="${logID != null}">
					${logID}, ${logName}<br>
				<a href="detail?id=${logID }" class="loginText">MyInfo</a>&nbsp;&nbsp; 
			<a href="logout" class="loginText">LogOut</a>&nbsp;&nbsp;
			</c:if>
		</div>
		<!--  로그인박스  -->
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
				<%-- <c:forEach var="flist" items="${football}"> --%>
					<tr align="center" height="30">
						<%-- <td>${flist.seq}</td>
						<td>${flist.title}</td>
						<td>${flist.id}</td>
						<td>${flist.regdate}</td> --%>
						<td>1</td>
						<td>2</td> 
						<td>3</td>
						<td>4</td> 
					</tr>
				
				<%-- </c:forEach> --%>
			</table>
		</div>

		<div class="newBoardDiv">
			<h3>야구</h3>
			<table onload="return baseball_NewBoard()">
				<tr>
					<th>번호</th>
					<th class="title">제목</th>
					<th class="nickname">닉네임</th>
					<th class="regdate">날짜</th>
				</tr>
				<c:forEach var="Newbaseball" items="${Newbaseball}" end="3">
					<tr align="center" height="30">
						<td>${Newbaseball.seq}</td>
						<td>${Newbaseball.title}</td>
						<td>${Newbaseball.nickname}</td>
						<td>${Newbaseball.regdate}</td>
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
				<%-- <c:forEach var="flist" items="${football}"> --%>
					<tr align="center" height="30">
						<%-- <td>${flist.seq}</td>
						<td>${flist.title}</td>
						<td>${flist.id}</td>
						<td>${flist.regdate}</td> --%>
						<td>1</td>
						<td>2</td> 
						<td>3</td>
						<td>4</td> 
					</tr>
				
				<%-- </c:forEach> --%>
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
				<%-- <c:forEach var="flist" items="${football}"> --%>
					<tr align="center" height="30">
						<%-- <td>${flist.seq}</td>
						<td>${flist.title}</td>
						<td>${flist.id}</td>
						<td>${flist.regdate}</td> --%>
						<td>1</td>
						<td>2</td> 
						<td>3</td>
						<td>4</td> 
					</tr>
				
				<%-- </c:forEach> --%>
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
image varchar2(100));















 -->