<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>joinForm</title>
<script src="resources/jqLib/jquery-3.2.1.min.js"></script>
<script src="resources/jqLib/memberCheck.js"></script>
<link rel="stylesheet" media="only screen and (min-width:981px)">
<link rel="stylesheet" media="only screen and (max-width:980px)">
<script>
var iCheck=false;
var pCheck=false;
var repCheck=false; /* repwMessage */
var nCheck=false;
var niCheck=false;
var eCheck=false;
var bCheck=false;


$(function(){
   $('#id').focus();
   $('#id').focusout(function(){
      iCheck = idCheck();
   });
   $('#password').focusout(function(){
      pCheck = pwCheck(); 
   });
   $('#repassword').focusout(function(){  /* repassword */
      repCheck = repwCheck();  /* repCheck */
   });

   $('#name').focusout(function(){
      nCheck = nmCheck();
   });

   $('#nickname').focusout(function(){
      niCheck = nickCheck();
   });
   
   $('#email').focusout(function(){
      eCheck = emailCheck();
   });

   $('#birthd').focusout(function(){
      bCheck = birthdCheck();
   });

});//ready
   
//3) 전체적으로 입력 오류 가 없음을 확인하고 submit 처리
function inCheck(){
   if (iCheck==false) {
	   alert("incheckID "+iCheck);
      $('#idMessage').html('아이디 를 확인 하세요.');
      $('#id').focus();
   }
   if (pCheck==false) {
	   alert("incheckP "+pCheck);
      $('#pwMessage').html('비밀번호 를 확인 하세요 ~~');
      $('#password').focus();
   }
   if (repCheck==false) {
	   alert("incheckREP "+repCheck);
      $('#repwMessage').html('비밀번호확인 를 확인 하세요 ~~');
      $('#repassword').focus();
   }
   if (nCheck==false) {
	   alert("incheckN "+nCheck);
      $('#nameMessage').html('이름 을 확인 하세요 ~~');
      $('#name').focus();
   }
   if (niCheck==false) {
	   alert("incheckNick "+nickCheck);
      $('#nickMessage').html('닉네임 을 확인 하세요 ~~');
      $('#nickname').focus();
   }

   if (eCheck==false) {
	   alert("incheckE "+eCheck);
      $('#emailMessage').html('e-mail 주소 를 확인 하세요.');
      $('#email').focus();
   }
   if (bCheck==false) {
	   alert("incheckB "+bCheck);
      $('#birthdMessage').html('생년월일을 확인 하세요.');
      $('#birthd').focus();
   }
   if (iCheck==true && pCheck==true && repCheck==true && nCheck==true &&
	   niCheck==true && eCheck==true && bCheck==true ) {
        return true;
        } else return false;
	} // inCheck()
</script>

<script> 
//** 2. ID 중복 확인하기 ( idDupCheck )
//2.1) ID 입력 오류 확인 : 길이, 영문과 숫자만 입력 가능
//2.2) 중복 확인 요청 (서버로) -> window.open()
//2.3) 요청 결과에 따른 처리
//=> 중복이면 : id 다시입력 중복확인 ..반복
//=> 사용가능 : 사용 여부 확인 
//  -> yes : joinForm 에서  pw입력 ..,
//  -> no : 재 선택
//2),3) 실행 => 요청 
//-> 서버의 서블릿 (Controller) -> DB 확인 -> 결과 Page

function idDupCheck() {
   console.log('idDupCheck iCheck => '+iCheck) ;
   if (iCheck==false) {
      iCheck=idCheck();
   } else {
      // 중복 확인 요청 (서버로) -> window.open()
      // => url 요청이 서버로 전달하고 그 결과가 아래 윈도우로 Open됨.
      var url="idDupCheck?id="+$('#id').val();
      window.open(url,"_blank",
         "toolbar=no,menubar=yes,scrollbars=yes,resizable=yes,width=500,height=400");
   } // else
} // idDupCheck
</script>

