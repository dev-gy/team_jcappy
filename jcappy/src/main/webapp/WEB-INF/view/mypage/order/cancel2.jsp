<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="css/reset.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   	<script src="/jcappy/js/mypage_ordercancel.js"></script>
    <link rel="stylesheet" href="/jcappy/css/reset.css">
    <link rel="stylesheet" href="/jcappy/css/mypage_ordercancel.css">
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
                <li><a href="mypage_main.do">주문조회</a></li>
                <li><a href="mypage_update_info.do">정보수정</a></li>
                <li><a href="">쿠폰함</a></li>
                <li><a href="">1:1문의</a></li>
                <li><a href="mypage_ordercancel.do">취소/교환/반품</a></li>
                <li><a href="javascript:del();" >회원탈퇴</a></li>
            </ul>
        </div>
        <!-- 본문 -->
        <div id="content">
            <!-- 서브메뉴 타이틀 -->
            <div class="subheader">
                <p class="subtitle">취소/교환/반품</p>
            </div>
            <!-- 서브메뉴 본문 -->
            <!-- 취소/교환/반품 -->
            <div>
                <table class="ordertable">
                    <colgroup>
                        <col>
                        <col class="col_color">
                        <col>
                        <col class="col_color">
                        <col>
                    </colgroup>
                    <tr>
                        <td>주문번호</td>
                        <td>주문상품</td>
                        <td>총주문금액</td>
                        <td>주문날짜</td>
                        <td>처리상태</td>
                    </tr>
                    <tr>
                        <td><a href="mypage_ordercanceldetail.do"><div>9999</div></a></td>
                        <td>냉장고 외1건</td>
                        <td>10,000,000원</td>
                        <td>2021-05-05</td>
                        <td>취소/교환/반품 요청</td>
                    </tr>
                    <tr>
                        <td><a href=""><div>8888</div></a></td>
                        <td>세탁기 외2건</td>
                        <td>10,000,000원</td>
                        <td>2021-05-05</td>
                        <td>취소완료</td>
                    </tr>
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