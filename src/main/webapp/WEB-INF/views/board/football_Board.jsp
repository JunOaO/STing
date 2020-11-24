<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>축구게시판</title>
<script src="resources/jqLib/jquery-3.2.1.min.js"></script>
<script src="resources/jqLib/memberCheck.js"></script>
<script src="resources/jqLib/axST01.js"></script>

<link rel="stylesheet" type="text/css"
	href="resources/css/sports_board.css">
<link rel="stylesheet" type="text/css" href="resources/css/top.css">

<link rel="stylesheet" media="only screen and (min-width:981px)">
<link rel="stylesheet" media="only screen and (max-width:980px)">

<script>
	$(function() {
		$('#searchBtn').on(
				"click",
				function() {
					location.href = "sports" + "${pageMaker.makeQuery(1)}"
							+ "&searchType=" + $('#searchType').val()
							+ "&keyword=" + $('#keyword').val();
				}); // click
	}); //ready
</script>
</head>
<body style="margin: 0 auto;">
	<!----------------- TOP Start ----------------->
	<div id="topsearch">
		<a href="home"><img src="resources/image/logo_transparent.png"
			id="homelogo"></a> <img alt="제리 인사 하는 짤"
			src="resources/image/jerryInsa.gif"
			style="height: 150px; width: 500px; margin: 25px 0;">

	</div>
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
	<div id="blurlogin">
		<div>
			<img id="blurbUp" alt="광고 자리" src="resources/image/modify.gif">
		</div>
	</div>
	<!----------------- TOP end ----------------->

	<div class="bord_header">
		<div class="this_board">
			<button type="button" class="board_button" id="board_button"
				onclick="location.href='football_Board?sports=football'">축구
				게시판</button>
		</div>
		<div class="board_title">
			<h3>STing 을 통해</h3>
			<h3>운동 파트너를 찾아보세요.</h3>
		</div>
		<div id="searchBar">
			<select name="searchType" id="searchType" hidden="hidden">
				<option value="football"
					<c:out value="${pageMaker.cri.searchType eq 'football' ? 'selected' : '' }" />>
					축구</option>
			</select> <input type="text" class="footballsearch" id="keyword"
				name="keyword" value="${pageMaker.cri.keyword}">
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
					<%-- <c:if test="${logID != null}"> --%> <c:if
						test="${logID != null }">
						<a href="football_Detail?seq=${mm.seq}&sports=football">[${mm.local}][${mm.team}]&nbsp;${mm.title}</a>
					</c:if> <c:if test="${logID == null }">
						<a href="javascript:;"
							onclick="javascript: alert('로그인 후 이용해 주세요.');">[${mm.local}][${mm.team}]&nbsp;${mm.title}</a>
					</c:if>
				</td>
				<td>${mm.nickname}</td>
				<td>${mm.regdate}</td>
				<td>${mm.cnt}</td>
			</tr>
		</c:forEach>
	</table>
	<hr>
	
	<div align="center">
		<!-- 1) First <<, Prev < : enabled 여부 -->
		<c:if test="${pageMaker.prev && pageMaker.sPageNo>1}">
			<a href="sports${pageMaker.searchmakeQuery(1)}&sports=football">처음</a>&nbsp;
		    <a href="sports${pageMaker.searchmakeQuery(pageMaker.sPageNo -1)}&sports=football">이전</a>&nbsp;
      </c:if>
		<!-- 2) sPage ~ ePage까지 perPageNo값 만큼 출력 -->
		<c:forEach var="i" begin="${pageMaker.sPageNo}"
			end="${pageMaker.ePageNo}">
			<c:if test="${i==pageMaker.cri.currPage}">
				<font size="5" color="Orange">${i}&nbsp;</font>
			</c:if>
			<c:if test="${i!=pageMaker.cri.currPage}">
				<a href="sports${pageMaker.searchmakeQuery(i)}&sports=football">${i }</a>
			</c:if>
			
			<%-- <c:out value="${pageMaker.cri.currpage==i ? 'class=active' : '' }">
         </c:out> --%>
         
		</c:forEach>
		<c:if test="${pageMaker.next && pageMaker.ePageNo >0}">
			<a href="sports${pageMaker.searchmakeQuery(pageMaker.ePageNo+1)}&sports=football">&nbsp;다음</a>&nbsp;
		<a href="sports${pageMaker.searchmakeQuery(pageMaker.lastPageNo)}&sports=football">마지막</a>
		</c:if>
	</div>
	
	<div class="btn_group">
		<div>
			<button type="button" class="input_button" id="login_btn2"
				onclick="location.href='home'">&nbsp;홈&nbsp;</button>
		</div>
		<c:if test="${logID != null }">
			<div>
				<button type="button" class="input_button" id="login_btn1"
					onclick="location.href='footballf'">글쓰기</button>
			</div>
		</c:if>
	</div>
</body>
</html>