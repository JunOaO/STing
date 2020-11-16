<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Spring Project </title>
<script src="resources/jqLib/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/jqLib/myStyle.css" >

<style type="text/css">
	h1{text-align: center;}
	#img{text-align: center;}
	p{text-align: right;}
	.btn{float: right;}
	.info{text-align: right;}
	#button_home{
		width: 60px;
		height: 3opx;
		text-align:center;
		
	}
	#div_button{text-align: center;
	}

</style>	

</head>
<body>
<h1> 회원 목록 </h1>

<div id="img"><img src="resources/image/unnamed.gif" width="600" height="400"></div>
<br><br>
<div id="div_button">
<input type="button" value="HOME" id="button_home" onclick="location.href='home'">
</div>
<br><br>
<table width=800 style="margin-left: auto; margin-right: auto;">
	<tr align="center" height="30" bgcolor="white">
		<td>I      D</td>
		<td>PASSWORD</td>
		<td>name </td>
		<td>nickname  </td>
		<td>email </td>
		<td>birthd  </td>
		<td>gender </td>
		<td>matching  </td>
		<td>partyplay  </td>
		<td>profile   </td>
	</tr>
<c:forEach var="list" items="${Banana}" >
  <tr align="center" height="30">
  <td><c:if test="${logID=='admin'}">
  		<a href="detail?id=${list.id}">${list.id}</a>
  </c:if>
  <c:if test="${logID != 'admin'}">${list.id}</c:if>
  </td>
	<td>${list.password}</td>
	<td>${list.name}</td>
	<td>${list.nickname}</td>
	<td>${list.email}</td>
	<td>${list.birthd}</td>
	<td>${list.gender}</td>
	<td>${list.matching}</td>
	<td>${list.partyplay}</td>
	<td>${list.profile}</td>
  </tr>
</c:forEach>
</table>
<c:if test="${message != null}">
	<br>
	${message}<br>
</c:if>
<hr>

</body>
</html>