<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 보기(축구)</title>
</head>
<body>
<h2>football detail</h2>
<table>

	<tr height="40"><td bgcolor="yellow">Seq</td>
		<td>${one.seq}</td></tr>
	<tr height="40"><td bgcolor="yellow">Id</td>
		<td>${one.id}</td></tr>
	<tr height="40"><td bgcolor="yellow">Nickname</td>
		<td>${one.nickname}</td></tr>
	<tr height="40"><td bgcolor="yellow">Title</td>
		<td>${one.title}</td></tr>
	<tr height="40"><td bgcolor="yellow">Content</td>
		<td>${one.content}</td></tr>
	<tr height="40"><td bgcolor="yellow">Regdate</td>
		<td>${one.regdate}</td></tr>
	<tr height="40"><td bgcolor="yellow">Cnt</td>
		<td>${one.cnt}</td></tr>

</table>
</body>
</html>