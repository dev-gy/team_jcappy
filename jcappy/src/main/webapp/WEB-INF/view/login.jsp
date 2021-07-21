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
            <div class="login_content">
                <div class="title">
                    <h1 class="cstyle_h1">Login</h1>
                </div>
                <form action="" method="post" class="login_form">
                    <input type="text" class="login_input" name="id" placeholder="이메일" required="required"/><br>
                    <input type="password" class="login_input" id="pwd1" placeholder="비밀번호" required="required"/><br>
                    <div class="login_checkbox">
                        <input type="checkbox" name="checkId"> 로그인 상태 유지
                    </div>
                    <input class="cstyle_btn ex" type="submit" id="submit" value="로그인" onclick="login();"/>
                </form>
                <div class="login_link">
                    <a href="/jcappy/join.do" id="join">회원가입</a>
                    <a href="/jcappy/findaccountpwd.do" id="find">아이디·비밀번호 찾기</a>
                </div>
            </div>
        </div>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>
</html>