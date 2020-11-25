<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/css/newHome.css">
<script src="resources/jqLib/jquery-3.2.1.min.js"></script>
<script src="resources/jqLib/axST01.js"></script>


<link rel="stylesheet" media="only screen and (min-width:981px)">
<link rel="stylesheet" media="only screen and (max-width:980px)">


<title>Home</title>
<script>
	$(function() {
		$('#searchBtn').on("click",	function() {
					location.href = "sports"
							+ "${pageMaker.makeQuery(1)}"
							+ "?searchType=" + $('#searchType').val()
							+ "&keyword=" + $('#keyword').val();
				}); // click
	}); //ready
</script>
</head>
<body>
<header>
	<!----------------- TOP Start ----------------->
	<div id="img_wrap">
		<a href="home"><img src="resources/image/logo_transparent.png"
			id="homelogo"></a> <img src="resources/image/multi_sport_1.jpg"
			id="top_image">
	</div>
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
		<c:if test="${logID != null }">
			<button class="topsearch" id="searchBtn">확&nbsp;인</button>
		</c:if>
		<c:if test="${logID == null }">
			<button class="topsearch"
				onclick="javascript: alert('로그인 후 이용해 주세요.')">확&nbsp;인</button>
		</c:if>
	</div>
</header>
	<div id="topnavbar_wrap">
		<ul id="topnavbar">
			<li class="topmenubar"><a href="sports?sports=football">축구</a></li>
			<li class="topmenubar"><a href="sports?sports=baseball">야구</a></li>
			<li class="topmenubar"><a href="sports?sports=basketball">농구</a></li>
			<li class="topmenubar"><a href="sports?sports=tennis">테니스</a></li>
			<li class="topmenubar"><a href="sports?sports=bicycle">자전거</a></li>
			<li class="topmenubar" id="freeboard"><a href="#">자유 게시판</a></li>
			<c:if test="${logID == 'admin' }">
				<li class="topmenubar"><a href="list">회원 목록</a></li>
			</c:if>
		</ul>
	</div>
	<div id="blurlogin">
		<img id="blurbUp" alt="광고 자리" src="resources/image/amazone.jpg">
		<div id="loginbox">
			<c:if test="${ empty logID}">
				<button id="loginf">로 그 인</button>
				<br>
				<button id="bjoinf">회원가입</button>
			</c:if>
			<c:if test="${logID != null}">
				<p><img src="/////////////////수정할것////////////////(프로필)" onclick="location.href='detail?id=${logID}&sports='" width="60" height="60" id="logprofile"></p>
				<p id="login_after">${logID}<br>
				 ${logNickname}</p>
				<div id="logout_myinfo">	
					<button onclick="location.href='detail?id=${logID}&sports='" class="loginText">MyInfo</button>&nbsp;&nbsp; 
					<button onclick="location.href='logout'" class="loginText">LogOut</button>
				</div>
			</c:if>
		</div>
		<!--  로그인박스  -->
		<!----------------- TOP end ----------------->
	</div>

	<div id="main">
		<div class="newBoardDiv">
			<h2><a href="sports?sports=football" class="atag_board">축구 게시판</a></h2>
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
						<td class="title_over"><c:if test="${logID != null}">
								<a href="football_Detail?seq=${newFootBall.seq}&sports=football">[${newFootBall.local}][${newFootBall.team}]&nbsp;${newFootBall.title}&nbsp;[${newFootBall.repleCnt}]</a>
							</c:if> <c:if test="${logID == null}">
						[${newFootBall.local}][${newFootBall.team}]&nbsp;${newFootBall.title}
						</c:if></td>
						<td>${newFootBall.nickname}</td>
						<td>${newFootBall.regdate}</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div class="newBoardDiv">
			<h2><a href="sports?sports=baseball" class="atag_board">야구 게시판</a></h2>
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
						<td class="title_over"><c:if test="${logID != null }">
								<a href="baseball_Detail?seq=${newBaseball.seq}&sports=baseball">[${newBaseball.local}][${newBaseball.team}]&nbsp;${newBaseball.title}&nbsp;[${newBaseball.repleCnt}]</a>
							</c:if> <c:if test="${logID == null }">
						[${newBaseball.local}][${newBaseball.team}]&nbsp;${newBaseball.title}
						</c:if></td>
						<td>${newBaseball.nickname}</td>
						<td>${newBaseball.regdate}</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div class="newBoardDiv">
			<h2><a href="sports?sports=basketball" class="atag_board">농구 게시판</a></h2>
			<table>
				<tr>
					<th>번호</th>
					<th class="title">제목</th>
					<th class="nickname">닉네임</th>
					<th class="regdate">날짜</th>
				</tr>
				<c:forEach var="newBasketBall" items="${newBasketBall}" end="2">
					<tr align="center" height="30">
						<td>${newBasketBall.seq}</td>
						<td class="title_over"><c:if test="${logID != null }">
								<a
									href="basketball_Detail?seq=${newBasketBall.seq}&sports=basketball">[${newBasketBall.local}][${newBasketBall.team}]&nbsp;${newBasketBall.title}&nbsp;[${newBasketBall.repleCnt}]</a>
							</c:if> <c:if test="${logID == null }">
						[${newBasketBall.local}][${newBasketBall.team}]&nbsp;${newBasketBall.title}
						</c:if></td>
						<td>${newBasketBall.nickname}</td>
						<td>${newBasketBall.regdate}</td>
					</tr>

				</c:forEach>
			</table>
		</div>

		<div class="newBoardDiv">
			<h2><a href="sports?sports=tennis" class="atag_board">테니스 게시판</a></h2>
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
						<td class="title_over"><c:if test="${logID != null }">
								<a href="tennis_Detail?seq=${newTennis.seq}&sports=tennis">[${newTennis.local}][${newTennis.team}]&nbsp;${newTennis.title}&nbsp;[${newTennis.repleCnt}]</a>
							</c:if> <c:if test="${logID == null }">
						[${newTennis.local}][${newTennis.team}]&nbsp;${newTennis.title}
						</c:if></td>
						<td>${newTennis.nickname}</td>
						<td>${newTennis.regdate}</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div class="newBoardDiv">
			<h2><a href="sports?sports=bicycle" class="atag_board">자전거 게시판</a></h2>
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
						<td class="title_over"><c:if test="${logID != null }">
								<a href="bicycle_Detail?seq=${newBicycle.seq}&sports=bicycle">[${newBicycle.local}][${newBicycle.team}]&nbsp;${newBicycle.title}&nbsp;[${newBicycle.repleCnt}]</a>
							</c:if> <c:if test="${logID == null }">
						[${newBicycle.local}][${newBicycle.team}]&nbsp;${newBicycle.title}
						</c:if></td>
						<td>${newBicycle.nickname}</td>
						<td>${newBicycle.regdate}</td>
					</tr>

				</c:forEach>
			</table>
		</div>
	</div>
	<hr>
	<footer>
		<p id="footer_p">
			
			<br> Project Name : STing <br> Project Member : 윤성노 , 양호준 <br>
			project period : 2020.10.27 ~ 2020.11.30 <br>

		</p>
	</footer>
	<br>
	<br>
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
matching number(5),
partplay number(5),
profile varchar2(100),
leadermatching number(5));



