<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로필 이미지 수정</title>
<script src="resources/jqLib/jquery-3.2.1.min.js"></script>
<script src="resources/jqLib/memberCheck.js"></script>
<link rel="stylesheet" media="only screen and (min-width:981px)">
<link rel="stylesheet" media="only screen and (max-width:980px)">

<link rel="stylesheet" type="text/css" href="resources/css/profileUpdateForm.css">

</head>

<body>
<form action="profileupdate" method="post" enctype="multipart/form-data">
<h1>프로필 이미지 수정</h1>

<input type="file" name="uploadfilef" id="uploadfilef" hidden="true"/>
<div class="button" onclick="onclick=document.all.uploadfilef.click()">
	
<p><img src="${profile.profile}" width="90" height="90" title="이미지 클릭시 변경할수 있습니다." id="logprofile"></p>
<p id="logid">${logID}</p>
</div>

<script>
	$('#uploadfilef').change(function(){
		if(this.files && this.files[0]){
			var reader = new FileReader;
			reader.onload = function(e){
				$("#logprofile").attr("src",e.target.result)
				.width(90).height(90);
			}//onload_function
				reader.readAsDataURL(this.files[0]);
		}//if
	});//change				
</script>

	<div id="div_submit">
	<input type="submit" id="button_update"  value="완료">
	</div>
</form>


</body>
</html>




	 
	 



