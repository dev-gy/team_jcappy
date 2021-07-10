<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>쿠폰목록</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="/jcappy/css/reset.css">
   	<link rel="stylesheet" href="/jcappy/css/mypage_coupon.css">
</head>

<body>
    <!-- 헤더 -->
    <div class="header">
        <p>HEADER</p>
    </div>
    <div class="mypage_wrap">
        <!-- 마이페이지 헤더 -->
        <div id="myheader">
            <span class="myinfo">손흥민</span> 회원님의 등급은 <span class='myinfo'>VIP</span>입니다.
        </div>
        <!-- 서브메뉴 -->
        <div id='submenu'>
            <ul>
                <li><a href="mypage_main.html">주문조회</a></li>
                <li><a href="mypage_update_info.html">정보수정</a></li>
                <li><a href="">쿠폰함</a></li>
                <li><a href="">1:1문의</a></li>
                <li><a href="mypage_ordercancel.html">취소/교환/반품</a></li>
                <li><a href="javascript:del();" >회원탈퇴</a></li>
            </ul>
        </div>
        <!-- 본문 -->
        <div id="content">
            <!-- 서브메뉴 타이틀 -->
            <div class="subheader">
                <p class="subtitle">쿠폰함</p>
            </div>
            <!-- 서브메뉴 본문 -->
            <!-- 주문조회 -->
            <div>
                <table id="coupon">
                    <thead>
                        <tr>
                            <th>쿠폰명</th>
                            <th>할인 금액</th> 
                            <th>유효기간</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>생일축하합니다!!</td>
                            <td>10,000</td>
                            <td>~2021-08-31</td>
                        </tr> 
                        <tr>
                            <td>5월 개근상!!</td>
                            <td>5,000</td>
                            <td>~2021-07-30</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- 푸터 -->
    <div class="footer">
        <p>FOOTER</p>
    </div>
</body>

</html>