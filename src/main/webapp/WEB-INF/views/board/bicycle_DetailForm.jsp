<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자전거 글쓰기</title>
<script src="resources/jqLib/jquery-3.2.1.min.js"></script>
<script src="resources/jqLib/memberCheck.js"></script>
<script type="text/javascript"
	src="<c:url value="/resources/smarteditor/js/HuskyEZCreator.js"/>"
	charset="utf-8"></script>
<script type="text/javascript" charset="utf-8"
	src="<c:url value="/resources/js/writeForm.js"/>"></script>

<link rel="stylesheet" href="<c:url value="/resources/css/common.css"/>" />
<link rel="stylesheet" type="text/css" href="resources/css/test.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/sports_DetailForm.css">
<script src="resources/jqLib/axST01.js"></script>

<link rel="stylesheet" media="only screen and (min-width:981px)">
<link rel="stylesheet" media="only screen and (max-width:980px)">

<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>

<script>

function matchingf() {
	open('matchingf'+"?seq=${Detail.seq}&id=${logID}&sports=bicycle","_blank",
	"toolbar=no,member=yes,scrollbars=yes,resizeble=yes,width=620,height=500");
}

</script>

</head>
<body>
	<form action="board_Detail" method="post" enctype="multipart/form-data">
		<div class="bord_header">
			<div class="this_board">
				<button type="button" class="board_button" id="board_button"
					onclick="location.href='sports?sports=bicycle'">자전거 게시판</button>
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
			<div>
				<img src="${profile2.profile}" style="width: 40px; height: 40px;"
					id="writer_profile" class="class_reple_writer_profile"
					alt="${Detail.id}">
			</div>
			<div id="div_id">
				<p>${Detail.nickname}</p>
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
				<c:if test="${logID == Detail.id }">
					<div id="div_delete">
						<a href="bicycle_Delete?seq=${Detail.seq}" id="button_delete"
							onclick="if(!confirm('정말 삭제 하시겠습니까')){return false;}">삭제</a>
						<%-- <button type="button" id="button_delete" onclick="location.href='bicycle_Delete?seq=${Detail.seq}'">삭제</button> --%>
					</div>

					<div id="div_update">
						<button type="button" id="button_update"
							onclick="location.href='bicycle_Detail?seq=${Detail.seq}&code=U&sports=bicycle'">수정</button>
					</div>
				</c:if>
			</div>
			<div id="div_content">
				<div id="content_in">${Detail.content}</div>
			</div>
			<div id="div_list_home">
				<div>
					<button type="button" id="button_insert"
						onclick="location.href='bicyclef'">글쓰기</button>
				</div>
				<div>
					<button type="button" id="button_list"
						onclick="location.href='sports?sports=bicycle'">목록</button>
				</div>
				<div>
					<button type="button" id="button_home"
						onclick="location.href='home'">홈</button>
				</div>
			</div>
		</div>
		<footer> </footer>
	</form>

	<!------------------ 댓글 =------------------------->
	<form action="comment_insert" method="post">

		<input type="hidden" value="${Detail.seq}" name="seq">
		<input type="hidden" placeholder="아이디" name="id" value="${logID}"><br>
		<input type="hidden" placeholder="닉네임" name="nickname" value="${logNickname}">
		<input type="hidden" name="sports" value="bicycle">
		<input type="hidden" name="profile" value="${logProfile}">
		<div id="div_reple_output">
			<c:forEach var="cment" items="${cment}">
				<div id="reple_output">
					<span>
					<img src="${cment.profile}"
						id="reple_writer_profile" class="class_reple_writer_profile" style="width: 40px; height: 40px;"
						alt="${cment.id}">&nbsp;${cment.nickname}
					</span>
					<span> ${cment.regdate}<br>
					</span>
					<pre>${cment.recontent}</pre>
					<a href="comment_delelte?seq=${cment.seq}&root=${cment.root}"><span>삭제</span></a>
				</div>
			</c:forEach>
		</div>
		<!-- 댓글 페이징 start -->
		<hr>
	<div align="center">
		<!-- 1) First <<, Prev < : enabled 여부 -->
		<c:if test="${pageMaker.prev && pageMaker.sPageNo>1}">
			<a href="bicycle_Detail${pageMaker.searchmakeQuery(1)}&sports=bicycle&seq=${Detail.seq}">처음</a>&nbsp;
		    <a href="bicycle_Detail${pageMaker.searchmakeQuery(pageMaker.sPageNo -1)}&sports=bicycle&seq=${Detail.seq}">이전</a>&nbsp;
      </c:if>
		<!-- 2) sPage ~ ePage까지 perPageNo값 만큼 출력 -->
		<c:forEach var="i" begin="${pageMaker.sPageNo}"
			end="${pageMaker.ePageNo}">
			<c:if test="${i==pageMaker.cri.currPage}">
				<font size="4" color="Orange">${i}&nbsp;</font>
			</c:if>
			<c:if test="${i!=pageMaker.cri.currPage}">
				<a href="bicycle_Detail${pageMaker.searchmakeQuery(i)}&sports=bicycle&seq=${Detail.seq}">${i}</a>
			</c:if>
			
			<%-- <c:out value="${pageMaker.cri.currpage==i ? 'class=active' : '' }">
         </c:out> --%>
         
		</c:forEach>
		<c:if test="${pageMaker.next && pageMaker.ePageNo >0}">
			<a href="bicycle_Detail${pageMaker.searchmakeQuery(pageMaker.ePageNo+1)}&sports=bicycle&seq=${Detail.seq}">&nbsp;다음</a>&nbsp;
		<a href="bicycle_Detail${pageMaker.searchmakeQuery(pageMaker.lastPageNo)}&sports=bicycle&seq=${Detail.seq}">마지막</a>
		</c:if>
	</div>
	<!-- 댓글 페이징 end -->
		<div id="div_reple_box">
			<div>
				<img src="${profile.profile}" width="40" height="40" id="logprofile">
				<p id="logid">${logID}</p>
			</div>
			<div>
				<textarea name="recontent" id="textarea_reple"
					placeholder="&nbsp;댓글 입력" maxlength="1024" style="resize: none;"></textarea>
				<input type="submit" id="reple_submit" value="등록">
			</div>
		</div>
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