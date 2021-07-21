<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>회원가입</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!--제이쿼리 스크립트-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!--제이쿼리 ui-->
    <script src="/jcappy/js/sign_up.js"></script>
    <link rel="stylesheet" href="/jcappy/css/reset.css">
    <link rel="stylesheet" href="/jcappy/css/sign_up.css">

</head>
<body>
    <div class="signIn_wrap">
        <div class="header">HEADER</div>
        <div class="signIn_content">
            <p class="signIn_p">Join</p>
            <form action="메인페이지.html" method="post" class="signIn_form">
                <input type="text" name="id" placeholder="이메일" required="required" style="height: 30px;" width="30px"/><br>
                <input type="password" id="pwd1" placeholder="비밀번호" required="required" style="height: 30px;" width="30px"/><br>
                <input type="password" id="pwd2" placeholder="비밀번호 확인" required="required" style="height: 30px;" width="30px"/><br><br>
                <div class="signIn_alert alert-success" id="alert-success">비밀번호가 일치합니다.</div> 
                <div class="signIn_alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div><br>
                <input type="text" name="name" placeholder="이름을(를) 입력하세요" required="required" style="height: 30px;" width="30px"/><br>
                <input type="text" name="telNumber" placeholder="연락처" required="required" style="height: 30px;" width="30px"/><br><br>
                <input type="text" name="address1" placeholder="주소" required="required" style="height: 30px;" width="30px"/><br>
                <input type="text" name="address2" placeholder="상세주소" required="required" style="height: 30px;" width="30px"/><br><br>
                <input class="signIn_button" type="submit" id="submit" style="background-color: #999;" value="가입하기"/>
            </form>
        </div>
        <div class="footer">FOOTER</div>
    </div>
</body>
</html>