function idCheck(){
	var id=$('#id').val();
	if (id.length<4) {
		$('#idMessage').html('id는 4글자 이상 입력 하세요.');
		$('#id').focus();
		return false;
	}else if (id.replace(/[a-z.0-9]/gi,'').length > 0) {
		$('#idMessage').html('id는 영문자, 숫자 로만 입력 하세요.');
		$('#id').focus();
		return false;
	}else {
		$('#idMessage').html('');
		return true;
	}
}

//****************************************************************************************************************************************
function pwCheck(){
	var password=$('#password').val();
	var pLength=password.length;
	if (pLength<8) {
		$('#pwMessage').html('password는 8글자 이상 가능합니다.');
		$('#password').focus();
		return false;
	}else if (password.replace(/[!-*]/gi,'').length >= pLength){
		$('#pwMessage').html('password는 특수문자를 반드시 1개 이상 입력 하세요.');
		$('#password').focus();
		return false;
	}else if (password.replace(/[0-9.!-*]/gi,'').length > 0) {
		$('#pwMessage').html('password는 숫자와 특수문자 만 입력 하세요.');
		$('#password').focus();
		return false;
	}else {
		$('#pwMessage').html('');
		return true;
	}
}

function repwCheck() {
	var passowrd = $('#password').val();
	var repassword = $('#repassword').val();

		if (passowrd.equals(repassword)) {
			$('#repwMessage').html('');
			return true;
		} else {
			$('#repwMessage').html('비밀번호가 동일 하지 않습니다.');
			$('#repassword').focus();
			return false;
		}
}

//****************************************************************************************************************************************
function nmCheck(){
	var name=$('#name').val();
	if (name.length<2) {
		$('#nameMessage').html('이름 은 2 글자 이상 입력하세요.');
		$('#name').focus();
		return false;
	}else if (name.replace(/[a-z.가-힇]/gi,'').length>0) {
		$('#nameMessage').html('이름 은 한글 또는 영문으로만 입력하세요.');
		$('#name').focus();
		return false;
	}else {
		$('#nameMessage').html('');
		return true;
	}
}

//****************************************************************************************************************************************

function nickCheck(){
	var nickname=$('#nickname').val();
	if (nickname.length<2) {
		$('#nickMessage').html('닉네임 은 2 글자 이상 입력하세요.');
		$('#nickname').focus();
		return false;
	}else if (nickname.replace(/[a-z.가-힇]/gi,'').length>0) {
		$('#nickMessage').html('닉네임 은 한글 또는 영문으로만 입력하세요.');
		$('#nickname').focus();
		return false;
	}else {
		$('#nickMessage').html('');
		return true;
	}
}

//****************************************************************************************************************************************

function emailCheck(){
	var email=$('#email').val();
	if (email.length<5) {
		$('#emailMessage').html('이메일은 5 글자 이상 입력하세요.');
		$('#email').focus();
		return false;
	}else if (email.replace().length>0) {
		$('#emailMessage').html('이메일 형식에 맞게 입력하세요.');
		$('#email').focus();
		return false;
	}else {
		$('#emailMessage').html('');
		return true;
	}
}

//****************************************************************************************************************************************


//birthDay Check
//=> 년.월.일 을 입력했는지..
//yyyy-mm-dd : length 10
function birthdCheck(){
	var birthd=$('#birthd').val();
	if (birthd.length !=10) {
		$('#birthMessage').html('생년월일을 yyyy-mm-dd 정확하게 입력하세요.');
		$('#birthd').focus();
		return false;
	}else {
		$('#bMessage').html('');
		return true;
	}
}

//****************************************************************************************************************************************
/*//point Check
//=> 정수 인지 확인
//		숫자확인 : isNumeric
//		"." 이 포함되면 안됨
function poCheck(){
	var point=$('#point').val();
	var poLength=point.length;
	if ( $.isNumeric(point)==false || point.replace(/[.]/g,'').length < poLength) {
		$('#oMessage').html('~~ point 값은 정수로 만 입력 하세요 ~~');
		$('#point').focus();
		return false;
	}else {
		$('#oMessage').html('');
		return true;
	}
}

//****************************************************************************************************************************************
//weight Check
//=> 실수 인지 확인
//		숫자확인 : isNumeric
//		구간 확인 (DB 의 제약조건과 동일)
function weCheck(){
	var weight=$('#weight').val();
	if ($.isNumeric(weight)==false) {
		$('#wMessage').html('~~ weight 값은 숫자로  입력 하세요 ~~');
		$('#weight').focus();
		return false;
	}else if ( parseFloat(weight)<20  || parseFloat(weight)>200) {
		$('#wMessage').html('~~ weight 값이 범위를 벗어납니다 ~~');
		$('#weight').focus();
		return false;
	}else {
		$('#wMessage').html('');
		return true;
	}
}*/
