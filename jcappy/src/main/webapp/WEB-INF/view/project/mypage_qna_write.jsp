<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="css/reset.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <link rel="stylesheet" href="/jcappy/css/reset.css">
    <link rel="stylesheet" href="/jcappy/css/mypage_qna_write.css">
</head>

<body>
    <div class="wrap">
        <!-- 헤더 -->
        <div class="header">
            <p>HEADER</p>
        </div>
        <!-- 마이페이지 헤더 -->
        <div id="myheader">
            <span class="myinfo">손흥민</span> 회원님의 등급은 <span class='myinfo'>VIP</span>입니다.
        </div>
        <!-- 서브메뉴 -->
        <div id='submenu'>
            <ul>
                <li><a href="">주문조회</a></li>
                <li><a href="">정보수정</a></li>
                <li><a href="">쿠폰함</a></li>
                <li><a href="">1:1문의</a></li>
                <li><a href="">취소, 반품</a></li>
                <li><a href="">회원탈퇴</a></li>
            </ul>
        </div>
        <!-- 서브메뉴 본문 -->
        <div id="content">
            <!-- 서브메뉴 타이틀 -->
            <div class="subheader">
                <p class="subtitle">1:1 문의 작성</p>
            </div>
            <!-- 서브메뉴 본문 -->
            <div>
                <div>
                    <input class="qna_title" type="text" placeholder="제목">
                </div>
                <div>
                    <textarea class="qna_content" placeholder="내용을 입력해주세요"></textarea>
                </div>
                <div class="qna_btn_wrap">
                    <input type="button" value="작성">
                    <input type="button" value="취소">
                </div>
            
            </div>
        </div>
        <div class="footer">
            <p>FOOTER</p>
        </div>
    </div>
</body>

</html>