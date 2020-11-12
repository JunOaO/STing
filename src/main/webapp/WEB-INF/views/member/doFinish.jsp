<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** doFinish **</title>
</head>
<body>
<h2>** Spring MVC2 요청 처리 결과 **</h2>

<!-- ** Member ** -->
<c:if test="${fCode=='MJS'}">
	alert("로그인후 이용하세요.");
<a href="loginf">[Login]</a><br>
</c:if>
<c:if test="${fCode=='MJF'}">
&nbsp;&nbsp;&nbsp;&nbsp;입력값에 오류가 있습니다~~
<a href="#" onclick="history.back()">[다시하기]</a><br>
</c:if>


<c:if test="${fCode=='MUF'}">
 => ${message} &nbsp;&nbsp;
<a href="#" onclick="history.back()">[다시하기]</a> <br>
</c:if>
<c:if test="${fCode=='MDS'}">
 => ${message} &nbsp;&nbsp;
</c:if>

<c:if test="${fCode=='MDF'}">
 => ${message} <br>
   &nbsp;&nbsp;&nbsp;&nbsp;서비스에 장애가 발생 했습니다.&nbsp;&nbsp;잠시후 다시 하세요 ~~<br>
 <a href="#" onclick="history.back()">[이전으로]</a> <br>
</c:if>

<!-- ** Baord ** -->
<c:if test="${fCode=='BF'}">
 => ${message} &nbsp;&nbsp;
<a href="#" onclick="history.back()">[다시하기]</a> <br>
</c:if>

<hr>
<a href="home">[Home]</a>
</body>
</html>