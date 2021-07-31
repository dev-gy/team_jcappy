<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
                <form action="login" method="post" class="login_form">
                    <input type="text" class="login_input" name="memail" id="memail" placeholder="이메일" required="required" value="${membersVo.memail }"/><br>
                    <input type="password" class="login_input" name="mpwd" id="mpwd" placeholder="비밀번호" required="required"/><br>
                    <div class="login_checkbox">
                        <input type="checkbox" name="checkMemail" value="check"<c:if test="${!empty membersVo.memail}">checked</c:if>> 이메일 저장
                    </div>
                    <input class="cstyle_btn ex" type="submit" id="submit" value="로그인" alt="로그인" onclick=""/>
                </form>
                <div class="login_link">
                    <a href="/jcappy/policy/agreement.do" id="join">회원가입</a>
                    <a href="/jcappy/findEmail" id="find">아이디·비밀번호 찾기</a>
                </div>

            </div>
        </div>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>
</html>

