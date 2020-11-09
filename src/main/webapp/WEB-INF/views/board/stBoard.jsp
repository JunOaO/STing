<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/jqLib/top.css">
<title>게시판</title>
<style>

#boardView {
   width: 1000px;
   clear: both;
   position: absolute;
   left: calc(50% - 500px);
   top: 400px;
}
</style>

</head>
<body>
   <form action="">
      <div id="search">
         <a href="home">
         <img src="resources/image/logo_transparent.png"
            width="200px" height="200px">
         </a>
         <input type="text" class="search">
         <input type="button" value="확인" class="search">
      </div>

      <ul class="navbar">
         <li class="menubar">축구
            <ul class="menubar2">
               <li><a href="stBoard">서울</a></li>
               <li><a href="#">경기도</a></li>
               <li><a href="#">성남</a></li>
               <li><a href="#">광주</a></li>
            </ul>
         </li>
         <li class="menubar">야구
            <ul class="menubar2">
               <li><a href="#">서울</a></li>
               <li><a href="#">경기도</a></li>
               <li><a href="#">성남</a></li>
               <li><a href="#">광주</a></li>
            </ul>
         </li>
         <li class="menubar">농구
            <ul class="menubar2">
               <li><a href="#">서울</a></li>
               <li><a href="#">경기도</a></li>
               <li><a href="#">성남</a></li>
               <li><a href="#">광주</a></li>
            </ul>
         </li>
         <li class="menubar">자전거
            <ul class="menubar2">
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
            <a href="#">회원가입</a>&nbsp;&nbsp; <a href="#">ID/PW 찾기</a>
         </div>
      </div>
   </form>

   <table board="0" id="boardView">
      <tr align="center" height=30 bgcolor="green">
         <td width="100px">글 번호</td>
         <td width="650px">제목</td>
         <td width="100px">닉네임</td>
         <td width="100px">날짜</td>
         <td width="50px">조회수</td>
      </tr>
      <c:forEach var="blist" items="${blist}">
      	<tr align="center" height="30px">
      		<td>${blist.seq}</td>
      		<td>${blist.title}</td>
      		<td>${blist.nickname}</td>
      		<td>${blist.regdate}</td>
      		<td>${blist.cnt}</td>
      	</tr>
      </c:forEach>
      <a href="binsertf">새글</a>
   </table>
</body>
</html>