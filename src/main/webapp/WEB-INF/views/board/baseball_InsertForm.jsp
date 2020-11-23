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
<link rel="stylesheet" type="text/css" href="/resources/css/test.css">

<link rel="stylesheet" type="text/css"
	href="resources/css/baseball_InsertForm.css">

<link rel="stylesheet" media="only screen and (min-width:981px)">
<link rel="stylesheet" media="only screen and (max-width:980px)">

<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>

</head>
<body>
	<form action="baseballinsert" method="post"
		enctype="multipart/form-data" id="frm">
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
		<input type="hidden" name="id" value="${logID}"> 
		<input type="hidden" name="nickname" value="${logNickname}">
		<input type = "hidden" name="sports" value="baseball">
		<div class="board_all">
			<div class="div_title">
				<label class="label_title">제&nbsp;목</label> <input type="text"
					name="title" id="" class="input_title" value="" placeholder="제목입력"
					maxlength=30 required>
			</div>

			<div class="Configuration">
				<label class="label_Configuration">구&nbsp;성</label> <select
					onchange="categoryChange(this)" id="category" name="team">
					<option>팀/개인</option>
					<option value="팀">팀</option>
					<option value="개인">개인</option>
				</select> <select id="good" name="person">
					<option>필요인원</option>
				</select> <select id="select_local" name="local">
					<option>지역</option>
					<option>서울</option>
					<option>인천</option>
					<option>경기북부</option>
					<option>경기남부</option>
				</select>
				<script>
					function categoryChange(e) {
						var good_a = [ 1, 2, 3 ];
						var good_b = [ 1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12 ];
						var target = document.getElementById("good");

						if (e.value == "팀") {
							var d = good_a;
						} else {
							var d = good_b;
						}

						target.options.length = 0;

						for (x in d) {
							var opt = document.createElement("option");
							opt.value = d[x];
							opt.innerHTML = d[x];
							target.appendChild(opt);
						}
					}
				</script>

			</div>
			<div class="div_file">
				<label class="label_file">첨부파일</label>

				<button type="button" class="button_file" id="button_image"
					onclick="location.href='image'">사진</button>
				<button type="button" class="button_file" id="button_map"
					onclick="location.href='map'">지도</button>

				<div class="div_content">
					<!-- <label class="label_content">내&nbsp;용</label> -->
					<textarea name="content" id="smarteditor" class="input_content"
						placeholder="내용입력" maxlength="2048"
						style="resize: none; overflow-y: scroll;" required></textarea>
				</div>

				<div class="div_btn">
					<div class="btn_group">
						<button type="button" class="input_button" id="login_btn1"
							onclick="location.href='home'">&nbsp;홈&nbsp;</button>
					</div>
					<div class="btn_group">
						<button type="submit" class="input_button" id="login_btn2">완료</button>
					</div>
				</div>
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