<style type="text/css">
p,h2{text-align: center;}
p{
   font-size: 65px;
   font-family: cursive;
}
.message{
   color:black;
   font-weight: bold;
   
}
h2{
/*    color:#9d8e8e; */
   color:#347ab5;
}

.input_height{height: 30px; width: 250px;}
#id{width: 175px;}
.form_group{
      margin-bottom: 13px;
      text-align: center;
      
   }
.input_button{margin-left: auto; margin-right: auto;} 
.btn_group {
      width: 250px;
      margin: 0 auto;
   }
   
div{
   
}
button{
   width: 250px;
   height: 30px;
}

li{
   float: left; 
   margin-right: 20px;
   list-style: none;
}

input{
   border-color:darkgrey;
   background-color: #fafafa;
   border-radius: 8px;
}
body{
   
}
/* #first{
   
   width: 250px;
   height: 500px;
   background-color: grey;
} */

#login_btn1{
   background-color: #b2dffc;
   border: none;
   border-radius: 8px;
}

#login_btn2{
   background-color: #fafafa;
   border: none;
   border-radius: 8px;
}



.form_all{
   height:400px;
   text-align:center;
   background-image: url('resources/image/join_running.jpg');
   
}



</style>
</head>
<body>


<form action="update" method="post" enctype="multipart/form-data">

<a href="home"><p> STing</p></a>
<h2>내정보 수정</h2>
      <div class="form_all">
         <div class="form_group">
            <input type="text" name="id" id="id" class="input_height" value="${myInfo.id}" readonly="readonly">
         </div>
         
         <div class="form_group">
            <input type="password" name="password" id="password" class="input_height" placeholder="password" required>
            <div id="pwMessage" class="message"></div>
         </div>
         
         <div class="form_group">
             <input type="password" name="repassword" id="repassword" class="input_height" placeholder="password 확인" required>
            <div id="repwMessage" class="message"></div>
         </div>
         
         <div class="form_group">
            <input type="text" name="name" id="name" class="input_height" value="${myInfo.name}">
            <div id="nameMessage" class="message"></div>
         </div>
         
         <div class="form_group">
            <input type="text" name="nickname" id="nickname" class="input_height" value="${myInfo.nickname}">
            <div id="nickMessage" class="message"></div>
         </div>
 
         <div class="form_group">
            <input type="email" name="email" id="email" class="input_height"  value="${myInfo.email}">
            <div id="emailMessage" class="message"></div>
         </div>
         
         <div class="form_group">
            <input type="date" name="birthd" id="birthd" class="input_height" value="${myInfo.birthd}">
            <div id="birthdMessage" class="message"></div>
         </div>
      
         <div class="form_group">
              <input type="radio" name="gender" value="male" value="${myInfo.gender}">남
              <input type="radio" name="gender" value="female" value="${myInfo.gender}">여
         </div>
         
         <div class="form_group">
              <input type="hidden" name="matching">
         </div>
         <div class="form_group">
              <input type="hidden" name="partyplay">
         </div>
         
		 <div class="form_group">
             <img src="" class="profile_place">
             
             
             <input type="text" name="pofile" value="${myInfo.profile}" hidden="true"><br>
             <input type="file" name="uploadfilef" id="uploadfilef"><br>
              
              
              <script>
				$('#uploadfilef').change(function(){
					if(this.files && this.files[0]){
						var reader = new FileReader;
						reader.onload = function(e){
						$(".profile_place").attr("src",e.target.result)
								.width(70).height(100);
						}//onload_function
						reader.readAsDataURL(this.files[0]);
					}//if
				});//change				
			</script>			
			 
         </div>
      </div>
      
      <div class="btn_group">
         <br>
         <button type="submit" class="input_button" id="login_btn1" >완료</button>
      </div>
<!--       <div class="btn_group">
         <br>
         <button type="button" class="input_button" id="login_btn2" onclick="location.href='home'">&nbsp;홈&nbsp; </button>
      </div> -->
      
      
      
</form>
</body>
</html>