<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>농구 글쓰기</title>
<script src="resources/jqLib/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.11.3.min.js"/>"></script>
<script src="resources/jqLib/memberCheck.js"></script>
<script type="text/javascript" src="<c:url value="/resources/smarteditor/js/HuskyEZCreator.js"/>" charset="utf-8"></script>
<script type="text/javascript" charset="utf-8" src="<c:url value="/resources/js/writeForm.js"/>"></script>

<link rel="stylesheet" href="<c:url value="/resources/css/common.css"/>"/>
<link rel="stylesheet" type="text/css" href="/resources/css/test.css">
	
<link rel="stylesheet" media="only screen and (min-width:981px)">
<link rel="stylesheet" media="only screen and (max-width:980px)">

<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>

<style>
h3{
	color:#347ab5;
}
.bord_header{
	padding-bottom: 100px;
	margin-top: 300px;
}
.this_board{
	margin-left: 50px;
	float:left;
}
.board_button{
	width: 120px;
	height: 80px;
	font-size: 20px;
	background-color:#347ab5;
	color:white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}
.board_title{
	height: 80px;
	text-align:center;
	float:left;
	margin-left: 50px;
	
}
.board_all{clear: left;}

.label_title {
    display: block;
    text-align: center;
    line-height: 35px;
  	
  	width: 120px;
    /* width: 70px; */
    height:35px;
    float: left;
    clear:both;
    border-radius:8px;
    background-color: #b2dffc;
    margin-right: 10px;
    margin-bottom: 10px;
}

.label_file {
    display: block;
    text-align: center;
    line-height: 35px;
  	
  	width: 120px;
    /* width: 70px; */
    height:35px;
    float: left;
    clear:both;
    border-radius:8px;
    background-color: #b2dffc;
    margin-right: 10px;
    margin-bottom: 10px;
}

.label_content {
    display: block;
    text-align: center;
    line-height: 300px;
  	
  	width: 120px;
    /* width: 70px; */
    height:300px;
    float:left;
    clear : both;
    
    border-radius:8px;
    background-color: #b2dffc;
    margin-right: 10px;
}
.input_title{
	width: 600px;
	height: 30px;
	border-radius:8px;
	float: left;
	
}

.input_content{
	width: 600px;
	height:300px;
	float:left;
	border-radius:8px;
	
}
.board_all{
	
	margin-left: 50px;
}
.div_title{
	
}
.button_file{
	width: 60px;
	height: 27px;
	line-height:27px;
	font-size: 18px;
	float: left;
	background-color: #ea4335;
	border: none;
	border-radius: 5px;
	color: white;
	cursor: pointer;
	
	
}
#button_image{
	margin-right: 10px;
	cursor: pointer;
	
}
.div_file{
	
}
.div_btn{
	/* width: 688px; */
	width: 738px;
	height: 50px;
	
}
.input_button{
	width: 50px;
	height: 30px;
	font-size: 16px;
	margin-top: 10px;
	background-color: #fbbc05;
	border: none;
	border-radius: 5px;
	color: white;
}

#login_btn1{
	float: right;
	margin-left: 10px;
	cursor: pointer;
}
#login_btn2{
	float: right;
	cursor: pointer;
}

.input_content{
	font-size: 20px;
	font-weight: bold;
	color:#347ab5; 
}
.label_Configuration{
	display: block;
    text-align: center;
    line-height: 35px;
  	
  	width: 120px;
    /* width: 70px; */
    height:35px;
    float: left;
    clear:both;
    border-radius:8px;
    background-color: #b2dffc;
    margin-right: 10px;
    margin-bottom: 10px;
}
select{
	float: left;
	height: 30px;
	border-radius:8px;
	background-color: #f8f8f8;
	cursor: pointer;
}

#category{
	margin-right: 10px;
}
#good{
	margin-right: 10px;
}
#test_button{
	width: 60px;
	height: 27px;
	line-height:27px;
	font-size: 18px;
	float: left;
	background-color: #ea4335;
	border: none;
	border-radius: 5px;
	color: white;
	cursor: pointer;
}
#file { display:none; } 

</style>


</head>
<body>
<form action="basketball_Update" method="post" enctype="multipart/form-data" id="frm">
<div class="bord_header">
	<div class="this_board">
	<button type="button" class="board_button" id="board_button" onclick="location.href='basketball_Board'">농구 게시판 </button>
	</div>
	<div class="board_title">
		<h3> STing 을 통해 </h3>
		<h3>운동 파트너를 찾아보세요.</h3>
	</div>
</div>
<input type="hidden" name="id" value="${logID}">
<input type="hidden" name="nickname" value="${logNickname}">
<div class="board_all">
	<input type="hidden" name="seq" value="${Detail.seq}" >
	<div class="div_title">
		<label class="label_title">제&nbsp;목</label>
		<input type="text" name="title" id="" class="input_title" value="${Detail.title}" placeholder="제목입력" maxlength= 30 required>
	</div>
	
	<div class="Configuration">
		<label class="label_Configuration">구&nbsp;성</label>
		<select onchange="categoryChange(this)" id="category" name="team">
			<option>${Detail.team}</option>			
			<option value="팀">팀</option>
			<option value="개인">개인</option>
		</select>

		<select id="good" name="person">
			<option>${Detail.person}</option>
		</select>
		
		<select id="select_local" name="local" >
			<option>${Detail.local}</option>
			<option>서울</option>
			<option>인천</option>
			<option>경기북부</option>
			<option>경기남부</option>
		</select>
		<script>
	function categoryChange(e) {
	var good_a = ['1팀', '2팀', '3팀'];
	var good_b = ["1명", "2명", "3명", "4명", "5명", "7명이상", "10명이상"];
	var target = document.getElementById("good");

	if(e.value == "팀") var d = good_a;
	else var d = good_b;

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
		
		<button type="button" class="button_file" id="button_image" onclick="location.href='image'">사진</button>
		<button type="button" class="button_file" id="button_map" onclick="location.href='map'">지도</button>
		
	<div class="div_content">
		<!-- <label class="label_content">내&nbsp;용</label> -->
		<textarea name="content" id="smarteditor" class="input_content"  placeholder="제목입력" maxlength="2048"  style="resize: none; overflow-y:scroll; "  required>${Detail.content}</textarea>
			
	</div>
	
	<div class="div_btn">
		<div class="btn_group">
			<button type="button" class="input_button" id="login_btn1" onclick="location.href='home'">&nbsp;홈&nbsp;</button>
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