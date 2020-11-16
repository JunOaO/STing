<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<script src="resources/jqLib/jquery-3.2.1.min.js"></script>
<script src="resources/jqLib/axST01.js"></script>
<title>Home</title>
<script>
	$(function() {
		location.href = ("NewBoard");
	}); //ready
</script>
</head>
<body>
</body>
</html>



<!-- 
create  table STmember (    
id varchar2(30) primary key ,
password varchar2(30),
name varchar2(30),
nickname varchar2(30),
email varchar2(100),
birthd date ,
gender varchar2(10),
matching varchar2(5),
partplay varchar2(5),
profile varchar2(100)
);



create  table FootballBoard (    
seq number(5) primary key ,
id varchar2(20),
nickname varchar2(30),
title varchar2(200),
content varchar2(2000),
regdate date default sysdate,
team number(3),
person number(3),
local varchar2(100),
map varchar2(1000),
sports varchar2(10),
cnt number(5) default 0,
image varchar2(100));

create  table BaseballBoard (    
seq number(5) primary key ,
id varchar2(20),
nickname varchar2(30),
title varchar2(200),
content varchar2(2000),
regdate date default sysdate,
team number(3),
person number(3),
local varchar2(100),
map varchar2(1000),
sports varchar2(10),
cnt number(5) default 0,
image varchar2(100));


create  table basketballBoard (    
seq number(5) primary key ,
id varchar2(20),
nickname varchar2(30),
title varchar2(200),
content varchar2(2000),
regdate date default sysdate,
team number(3),
person number(3),
local varchar2(100),
map varchar2(1000),
sports varchar2(10),
cnt number(5) default 0,
image varchar2(100));

create  table bicycleBoard (    
seq number(5) primary key ,
id varchar2(20),
nickname varchar2(30),
title varchar2(200),
content varchar2(2000),
regdate date default sysdate,
team number(3),
person number(3),
local varchar2(100),
map varchar2(1000),
sports varchar2(10),
cnt number(5) default 0,
image varchar2(100));

create  table tennisboard (
seq number(5) primary key ,
id varchar2(20),
nickname varchar2(30),
title varchar2(200),
content varchar2(2000),
regdate date default sysdate,
team number(3),
person number(3),
local varchar2(100),
map varchar2(1000),
sports varchar2(10),
cnt number(5) default 0,
image varchar2(100));

create  table matchingboard (    
seq number(5) ,
leader_id varchar2(30),
matching_id varchar2(30)  primary key
);



 -->