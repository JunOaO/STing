<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/jqLib/top.css">
<title>Home</title>
<style type="text/css">
#main {
	border: 1px solid red;
}

#main>h4 {
	width: 800px;
	margin: 50px auto 100px;
	border: 1px solid blue;
}
</style>

</head>
<body>
	<form action="">
		<div id="topsearch">
			<a href="home"><img src="resources/image/logo_transparent.png"></a>
			<input type="text" class="topsearch"> <input type="button"
				value="확인" class="topsearch">
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
		<div id="blurbUp">광고판 이드아앙</div>
		<div id="login">
			<input type="text" placeholder="ID 입력" id="loginID"> <input
				type="password" placeholder="PW 입력" id="loginPW"> <input
				type="submit" value="로그인" id="loginBT">
			<div class="join">
				<a href="bjoinf">회원가입</a>&nbsp;&nbsp; <a href="#">ID/PW 찾기</a>
			</div>
		</div>
		<div id="main">
			<div id="blurbR">옆면 광고판 이드아앙</div>
			<h4>축구</h4>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>닉네임</th>
				<th>날짜</th>
			</tr>
			<c:forEach var="flist" items="${football}">
				<tr align="center" height="30">
					<td>${flist.seq}</td>
					<td>${flist.title}</td>
					<td>${flist.id}</td>
					<td>${flist.regdate}</td>
				</tr>
			</c:forEach>
			<h4>야구</h4>
			<h4>농구</h4>
			<h4>자전거</h4>
		</div>
	</form>
	<hr>
	<footer> css 어려워 싫다아 </footer>
</body>
</html>


















<!-- 
create  table STmember (    
id varchar2(30) primary key ,
password varchar2(30),
nickname varchar2(30),
name varchar2(30),
email varchar2(100),
gender varchar2(10),
birthd date ,
matching varchar2(5),
partplay varchar2(5), 
profile varchar2(100)
);



create  table FootballBoard (    
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

create  table BaseballBoard (    
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