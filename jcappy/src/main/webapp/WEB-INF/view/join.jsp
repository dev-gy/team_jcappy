<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/view/include/top.jsp" %>
        <div id="container">
			<div id="container">
            <div class="join_content">
                <div class="title">
                    <h1 class="cstyle_h1">Join</h1>
                </div>
                <form action="메인페이지.html" method="post" class="join_form">
                    <input type="text" class="join_input" name="id" placeholder="이메일" required="required"/><br>
                    <input type="password" class="join_input" id="pwd1" placeholder="비밀번호" required="required"/><br>
                    <input type="password" class="join_input" id="pwd2" placeholder="비밀번호 확인" required="required"/><br><br>
                    <div class="join_alert alert-success" id="alert-success">비밀번호가 일치합니다.</div> 
                    <div class="join_alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div><br>
                    <input type="text" class="join_input" name="name" placeholder="이름을(를) 입력하세요" required="required"/><br>
                    <input type="text" class="join_input" name="telNumber" placeholder="연락처" required="required"/><br><br>
                    <input type="text" class="join_input" name="address1" placeholder="주소" required="required"/><br>
                    <input type="text" class="join_input" name="address2" placeholder="상세주소" required="required"/><br><br>
                    <input class="cstyle_btn ex" type="submit" id="submit" value="가입하기"/>
                </form>
            </div>
        </div>
        </div>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>
</html>