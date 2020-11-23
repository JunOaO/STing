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
<script src="resources/jqLib/axST01.js"></script>
<script src="resources/js/jquery-1.11.3.min.js"></script>
<script src="resources/smarteditor/js/HuskyEZCreator.js"></script>
<script src="resources/js/writeForm.js"></script>

<link rel="stylesheet" media="only screen and (min-width:981px)">
<link rel="stylesheet" media="only screen and (max-width:980px)">

<link rel="stylesheet" type="text/css"
	href="resources/css/baseball_DetailForm.css">
<link rel="stylesheet" type="text/css" href="resources/css/common.css">

<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>
<script>
	function categoryChange(e) {
		var good_a = [ '1', '2', '3' ];
		var good_b = [ "1", "2", "3", "4", "5", "7", "10" ];
		var target = document.getElementById("good");

		if (e.value == "a")
			var d = good_a;
		else
			var d = good_b;

		target.options.length = 0;

		for (x in d) {
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML = d[x];
			target.appendChild(opt);
		}
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
			<div>
				<img src="${profile.profile}" style="width: 40px; height: 40px;"
					id="writer_profile" class="class_reple_writer_profile"
					alt="${Detail.id}">
			</div>
			<div id="div_nickname">
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
				<div id="div_person" class="div_config">${Detail.person}</div>
				<div id="div_local" class="div_config">${Detail.local}</div>
				<div id="div_matching">
					<button type="button" id="button_matching"
						onclick="location.href='baseball_Board'">매칭하기</button>
				</div>
				<c:if test="${logID == Detail.id || logID == 'admin' }">
					<div id="div_delete">
						<a href="baseball_Delete?seq=${Detail.seq}" id="button_delete"
							onclick="if(!confirm('정말 삭제 하시겠습니까')){return false;}">삭제</a>
						<%-- <button type="button" id="button_delete" onclick="location.href='baseball_Delete?seq=${Detail.seq}'">삭제</button> --%>
					</div>
					<div id="div_update">
						<button type="button" id="button_update"
							onclick="location.href='board_Detail?seq=${Detail.seq}&code=U'">수정</button>
					</div>
				</c:if>
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
		</div>
	</form>
	<!------------------ 댓글 =------------------------->
	<form action="comment_insert" method="post">

		<input type="hidden" value="${Detail.seq}" name="seq"> <input
			type="hidden" placeholder="아이디" name="id" value="${logID}"><br>
		<input type="hidden" placeholder="닉네임" name="nickname"
			value="${logNickname}">

		<div id="div_reple_output">
			<c:forEach var="cment" items="${cment}">
				<div id="reple_output">
					<%-- <td style="float: left; width: 15%; margin-top: 10px;">번호 :
					${cment.root}</td>
				<td style="float: left; width: 30%; margin-top: 10px;">아이디 :
					${cment.id}</td> --%>
					<span> <img src="${profile.profile}"
						id="reple_writer_profile" class="class_reple_writer_profile"
						alt="${cment.id}">&nbsp;${cment.nickname}
					</span> <span> ${cment.regdate}<br>
					</span>
					<pre>${cment.recontent}</pre>
					<c:if test="${logID == cment.id || logID == 'admin'}">
						<a href="comment_delelte?seq=${cment.seq}&root=${cment.root}"
							onclick="if(!confirm('정말 삭제 하시겠습니까')){return false;}"><span>삭제</span></a>
					</c:if>
				</div>
			</c:forEach>
		</div>
		<div id="div_reple_box">
			<div>
				<img src="${logProfile}" width="40" height="40" id="logprofile">
				<p id="logid">${logNickname}</p>
			</div>
			<div>
				<textarea name="recontent" id="textarea_reple"
					placeholder="&nbsp;댓글 입력" maxlength="1024" style="resize: none;"></textarea>
				<input type="submit" id="reple_submit" value="등록">
			</div>
		</div>
		<div id="div_list_home_bottom">
			<div>
				<button type="button" id="button_insert_bottom"
					onclick="location.href='baseballf'">글쓰기</button>
			</div>
			<div>
				<button type="button" id="button_list_bottom"
					onclick="location.href='baseball_Board'">목록</button>
			</div>
			<div>
				<button type="button" id="button_home_bottom"
					onclick="location.href='home'">홈</button>
			</div>
		</div>
	</form>
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

