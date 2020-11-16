<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매칭</title>
<script src="resources/jqLib/axST01.js"></script>
<style>
#matching_num {
	width: 50%;
	height: 50px;
	background-color: yellow;
	margin: 30px auto;
	display: flex;
}

#matching_num>span {
	flex: 0 0 70%
}

#matching_num>button {
	flex: 0 0 30%
}

#matching_id {
	border: 1px solid gray;
	min-height: 300px;
	padding: 15px;
	font-size: 20px;
	display: flex;
}

#matching_id>div:first-of-type {
	flex: 0 0 50%;
	text-align: center;
}

#matching_id>div:last-of-type {
	flex: 0 0 50%;
	text-align: center;
}

.matching_innerDiv> div {
	margin: 20px 0;
}
</style>

<script>
		function matching() {
			open('matching' + "?seq=${matching_team.seq}&id=${logID}");
			window.close();
		}
		
		function partyplay() {
			open('partyplay' + "?seq=${matching_team.seq}");
		}
</script>
</head>
<body>
	<div>
		<c:if test="${logID != null }">
			<c:if test="${matching_team.team == '팀'}">
				<div id="matching_num">
					<span>${matching_team.person}팀 모집중</span>
					<button onclick="matching()">신청</button>
				</div>
			</c:if>
			<c:if test="${matching_team.team == '개인'}">
				<div id="matching_num">
					<span>${matching_team.person}명 모집중</span>
					<button onclick="matching()">신청</button>
				</div>
			</c:if>
		</c:if>
		<div id="matching_id">
			<div class="matching_innerDiv">
			<c:forEach var="matching"  items="${matching}"  begin="0" end="5">
				<div>
					<span><c:out value="${matching.matching_id}"/></span>
							<button onclick="partyplay()">확인</button>
				</div>
				</c:forEach>
			</div>
			<div class="matching_innerDiv">
				<div>
					<!-- <span>banana</span>
					<button>확인</button> -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>