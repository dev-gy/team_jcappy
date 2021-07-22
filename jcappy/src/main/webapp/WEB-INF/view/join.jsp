<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/view/include/top.jsp" %>
        <div id="container">
            <div class="join_content">
                <div class="title">
                    <h1 class="cstyle_h1">Join</h1>
                </div>
                <form action="insert.do" method="post" class="join_form">
                    <input type="text" class="join_input" name="memail" placeholder="이메일" required="required"/><br>
                    <input type="password" class="join_input" id="mpwd1" name="mpwd" placeholder="비밀번호" required="required"/><br>
                    <input type="password" class="join_input" id="mpwd2" name="mpwd"placeholder="비밀번호 확인" required="required"/><br><br>
                    <div class="join_alert alert-success" id="alert-success">비밀번호가 일치합니다.</div> 
                    <div class="join_alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div><br>
                    <input type="text" class="join_input" name="mname" placeholder="이름을(를) 입력하세요" required="required"/><br>
                    <input type="text" class="join_input" name="mphone" placeholder="연락처" required="required"/><br><br>
                    <input type="text" class="join_input" name="mzipcode" id="mzipcode" placeholder="우편번호" required="required" onclick="daumPostcode($('#mzipcode'), $('#maddr'), $('#maddrde'));"/><br>
                    <input type="text" class="join_input" name="maddr"  id="maddr" placeholder="주소" required="required" onclick="daumPostcode($('#mzipcode'), $('#maddr'), $('#maddrde'));"/><br>
                    <input type="text" class="join_input" name="maddrde" id="maddrde" placeholder="상세주소" required="required" /><br><br>
                    <input class="cstyle_btn ex" type="submit" id="submit" value="가입하기" onclick="/jcappy/index"/>
                </form>
            </div>
        </div>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>
</html>