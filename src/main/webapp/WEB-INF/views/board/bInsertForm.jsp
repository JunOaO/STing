<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글쓰기</title>
<script src="resources/jqLib/jquery-3.2.1.min.js"></script>
<script src="resources/jqLib/memberCheck.js"></script>
<link rel="stylesheet" media="only screen and (min-width:981px)">
<link rel="stylesheet" media="only screen and (max-width:980px)">
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
	font-size: 25px;
	background-color:#347ab5;
	color:white;
	border: none;
	border-radius: 5px;
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
  	
  	
    width: 70px;
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
  	
  	
    width: 70px;
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
  	
  	
    width: 70px;
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
	float: left;
	border-radius:8px;
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
	
	
}
#button_image{
	margin-right: 10px;
	
}
.div_file{
	
}
.div_btn{
	width: 688px;
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
}
#login_btn2{
	float: right;
}



</style>
</head>
<body>
<form action="binsert" method="post">
<div class="bord_header">
	<div class="this_board">
	<button type="button" class="board_button" id="board_button" onclick="location.href='football_board'">축&nbsp;&nbsp;구 </button>
	</div>
	<div class="board_title">
		<h3> STing 을 통해 </h3>
		<h3>운동 파트너를 찾아보세요.</h3>
	</div>
</div>

<div class="board_all">
	<div class="div_title">
		<label class="label_title">제&nbsp;목</label>
		<input type="text" name="" id="" class="input_title" value="" placeholder="제목입력" required>
	</div>
	<div class="div_file">
		<label class="label_file">첨부파일</label>
		<button type="button" class="button_file" id="button_image" onclick="location.href='image'">사진</button>
		<button type="button" class="button_file" id="button_map" onclick="location.href='map'">지도</button>
	</div>
	<div class="div_content">
		<label class="label_content">내&nbsp;용</label>
		<input type="text" name="" id="" class="input_content" value="" placeholder="제목입력" required>
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
</form>
</body>
</html>