create  table FootballBoard (    
seq number(5) primary key ,
id varchar2(20),
nickname varchar2(30),
title varchar2(200),
content varchar2(2000),
regdate date default sysdate,
team varchar2(20),
person number(5),
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
team varchar2(20),
person varchar2(20),
local varchar2(100),
map varchar2(1000),
sports varchar2(10),
cnt number(5) default 0,
image varchar2(100));


create  table basketballBoard (    
seq number(5) primary key ,
id varchar2(20),
nickname varchar2(30),
title varchar2(200),
content varchar2(2000),
regdate date default sysdate,
team varchar2(20),
person number(5),
local varchar2(100),
map varchar2(1000),
sports varchar2(10),
cnt number(5) default 0,
image varchar2(100));

create  table bicycleBoard (    
seq number(5) primary key ,
id varchar2(20),
nickname varchar2(30),
title varchar2(200),
content varchar2(2000),
regdate date default sysdate,
team varchar2(20),
person number(5),
local varchar2(100),
map varchar2(1000),
sports varchar2(10),
cnt number(5) default 0,
image varchar2(100));

create  table tennisBoard (    
seq number(5) primary key ,
id varchar2(20),
nickname varchar2(30),
title varchar2(200),
content varchar2(2000),
regdate date default sysdate,
team varchar2(20),
person number(5),
local varchar2(100),
map varchar2(1000),
sports varchar2(10),
cnt number(5) default 0,
image varchar2(100));


댓글
create table boardcomment(
seq number(10),
root number(10),
id varchar2(10),
nickname varchar2(10),
regdate date,
recontent varchar2(100),
profile varchar2(100));

create  table matchingboard (    
seq number(5) ,
leader_id varchar2(30),
matching_id varchar2(30)  primary key,
sports varchar2(20));

-->


