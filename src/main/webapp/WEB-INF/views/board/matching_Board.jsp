<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="resources/jqLib/jquery-3.2.1.min.js"></script>
<script src="resources/jqLib/axST01.js"></script>
<title>매칭</title>
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

.matching_innerDiv>div {
	margin: 20px 0;
}
</style>

<script>
	function matching() {
		location.href = "matching"
					  + "?seq=${matchingTeam.seq}"
					  + "&id=${logID}"
					  + "&sports=${matchingTeam.sports}";
	}
	
</script>
</head>
<body>
	<div>
		<c:if test="${logID != null }">
			<c:if test="${matchingTeam.team == '팀'}">
				<div id="matching_num">
					<span>${matchingTeam.person}팀 모집중</span>
					
					<c:if test="${logID != matchingTeam.id}">
					<c:if test="${idcheck2.matchingid == null}">
						<button onclick="matching()">신청</button>
					</c:if>
					</c:if>

					<c:if test="${logID == idcheck2.matchingid}">
							<script>
							var confirm = confirm("신청 목록을 확인 하시겠습니까?");
							
							if (confirm == true) {
								$(function(){
									var width = window.innerWidth;
									var height = window.innerHeight;
									
									width = 620;
									height = 1160;
									
									window.resizeTo(width, height);
									
									location.href = "detail"
							 			  		  + "?seq=${matchingTeam.seq}"
							  		  			  + "&id=${logID}"
							  		  			  + "&sports=${matchingTeam.sports}";
								});
							} else {
								self.close();
							}
							</script>
					</c:if>
					
				</div>
			</c:if>
			<c:if test="${matchingTeam.team == '개인'}">
				<div id="matching_num">
					<span>${matchingTeam.person}명 모집중</span>
					
					<c:if test="${logID != matchingTeam.id}">
					<c:if test="${idcheck2.matchingid == null}">
						<button onclick="matching()">신청</button>
					</c:if>
					</c:if>

					<c:if test="${logID == idcheck2.matchingid}">
							<script>
							var confirm = confirm("신청 목록을 확인 하시겠습니까?");
							
							if (confirm == true) {
								$(function(){
									var width = window.innerWidth;
									var height = window.innerHeight;
									
									width = 620;
									height = 1160;
									
									window.resizeTo(width, height);
									
									location.href = "detail"
							 			  		  + "?seq=${matchingTeam.seq}"
							  		  			  + "&id=${logID}"
							  		  			  + "&sports=${matchingTeam.sports}";
								});
							} else {
								self.close();
							}
							</script>
					</c:if>
				</div>
			</c:if>
		</c:if>
		<div id="matching_id">
			<div class="matching_innerDiv">
				<c:forEach var="matching" items="${matching}" begin="0" end="5">
					<div>
						<span><c:out value="${matching.matchingid}" /></span>
						<c:if test="${logID == matchingTeam.id }">
						<button>
								<a href="partyplay?seq=${matchingTeam.seq}&matchingid=${matching.matchingid}">확인</a>
						</button>
						</c:if>
					</div>
				</c:forEach>
			</div>
			<div class="matching_innerDivi">
				<div>
					<!-- <span>banana</span>
					<button>확인</button> -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>

