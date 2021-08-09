<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/view/include/head.jsp"%>
<script>
$(function() {
	// 이메일 중복체크
	$('.join_content #memail').blur(function() {
		$.ajax({
			url:'<%=request.getContextPath()%>/members/isDuplicateEmail',
			data:{email:$('#memail').val()},
			async:false,
			success : function(res) {
				if (res.trim() == 'true'){
					alert('중복된 이메일입니다. 다른 이메일을 입력해주세요.');
					$('#memail').val('');
					$('#memail').focus();
				}
			}
		});	
	});
	// 연락처 중복체크
	$('.join_content #mphone').blur(function() {
		$.ajax({
			url:'<%=request.getContextPath()%>/members/isDuplicatePhone',
			data:{phone:$('#mphone').val()},
			async:false,
			success : function(res) {
				if (res.trim() == 'true'){
					alert('중복된 연락처입니다. 다른 연락처를 입력해주세요.');
					$('#mphone').val('');
					$('#mphone').focus();
				} 
			}
		});	
	});
	
	// 비밀번호 정규식
	$("form").submit(function(){
		if(!/(?=.*\d)(?=.*[a-zA-ZS])(?=.*?[#?!@$%^&*-]).{6,20}/.test($('#mpwd').val())){
			alert('비밀번호 : 영문대소문자, 숫자, 특수문자를 각 하나이상 포함한 6~20자');
			$('#mpwd').val('');
			$('#mpwd').focus();
			return false;
		}
	});
	
	// 이름 정규식
	$("form").submit(function(){
		if(!/^[가-힣a-zA-Z]{1,20}$/.test($('#mname').val())){
			alert('이름 : 한글, 영문으로 이루어진 1~20자');
	      	$('#mname').val('');
	      	$('#mname').focus();
			return false;
		}
	});	
	
 	// 연락처 정규식
	$("form").submit(function(){
		if(!/^[0-9]{9,11}$/.test($('#mphone').val())){
			alert('숫자 9~11자리로만 입력해주세요.');
			$('#mphone').val('');
			$('#mphone').focus();
			return false;
		}
	});
}); 
</script>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/view/include/top.jsp" %>
        <div id="container">
            <div class="join_content">
                <div class="title">
                    <h1 class="cstyle_h1">Join</h1>
                </div>
                <form action="insert" method="post" class="join_form" name="frm">
                    <input type="email" class="join_input" name="memail" id="memail" placeholder="이메일" required="required"/><br>
                    <input type="password" class="join_input" id="mpwd" name="mpwd" placeholder="비밀번호" required="required"/><br>
                    <input type="password" class="join_input" id="mpwd_check" name="mpwd_check"placeholder="비밀번호 확인" required="required"/><br>
                    <div class="join_alert alert-success" id="alert-success">비밀번호가 일치합니다.</div> 
                    <div class="join_alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div><br>
                    <div>비밀번호는 영문대소문자, 숫자, 특수문자를 각 하나이상 포함한 6~20자로 입력해주세요.</div><br>
                    <input type="text" class="join_input" id="mname" name="mname"  placeholder="이름을(를) 입력하세요" required="required"/><br>
                    <input type="text" class="join_input" name="mphone" id="mphone" placeholder="연락처" required="required"/><br><br>
                    <input type="text" class="join_input" name="mzipcode" id="mzipcode" placeholder="우편번호 검색" required="required" readonly onclick="daumPostcode($('#mzipcode'), $('#maddr'), $('#maddrde'));"/><br>
                    <input type="text" class="join_input" name="maddr"  id="maddr" placeholder="주소" required="required" readonly onclick="daumPostcode($('#mzipcode'), $('#maddr'), $('#maddrde'));"/><br>
                    <input type="text" class="join_input" name="maddrde" id="maddrde" placeholder="상세주소" required="required" /><br><br>
                    <input class="cstyle_btn ex" type="submit" id="submit" value="가입하기"/>
                </form>
            </div>
        </div>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>
</html>