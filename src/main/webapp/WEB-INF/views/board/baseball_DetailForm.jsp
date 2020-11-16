<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>야구 글쓰기</title>
<script src="resources/jqLib/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-1.11.3.min.js"/>"></script>
<script src="resources/jqLib/memberCheck.js"></script>
<script type="text/javascript"
	src="<c:url value="/resources/smarteditor/js/HuskyEZCreator.js"/>"
	charset="utf-8"></script>
<script type="text/javascript" charset="utf-8"
	src="<c:url value="/resources/js/writeForm.js"/>"></script>

<link rel="stylesheet" href="<c:url value="/resources/css/common.css"/>" />
<link rel="stylesheet" type="text/css" href="resources/css/test.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/baseball_DetailForm.css">
<script src="resources/jqLib/axST01.js"></script>

<link rel="stylesheet" media="only screen and (min-width:981px)">
<link rel="stylesheet" media="only screen and (max-width:980px)">

<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>

<script>

function matchingf() {
	open('matchingf'+"?seq=${Detail.seq}&id=${logID}","_blank",
	"toolbar=no,member=yes,scrollbars=yes,resizeble=yes,width=400,height=500");
}

</script>

</head>
<body>
	<form action="board_Detail" method="post" enctype="multipart/form-data">
		<div class="bord_header">
			<div class="this_board">
				<button type="button" class="board_button" id="board_button"
					onclick="location.href='baseball_Board'">야구 게시판</button>
			</div>
			<div class="board_title">
				<h3>STing 을 통해</h3>
				<h3>운동 파트너를 찾아보세요.</h3>
			</div>
		</div>
		<div id="div_all">
			<input type="hidden" name="seq" value="${Detail.seq}">
			<div id="div_title">
				<h1>${Detail.title}</h1>
			</div>
			<div id="div_id">
				<p>${Detail.id}</p>
			</div>
			<div>
				<div id="div_regdate">
					<span>${Detail.regdate}</span>
				</div>

				<div id="div_cnt">
					<span>조회수 : ${Detail.cnt}</span>
				</div>
			</div>
			<div id="div_config">
				<div id="div_team" class="div_config">${Detail.team}</div>
				<c:if test="${Detail.team == '팀' }">
					<div id="div_person" class="div_config">${Detail.person}팀</div>
				</c:if>
				<c:if test="${Detail.team == '개인' }">
					<div id="div_person" class="div_config">${Detail.person}명</div>
				</c:if>
				<div id="div_local" class="div_config">${Detail.local}</div>
				<div id="div_matching">
					<button type="button" id="button_matching" onclick="matchingf()">매칭하기</button>
				</div>
				<div id="div_delete">
					<a href="baseball_Delete?seq=${Detail.seq}" id="button_delete"
						onclick="if(!confirm('정말 삭제 하시겠습니까')){return false;}">삭제</a>
					<%-- <button type="button" id="button_delete" onclick="location.href='baseball_Delete?seq=${Detail.seq}'">삭제</button> --%>
				</div>
				<div id="div_update">
					<button type="button" id="button_update"
						onclick="location.href='board_Detail?seq=${Detail.seq}&code=U'">수정</button>

				</div>
			</div>
			<div id="div_content">
				<div id="content_in">${Detail.content}</div>
			</div>
			<div id="div_list_home">
				<div>
					<button type="button" id="button_insert"
						onclick="location.href='baseballf'">글쓰기</button>
				</div>
				<div>
					<button type="button" id="button_list"
						onclick="location.href='baseball_Board'">목록</button>
				</div>
				<div>
					<button type="button" id="button_home"
						onclick="location.href='home'">홈</button>
				</div>
			</div>
			<div>
				<textarea name="reple" id="textarea_reple" placeholder="&nbsp;댓글 입력"
					maxlength="1024" style="resize: none;"></textarea>
			</div>
			<div id="div_reple">
				<div>
					<button type="button" id="button_reple" onclick="#">작성완료</button>
				</div>
			</div>
		</div>
		<footer> </footer>


	</form>
</body>
</html>

<!-- direction: ltr;
line-height: 1.34;
font-family: Helvetica, Arial, sans-serif;
cursor: pointer;
color: #000;
font-size: 14px;
letter-spacing: 0;
text-align: center;
white-space: nowrap;
border: 0;
height: 52px;
left: 0;
position: absolute;
top: 0;
transition: opacity 500ms;
transition-timing-function: cubic-bezier(0, .61, .28, .92);
width: 100%;
z-index: -1;
opacity: 1; -->