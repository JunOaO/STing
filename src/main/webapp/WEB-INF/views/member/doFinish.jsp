<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** Do Finish ** </title>
</head>
<body>
<h2> ** Spring NVC2 요청 처리 결과 ** </h2>

<!-- ******************************************************************* -->

<!-- ** Member / join ** -->

<c:if test="${fCode =='MJS'}">
=>${message} <br>
&nbsp;&nbsp;&nbsp;&nbsp; 로그인후 계속 이용 하세요.
<a href="loginf">[Login]</a><br>
<a href="home">[home]</a><br>

</c:if>
<c:if test="${fCode=='MJF'}">
&nbsp;&nbsp;&nbsp;&nbsp; 입력갑에 오류가 있습니다.
<a href="#" onclick="history.back()">[다시하기]</a><br>
</c:if>

<!-- ******************************************************************* -->

<!-- ** Member / update ** -->
<c:if test="${fCode=='MUF'}">
 => ${message} &nbsp;&nbsp;
<a href="#" onclick="history.back()">[다시하기]</a> <br>
</c:if>

<!-- ******************************************************************* -->

<!-- ** Member / delete ** -->
<c:if test="${fCode=='MDS'}">
${message}
</c:if>
<c:if test="${fCode=='MDf'}">
<a href="#" onclick="history.back()">[다시하기]</a>
<button onclick="history.back(")>다시하기</button>
</c:if>
<hr>
<a href="home">[Home]</a>
</body>
</html>